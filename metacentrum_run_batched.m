function metacentrum_run_batched(p, lr, e, n, ms)
% *************************************************************************
epochs = e;
normalize = n; % 0 = do not normalize, 1 = minmax, 2 = mapstd, 3 = minmax 0-1, 4 = minmax 0-0,5
LR2 = lr;
settings = '';
problem = p;
map_size = ms;
net_name = create_net_name(problem, epochs, normalize, map_size, LR2, settings);
% -------------------------------------------------------------------------

    while 1
        [tf msg] = license('checkout','Neural_Network_Toolbox');
        if tf==1, break, end
        display(strcat(datestr(now),' waiting for licence '));
        pause(5);
    end 

    [crsom, in, ta, uc, us ] = train_problem(problem, epochs, net_name, normalize, LR2, 200, 0.01, map_size );
    save(strcat(net_name,'.mat'));
    
    my_plot_som(crsom, in, ta);
    title(net_name);
    print(strcat(net_name,'.png'), '-dpng');
end

