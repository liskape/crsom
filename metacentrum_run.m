function metacentrum_run
% *************************************************************************
todo = '';
epochs = 10;
normalize = 4; % 0 = do not normalize, 1 = minmax, 2 = mapstd, 3 = minmax 0-1, 4 = minmax 0-0,5
LR2 = 0.04;
s_0 = 200;
s_end = 0.01;
settings = '';
problem = 'arctic_monkeys_albs';
map_size = 1;
net_name = create_net_name(problem, epochs, normalize, map_size, LR2, settings);
% -------------------------------------------------------------------------

    while 1
        [tf msg] = license('checkout','Neural_Network_Toolbox');
        if tf==1, break, end
        display(strcat(datestr(now),' waiting for licence '));
        pause(5);
    end 

    [crsom, in, ta, uc ] = train_problem(problem, epochs, net_name, normalize, LR2, s_0, s_end, map_size );
    save(strcat(net_name,'.mat'));
    
    my_plot_som(crsom, in, ta);
    print(net_name,'-dpng');
end

