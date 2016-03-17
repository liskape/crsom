function [ som ] = create_crsom(inputs, targets, LR2, s_0, s_end, map_size)
    [r_in c_in] = size(inputs);
    [r_tar c_tar] = size(targets);

    nodes_size = floor(sqrt(c_in * map_size));

    som = selforgmap([nodes_size nodes_size],10, 3, 'gridtop', 'dist');
    som.trainFcn = 'mytrainsom';
    som.inputWeights{1,1}.learnFcn = 'mylearnsom';
    som.trainParam.epochs = 100;
    
    som.userdata = struct('context_net', context_net2(ones(nodes_size*nodes_size,1), ones(r_tar,1)), 'targets', targets, 'enable_snapping', false, 'store_errors', false,'enable_logging', false, 'computing_details', false, 'errors', [], 'net_name', '', 'mean_adjusts', [], 'history_snaps', [], 'lr2', LR2, 's_0', s_0, 's_end', s_end, 'mean_O_h', [], 'first_part', [],'second_part', [], 'observed_delta_h', [], 'observed_koefs', []);
    som = configure(som, inputs);
 end

