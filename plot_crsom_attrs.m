function [ output_args ] = plot_crsom_attrs( crsom )
    
subplot(5, 1, 1);
plot(crsom.userdata.mean_adjusts);
title('mean adjustments');

subplot(5,1, 2);
plot(crsom.userdata.mean_O_h);
title('mean O_h');

subplot(5, 1, 3);
plot(crsom.userdata.errors);
title('mean error');

subplot(5, 1, 4);
plot(crsom.userdata.first_part);
title('mean first part (e^(I_h))');

subplot(5, 1, 5);
plot(crsom.userdata.second_part);
title('mean error second part (sigma)');


end

