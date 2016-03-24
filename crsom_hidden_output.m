function [result, neighborhood_restiction, s] = crsom_hidden_output(map, input, neurons, win, t, t_end, s_0, send, dist)
    neighborhood_restiction = crsom_o( win, 1:neurons, t, map.layers{1}.distances, t_end, s_0, send);  
    s = exp(-power(dist, 2));
    'size s'
    size(s)
    'size neighborhood_restiction'
    size(neighborhood_restiction)
    result = s .* neighborhood_restiction;
end

