function [ output_args ] = crsom_snap_plot_pos(crsom, index, in);

   crsom.IW{1} =  crsom.userdata.history_snaps{index};
   plotsompos(crsom, in);
end

