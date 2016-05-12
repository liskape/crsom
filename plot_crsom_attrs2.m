function [ output_args ] = plot_crsom_attrs2( crsom )
l = length(crsom.userdata.mean_adjusts);    


subplot(3, 1, 1);
plot(crsom.userdata.mean_adjusts);
title('mean adjustments');
xlim([0 l])

subplot(3,1, 2);
plot(crsom.userdata.mean_O_h);
title('mean O_h');
xlim([0 l])


subplot(3, 1,3);
plot(crsom.userdata.first_part);
title('mean first part');
xlim([0 l])

% subplot(7, 1, 6);
% plot(crsom.userdata.observed_delta_h);
% title('observed delta_h');
% 
% subplot(7, 1, 7);
% plot(crsom.userdata.observed_koefs);
% title('observed kofs');
end

