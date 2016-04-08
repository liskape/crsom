function [ output_args ] = plot_crsom_summary( crsom, us, uc, inputs, targets )
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

end

