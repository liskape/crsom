function [ output_args ] = plot_crsom_attrs( crsom )
    
subplot(4, 1, 1);
plot(crsom.userdata.mean_adjusts);
title('mean adjustments');

subplot(4,1, 2);
plot(crsom.userdata.mean_O_h);
title('mean O_h');

subplot(4, 1, 3);
plot(crsom.userdata.first_part);
title('mean first part (e^(I_h))');

subplot(4, 1, 4);
plot(crsom.userdata.second_part);
title('mean second part (sigma)');

% subplot(7, 1, 6);
% plot(crsom.userdata.observed_delta_h);
% title('observed delta_h');
% 
% subplot(7, 1, 7);
% plot(crsom.userdata.observed_koefs);
% title('observed kofs');
end

