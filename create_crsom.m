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
%     return;
    
    epochs = 1;
    param.dimensions = [nodes_size nodes_size];
    param.coverSteps = 10;
    param.initNeighbor = 3;
    param.topologyFcn = 'gridtop';
    param.distanceFcn = 'dist';
    
      % Architecture
  net = network(1,2,[0; 1],[1;0],[0 0;1 0],[0 1]);

  % Simulation
  net.layers{1}.dimensions = param.dimensions;
  net.layers{1}.topologyFcn = param.topologyFcn;
  net.layers{1}.distanceFcn = param.distanceFcn;
  net.inputWeights{1,1}.weightFcn = 'negdist';
  net.layers{1}.transferFcn = 'somout';

  % Learning
  net.inputWeights{1,1}.learnFcn = 'learncrsom';
  net.inputWeights{1,1}.learnParam.init_neighborhood = param.initNeighbor;
  net.inputWeights{1,1}.learnParam.steps = param.coverSteps;

  % Adaption
  % net.adaptFcn = 'adaptwb';

  % Training
  net.trainFcn = 'traincrsom';
  net.trainParam.epochs = epochs;

  % Initialization
  net.initFcn = 'initlay';
  net.layers{1}.initFcn = 'initwb';
  net.layers{1}.transferFcn = 'somout';
  net.inputWeights{1,1}.initFcn = 'initsompc';

  % Plots
  net.plotFcns = ...
    {'plotsomtop','plotsomnc','plotsomnd','plotsomplanes','plotsomhits','plotsompos'};
    
  % context net  
  net.layers{2}.transferFcn = 'logsig';
  
  net.biases{:}.learnFcn = 'learngd';
  net.layerWeights{2,1}.learnFcn = 'learngd';
  
  net.divideMode = 'none' 
  net = configure(net, inputs, targets);

%   som = net;
%   som.userdata = struct('context_net', context_net2(ones(nodes_size*nodes_size,1), ones(r_tar,1)), 'targets', targets, 'enable_snapping', false, 'store_errors', false,'enable_logging', false, 'computing_details', false, 'errors', [], 'net_name', '', 'mean_adjusts', [], 'history_snaps', [], 'lr2', LR2, 's_0', s_0, 's_end', s_end, 'mean_O_h', [], 'first_part', [],'second_part', [], 'observed_delta_h', [], 'observed_koefs', []);
   
  
  
  cn = som.userdata.context_net;
  cn.trainFcn = 'traincrsom';
  cn.userdata.som = som;
  cn.trainParam.epochs = 100;
  
  som = cn;

end

