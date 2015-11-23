function [ output_args ] = plottings( crsom, uc, inputs, targets )
    [neurons, dims] = size(crsom.IW{1});
    nodes_size = sqrt(neurons);
    som = selforgmap([nodes_size nodes_size],10, 3, 'gridtop', 'dist');
    som.trainParam.showWindow = false;
    som = train(som, inputs);
     
     figure(1);
     subplot(2,2,1)
     my_plot_som(som, inputs, targets);
     title('Classic trained SOM');
     
     subplot(2,2,2)
     my_plot_som(crsom, inputs, targets);  
     title(crsom.userdata.net_name);
 
     subplot(2,2,4)
     my_plot_som(uc, inputs, targets);
     title('CRSOM before training (only configured)');
     
     subplot(2,2,3)
     plot_error(crsom);
     title('CRSOM error');
     
%      figure(2)  
%      plotsompos(crsom, inputs);
%      title('plotsompos for trained CRSOM');
% 
%      figure(3)
%      plotsomnd(crsom);
%      title('plotsomnd for trained CRSOM');
     
     figure(4)
     animate_map_formation( crsom, inputs, targets);
     title(crsom.userdata.net_name);
     
end

