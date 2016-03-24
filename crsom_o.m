function result = crsom_o( win, indexes, t, distances, t_end, s_0, send )
    distances =  distances(indexes, win);
    s = crsom_s(t, t_end, s_0, send);
    powered_s = power(s,-1);
    result = exp(powered_s  * (-distances));
end

