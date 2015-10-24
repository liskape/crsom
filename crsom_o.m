function result = crsom_o( win, i, t, distances, t_end )
    distance = distances(i, win);
    s = crsom_s(t, t_end);
    result = exp( power(s,-1) * (-distance));
end

