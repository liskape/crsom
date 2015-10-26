function [ output_args ] = somplots( som, inputs, targets, errors  )
    figure(1);
    plot(1:length(errors), errors);
    
    figure(2);
    my_plot_som(som, inputs, targets);
    
    figure(3);
    plotsomhits(som, inputs);
   
    
    figure(4);
    plotsompos(som);
    
    figure(5);
    plotsomnd(som); 
end

