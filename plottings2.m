function [ output_args ] = plottings2( crsom, uc, inputs, targets )
    [neurons, dims] = size(crsom.IW{1});
    nodes_size = sqrt(neurons);
    som = selforgmap([nodes_size nodes_size],10, 3, 'gridtop', 'dist');
    som.trainParam.showWindow = false;
    som = train(som, inputs);
     
     figure(1);
     my_plot_som(som, inputs, targets);
     title('SOM');
     
     figure(2);
     my_plot_som(crsom, inputs, targets);  
     title('CRSOM');
end

