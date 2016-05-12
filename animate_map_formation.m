function [ output_args ] = animate_map_formation( crsom, in, ta)
    snaps = length(crsom.userdata.history_snaps);

   for i=1:snaps
       subplot(3,3,i);
       crsom_snap_plot(crsom, i, in, ta);
   end
   
   subplot(3,3,snaps + 1);
   my_plot_som_no_confl(crsom, in, ta);
end

