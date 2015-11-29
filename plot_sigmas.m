function [ output_args ] = plot_sigmas( epochs, s_0, s_end)
  
for i = 1:9
    subplot(3, 3, i);
    plot_sigma(i,  epochs, s_0, s_end);
    title(i);
end

end

