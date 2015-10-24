function result = crsom_s( t, t_end )
    s_0 = 200;
    s_end = 0.01;

    result = s_0* power(s_end/s_0, t/t_end);
end

