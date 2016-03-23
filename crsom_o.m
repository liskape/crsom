function result = crsom_o( win, indexes, t, distances, t_end, s_0, send )
    result = exp(power(crsom_s(t, t_end, s_0, send),-1)  * (-distances(indexes, win)));
end

