function [ output_args ] = plottings( crsom, inputs, targets )
    [neurons, dims] = size(crsom.IW{1});
    nodes_size = sqrt(neurons);
    som = selforgmap([nodes_size nodes_size],10, 3, 'gridtop', 'dist');
        som.trainParam.showWindow = false;
     som = train(som, inputs);
     
     figure(1);
     my_plot_som(som, inputs, targets);
     
     figure(2);
     my_plot_som(crsom, inputs, targets);  
     
     figure(3);
     plot_error(crsom);
     
     figure(4);
     plotsompos(crsom)
     
     figure(5);
     plotsomnd(crsom);
end

