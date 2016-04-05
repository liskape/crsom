function [ output_args ] = plotting3( crsom, uc, us, inputs, targets )
    [neurons, dims] = size(crsom.IW{1});
    nodes_size = sqrt(neurons);

     figure(1);
     subplot(2,2,1);
     my_plot_som_no_confl(us, inputs, targets);
     title('Classic trained SOM');
     
     subplot(2,2,2);
     my_plot_som_no_confl(crsom, inputs, targets);  
     title(crsom.userdata.net_name);
 
     subplot(2,2,4);
     my_plot_som_no_confl(uc, inputs, targets);
     title('CRSOM before training (only configured)');
     
     subplot(2,2,3);
     plot_error(crsom);
     title('CRSOM error');
     
%      figure(2)  
%      plotsompos(crsom, inputs);
%      title('plotsompos for trained CRSOM');
% 
%      figure(3)
%      plotsomnd(crsom);
%      title('plotsomnd for trained CRSOM');
     
     figure(2);
     animate_map_formation2( crsom, inputs, targets);
     title(crsom.userdata.net_name);
     
     figure(3);
     plot_crsom_attrs(crsom);
     title(crsom.userdata.net_name); 
     
%      figure(5);
%      animate_position_formation(crsom, inputs);
%      title(crsom.userdata.net_name);
     
%     figure(6);
%     plotsompos(som, inputs);
%     SRI(crsom, inputs, targets);
end

