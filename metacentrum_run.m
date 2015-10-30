function [ output_args ] = metacentrum_run( )
    while 1
        [tf msg] = license('checkout','Neural_Network_Toolbox');
        if tf==1, break, end
        display(strcat(datestr(now),' waiting for licence '));
        pause(5);
    end 
    
    net_name = 'wine_som-cn2-denorm-conf-1000-epochs'
    
    som = train_wine(1000, net_name);
    save(strcat(net_name,'.mat'), 'som');
end

