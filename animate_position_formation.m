function [ output_args ] = animate_position_formation( crsom, in, ta)
plotsompos(crsom, in);
    for i=1:8
       crsom_snap_plot_pos(crsom, 9 - i, in);
   end

end

