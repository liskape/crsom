load iris_dataset;
som = selforgmap([10 10],10, 3, 'gridtop', 'dist');
som.trainFcn = 'mytrainsom';
som.inputWeights{1,1}.learnFcn = 'mylearnsom';
som.trainParam.epochs = 30;
som.userdata = struct('context_net', context_net(ones(100,1), ones(3,1)), 'targets', irisTargets, 'errors', [], 'maxd', [],'mind', []);
inpusts = normalize(irisInputs);

som = configure(som, inpusts );


% pretrain------------------------------
% pre = selforgmap([10 10],10, 3, 'gridtop', 'dist');
% pre = train(pre, irisInputs);
% som.IW{1} = pre.IW{1};
% ------------------------------------

som = train(som, inpusts);




