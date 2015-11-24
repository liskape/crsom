function [ output_args ] = plot_sigma( dist, epochs, s_0, s_end)
    s = crsom_s(1:epochs,epochs,s_0, s_end);
    
    powered_s = power(s,-1);
   plot(exp(powered_s  * (-dist)));
end

