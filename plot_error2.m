function [ h ] = plot_error2( som )
    h = plot(1:length(som.userdata.errors), som.userdata.errors);
    title('add title')
    ylim([0 0.4])
    xlabel('epoch')
    ylabel('MSE')
end

