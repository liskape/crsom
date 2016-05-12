function [ output_args ] = plot_error( som )
    plot(1:length(som.userdata.errors), som.userdata.errors);
    ylim([0 0.25])
    title('Learning error', 'FontSize', 22)
    ylabel('E', 'FontSize', 18)
    xlabel('epoch', 'FontSize', 18)
end

