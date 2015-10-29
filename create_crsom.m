function [ som ] = create_crsom(inputs, targets)
    [r_in c_in] = size(inputs);
    [r_tar c_tar] = size(targets);

    nodes_size = floor(sqrt(c_in));

    som = selforgmap([nodes_size nodes_size],10, 3, 'gridtop', 'dist');
    som.trainFcn = 'mytrainsom';
    som.inputWeights{1,1}.learnFcn = 'mylearnsom';
    som.trainParam.epochs = 100;
    som.userdata = struct('context_net', context_net(ones(nodes_size*nodes_size,1), ones(r_tar,1)), 'targets', targets, 'errors', [], 'maxd', [],'mind', []);
    
    som = configure(som, inputs);
    som.iw{1} = rand(size(som.IW{1}));
  
    % pretrain------------------------------
    % pre = selforgmap([10 10],10, 3, 'gridtop', 'dist');
    % pre = train(pre, irisInputs);
    % som.IW{1} = pre.IW{1};
    % ------------------------------------
end

