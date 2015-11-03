function [ output_args ] = metacentrum_run( )
    while 1
        [tf msg] = license('checkout','Neural_Network_Toolbox');
        if tf==1, break, end
        display(strcat(datestr(now),' waiting for licence '));
        pause(5);
    end 

    net_name = 'train_wine_v3'
    
    som = train_wine(30000, net_name);
    save(strcat(net_name,'.mat'), 'som');
    
% copy train_wine to insert variables
% [dummy_net, n, t] = train_wine_short(10) - input and targets
% my_plot_som(som, n, t)
% plotsompos(som) - compare to dummy_net
% plotsomhits(som, n)
end

