function metacentrum_run    
% *************************************************************************
todo = 'compare with other led_b_*';
epochs = 200;
normalize = 2; % 0 = do not normalize, 1 = minmax, 2 = mapstd  
LR2 = 0.25;
s_0 = 200;
s_end = 0.01;
settings = 'random_weights'; 
problem = 'led_b';
map_size = 1;
net_name = sprintf('%s_epochs=%d_normalize=%i_mapsize=%.2f_LR2=%.2f_s_0=%d_s_end=%.2f_%s', problem, epochs, normalize,map_size, LR2, s_0, s_end,settings);
% net_name = 'dunno'
% -------------------------------------------------------------------------

    while 1
        [tf msg] = license('checkout','Neural_Network_Toolbox');
        if tf==1, break, end
        display(strcat(datestr(now),' waiting for licence '));
        pause(5);
    end 

    [crsom, in, ta, uc ] = train_led_b(epochs, net_name, normalize, LR2, s_0, s_end, map_size );
    save(strcat(net_name,'.mat'));
    
%     delete this shit
%     plotsompos(crsom, in);
%     savefig(strcat(net_name, '.fig'));
end

