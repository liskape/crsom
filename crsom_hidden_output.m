function [result, neighborhood_restiction, I, s] = crsom_hidden_output(map, input, i, win, t, t_end)
    neighborhood_restiction = crsom_o( win, i, t, map.layers{1}.distances, t_end);
    w = map.IW{1};
    I = power(norm(input - w(i, :)),2);
    s = exp(-I);
    result = s * neighborhood_restiction;
end

