function result = better_crsom_o( win, neurons, neuron_side, t, t_end, distances)
    rad = neuron_side  / 2;
    lambda = t_end / log(rad);
    treshold = exp(- t / lambda) * rad;
    
    result = (distances(neurons, win) < treshold) + 0;
    
  
end

