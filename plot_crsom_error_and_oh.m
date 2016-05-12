function [ output_args ] = plot_crsom_error_and_oh( crsom )
    
subplot(2, 1, 1);
    plot(1:length(crsom.userdata.errors), crsom.userdata.errors);
%     ylim([0 0.15])
    xlabel('epoch')
    ylabel('E')
title('E');
subplot(2,1, 2);

mean_O_h = mean(reshape(crsom.userdata.second_part, 242, 500));

plot(mean_O_h);
title('mean topological activation');
 ylabel('mean top. activation')
xlabel('epoch')
end

