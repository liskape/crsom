function [ targets, neurons, song_ids ] = data_for_neuron( crsom, in, ta, ids, x, y )

    N = crsom.layers{1}.dimensions(1);

    data_indexes_for_neuron = [];
       
    for i= 1:length(ta)
       win = find(crsom(in(:, i)));
       
       if [row_idx(win, N), col_inx(win, N)] == [x y]
           data_indexes_for_neuron = [i data_indexes_for_neuron];
       end
    end

    neurons= data_indexes_for_neuron;
    targets = ta(:, data_indexes_for_neuron);
    song_ids = ids(data_indexes_for_neuron);
end

