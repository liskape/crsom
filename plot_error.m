function [ output_args ] = plot_error( som )
    plot(1:length(som.userdata.errors), som.userdata.errors);
end

