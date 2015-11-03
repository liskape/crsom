function [result, neighborhood_restiction, I, s] = crsom_hidden_output(map, input, neurons, win, t, t_end)
    neighborhood_restiction = crsom_o( win, 1:neurons, t, map.layers{1}.distances, t_end);
    w = map.IW{1};
    
    d = repmat(input, neurons, 1) - w;
    
    I = zeros(neurons, 1);
    
    for i=1:neurons
        I(i) = power(norm(d(i,:)),2);
    end
    
    s = exp(-I);
    result = s .* neighborhood_restiction;
end

