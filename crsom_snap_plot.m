function [ output_args ] = crsom_snap_plot( crsom, index, in, ta )
    
   crsom.IW{1} =  crsom.userdata.history_snaps{index};
   my_plot_som(crsom, in, ta);
end
