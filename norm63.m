R = [228 26 28] / 255
B = [55 126 184] /255
G = [77 175 74] /255


% ----------------------------------------------------------------------
load('/Users/pliska/Documents/MATLAB/results/katy-ram-investigate2_ep=500_norm=400_size=1.00_LR2=0.10_.mat')
original = crsom.IW{1};

crsom.IW{1} = crsom.userdata.history_snaps{1}
[crosses_cols, crosses_rows] = plot_crsom_crosses(crsom, in, ta)
title('after 0 epochs')
 hold on
 scatter(0,0,0, R, 'filled' ); %RED
% scatter(0,0,0.001, G, 'filled' ); %BLUE

hold on
scatter(crosses_cols, crosses_rows, 100, [0 0 0], 'x', 'LineWidth', 2);

legend('Ramones','Katy Perry', 'conflict', 'Location', 'southwest')
print('exp_kp_ram_norm_0','-dpng');
hold off;

% ----------------------------
crsom.IW{1} = crsom.userdata.history_snaps{1}
[crosses_cols, crosses_rows] = plot_crsom_crosses(crsom, in, ta)
title('after 1 epoch')
 hold on

scatter(crosses_cols, crosses_rows, 100, [0 0 0], 'x', 'LineWidth', 2);

print('exp_kp_ram_norm_1','-dpng');
hold off;


% ----------------------------
crsom.IW{1} = crsom.userdata.history_snaps{2}
[crosses_cols, crosses_rows] = plot_crsom_crosses(crsom, in, ta)
title('after 63 epochs')
 hold on

scatter(crosses_cols, crosses_rows, 100, [0 0 0], 'x', 'LineWidth', 2);

print('exp_kp_ram_norm_63','-dpng');
hold off;

% ----------------------------------------------------
crsom.IW{1} = crsom.userdata.history_snaps{3}
[crosses_cols, crosses_rows] = plot_crsom_crosses(crsom, in, ta)
title('after 126 epochs')
 hold on

scatter(crosses_cols, crosses_rows, 100, [0 0 0], 'x', 'LineWidth', 2);

print('exp_kp_ram_norm_126','-dpng');
hold off;

% ----------------------------------------------------
crsom.IW{1} = crsom.userdata.history_snaps{5}
[crosses_cols, crosses_rows] = plot_crsom_crosses(crsom, in, ta)
title('after 252 epochs')
 hold on

scatter(crosses_cols, crosses_rows, 100, [0 0 0], 'x', 'LineWidth', 2);

print('exp_kp_ram_norm_252','-dpng');
hold off;


% ----------------------------------------------------
crsom.IW{1} = crsom.userdata.history_snaps{7}
[crosses_cols, crosses_rows] = plot_crsom_crosses(crsom, in, ta)
title('after 378 epochs')
 hold on

scatter(crosses_cols, crosses_rows, 100, [0 0 0], 'x', 'LineWidth', 2);

print('exp_kp_ram_norm_378','-dpng');
hold off;

% ----------------------------------------------------
crsom.IW{1} = original;
[crosses_cols, crosses_rows] = plot_crsom_crosses(crsom, in, ta)
title('after 500 epochs')
 hold on

scatter(crosses_cols, crosses_rows, 100, [0 0 0], 'x', 'LineWidth', 2);

print('exp_kp_ram_norm_500','-dpng');
hold off;

