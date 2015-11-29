function [ output_args ] = focus_plot( )
subplot(4, 1, 1);
plot(crsom.userdata.observed_delta_h);
title('observed delta_h class 1');

plot(crsom.userdata.observed_delta_h);
title('observed delta_h');

subplot(4, 1, 3);
plot(crsom.userdata.observed_koefs);
title('observed kofs');


end

