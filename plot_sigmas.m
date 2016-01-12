function [ output_args ] = plot_sigmas( epochs, s_0, s_end)
  
for i = 1:9
    ii = i * 2 - 1
    subplot(3, 3, i);
    plot_sigma(ii,  epochs, s_0, s_end);
    title(sprintf('d=%d',ii));
end

end

