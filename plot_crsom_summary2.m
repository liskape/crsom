function [ output_args ] = plot_crsom_summary2( crsom, us, uc, inputs, targets )
     figure(1);
     subplot(2,2,1);
     plot_crsom_crosses(us, inputs, targets);
     title('Classic trained SOM');
     
     subplot(2,2,2);
     plot_crsom_crosses(crsom, inputs, targets);  
     title(crsom.userdata.net_name);
 
     subplot(2,2,4);
     plot_crsom_crosses(uc, inputs, targets);
     title('CRSOM before training (only configured)');
     
     subplot(2,2,3);
     plot_error(crsom);
     title('CRSOM error');

end

