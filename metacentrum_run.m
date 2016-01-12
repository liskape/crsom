function metacentrum_run
% *************************************************************************
todo = '';
epochs = 1000;
normalize = 4; % 0 = do not normalize, 1 = minmax, 2 = mapstd, 3 = minmax 0-1, 4 = minmax 0-0,5
LR2 = 0.1;
s_0 = 200;
s_end = 0.01;
settings = ''; 
problem = 'katy_soad_2';
map_size = 1;
net_name = sprintf('%s_ep=%d_norm=%i_size=%.2f_LR2=%.2f_%s', problem, epochs, normalize,map_size, LR2,settings);
% net_name = 'dunno3'
% -------------------------------------------------------------------------

    while 1
        [tf msg] = license('checkout','Neural_Network_Toolbox');
        if tf==1, break, end
        display(strcat(datestr(now),' waiting for licence '));
        pause(5);
    end 

    [crsom, in, ta, uc ] = train_katy_soad_2(epochs, net_name, normalize, LR2, s_0, s_end, map_size );
    save(strcat(net_name,'.mat'));
    
%     delete this shit
%     plotsompos(crsom, in);
%     savefig(strcat(net_name, '.fig'));
end

