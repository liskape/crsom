function [ output_args ] = animate_map_formation( crsom, in, ta)
   for i=1:8
       subplot(3,3,i);
       crsom_snap_plot(crsom, i, in, ta);
   end
   
   subplot(3,3,9);
   my_plot_som(crsom, in, ta);
end

