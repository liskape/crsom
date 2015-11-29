function [ output_args ] = animate_position_formation( crsom, in, ta)
    plotsompos(crsom, in);
    snaps = length(crsom.userdata.history_snaps);
    
    for i=1:snaps
       crsom_snap_plot_pos(crsom, snaps + 1 - i, in);
   end

end

