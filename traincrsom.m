function [out1,out2] = traincrsom(varargin)
%TRAINC Cyclical order weight/bias training.
%
%  <a href="matlab:doc trainc">trainc</a> trains a network with weight and bias learning rules with
%  incremental updates after each presentation of an input.  Inputs
%  are presented in cyclic order.
%
%  [NET,TR] = <a href="matlab:doc trainc">trainc</a>(NET,X,T) takes a network NET, input data X
%  and target data T and returns the network after training it, and a
%  a training record TR.
%
%  [NET,TR] = <a href="matlab:doc trainc">trainc</a>(NET,X,T,Xi,Ai,EW) takes additional optional
%  arguments suitable for training dynamic networks and training with
%  error weights.  Xi and Ai are the initial input and layer delays states
%  respectively and EW defines error weights used to indicate
%  the relative importance of each target value.
%
%  Training occurs according to training parameters, with default values.
%  Any or all of these can be overridden with parameter name/value argument
%  pairs appended to the input argument list, or by appending a structure
%  argument with fields having one or more of these names.
%    epochs            1000  Maximum number of epochs to train
%    goal      0  Performance goal
%    max_fail  5  Maximum validation failures
%    show                25  Epochs between displays
%    showCommandLine  false  Generate command-line output
%    showWindow        true  Show training GUI
%    time    inf  Maximum time to train in seconds
%
%  To make this the default training function for a network, and view
%  and/or change parameter settings, use these two properties:
%
%    net.<a href="matlab:doc nnproperty.net_trainFcn">trainFcn</a> = 'trainc';
%    net.<a href="matlab:doc nnproperty.net_trainParam">trainParam</a>
%
%  See also COMPETLAYER, TRAIN.

% Copyright 1992-2014 The MathWorks, Inc.

%% =======================================================
%  BOILERPLATE_START
%  This code is the same for all Training Functions.

persistent INFO;
if isempty(INFO),
    INFO = get_info;
end
nnassert.minargs(nargin,1);
in1 = varargin{1};
if ischar(in1)
    switch (in1)
        case 'info'
            out1 = INFO;
        case 'apply'
            [out1,out2] = train_network(varargin{2:end});
        case 'formatNet'
            out1 = formatNet(varargin{2});
        case 'check_param'
            param = varargin{2};
            err = nntest.param(INFO.parameters,param);
            if isempty(err)
                err = check_param(param);
            end
            if nargout > 0
                out1 = err;
            elseif ~isempty(err)
                nnerr.throw('Type',err);
            end
        otherwise,
            try
                out1 = eval(['INFO.' in1]);
            catch me, nnerr.throw(['Unrecognized first argument: ''' in1 ''''])
            end
    end
else
    net = varargin{1};
    oldTrainFcn = net.trainFcn;
    oldTrainParam = net.trainParam;
    if ~strcmp(net.trainFcn,mfilename)
        net.trainFcn = mfilename;
        net.trainParam = INFO.defaultParam;
    end
    [out1,out2] = train(net,varargin{2:end});
    net.trainFcn = oldTrainFcn;
    net.trainParam = oldTrainParam;
end
end

%  BOILERPLATE_END
%% =======================================================

function info = get_info
isSupervised = true;
usesGradient = true;
usesJacobian = false;
usesValidation = true;
supportsCalcModes = false;
info = nnfcnTraining(mfilename,'Cyclical Weight/Bias Rule',8.0,...
    isSupervised,usesGradient,usesJacobian,usesValidation,supportsCalcModes,...
    [ ...
    nnetParamInfo('showWindow','Show Training Window Feedback','nntype.bool_scalar',true,...
    'Display training window during training.'), ...
    nnetParamInfo('showCommandLine','Show Command Line Feedback','nntype.bool_scalar',false,...
    'Generate command line output during training.') ...
    nnetParamInfo('show','Command Line Frequency','nntype.strict_pos_int_inf_scalar',25,...
    'Frequency to update command line.'), ...
    ...
    nnetParamInfo('epochs','Maximum Epochs','nntype.pos_int_scalar',1000,...
    'Maximum number of training iterations before training is stopped.') ...
    nnetParamInfo('time','Maximum Training Time','nntype.pos_inf_scalar',inf,...
    'Maximum time in seconds before training is stopped.') ...
    ...
    nnetParamInfo('goal','Performance Goal','nntype.pos_scalar',0,...
    'Performance goal.') ...
    nnetParamInfo('max_fail','Maximum Validation Checks','nntype.pos_int_scalar',6,...
    'Maximum number of validation checks before training is stopped.') ...
    ], ...
    []);
end

function err = check_param(param)
err = '';
end

function net = formatNet(net)
if isempty(net.performFcn)
    warning(message('nnet:train:EmptyPerformanceFixed'));
    net.performFcn = 'mse';
end
end

function [net,tr] = train_network(net,tr,data,options,fcns,param)

% Initialize
needGradient = nn.needsGradient(net);
startTime = clock;
original_net = net;
 [perf,vperf,tperf] = nn7.trainValTestPerfs(net,data,fcns);
% [perf,vperf,tperf] = [0.25, 0.25, 0.25];
BP = 1;
IWLS = cell(net.numLayers,net.numInputs);
LWLS = cell(net.numLayers,net.numLayers);
BLS = cell(net.numLayers,1);
trainInd = nncalc.mask2SampleInd(data.train.mask);
trainQ = length(trainInd);
layer2output = num2cell(cumsum(net.outputConnect));
layer2output(~net.outputConnect) = {[]};

% Training Record
tr.best_epoch = 0;
tr.goal = param.goal;
tr.states = {'epoch','time','perf','vperf','tperf'};

% Status
status = ...
    [ ...
    nntraining.status('Epoch','iterations','linear','discrete',0,param.epochs,0), ...
    nntraining.status('Time','seconds','linear','discrete',0,param.time,0), ...
    nntraining.status('Performance','','log','continuous',perf,param.goal,perf) ...
    ];
feedback = nnet.train.defaultFeedbackHandler;
feedback.start(false,data,net,tr,options,status);
som = net.userdata.som;
u = som.userdata;

% Initialize debugging ---------------------
if u.store_errors
  mean_errors = zeros(1, param.epochs);
  errors = zeros(1, length(u.targets));
else
  errors = [];
end



  mean_adjust = zeros(1, param.epochs);
  epoch_adjust = zeros(1, length(u.targets));
  
  mean_s = zeros(1, param.epochs);
  epoch_s = zeros(1, length(u.targets));
  
  mean_sigma = zeros(1, param.epochs);
  epoch_sigma = zeros(1, length(u.targets));

  mean_O_h = zeros(1, param.epochs);
  epoch_O_h = zeros(1, length(u.targets));
  
  
history_snaps = [];
context_snaps = [];
snapped_epochs = []
% -----------------------------------------------
LR2 = u.lr2;
[N, DIM] = size(som.IW{1});
divData = nncalc.split_data(data,1);
% Train
for epoch=0:param.epochs
    
    % Stopping Criteria
    current_time = etime(clock,startTime);
    [userStop,userCancel] = nntraintool('check');
    if userStop
        tr.stop = message('nnet:trainingStop:UserStop');
    elseif userCancel
        tr.stop = message('nnet:trainingStop:UserCancel');
        net = original_net;
    elseif (perf <= param.goal)
        tr.stop = message('nnet:trainingStop:PerformanceGoalMet');
    elseif (epoch == param.epochs)
        tr.stop = message('nnet:trainingStop:MaximumEpochReached');
    elseif (current_time >= param.time)
        tr.stop = message('nnet:trainingStop:MaximumTimeElapsed');
    end
    
    % Feedback
    tr = nnet.trainingRecord.update(tr,[epoch current_time perf vperf tperf]);
    statusValues = [epoch,current_time,perf];
    feedback.update(net,tr,options,data,[],[],net,status,statusValues);
    
    % Stop
    if ~isempty(tr.stop)
        break
    end
    
    % Each vector (or sequence of vectors) in order
    for qq=1:trainQ
%         
        q = qq;
%         divData = nncalc.split_data(data,1);
        
    % ------------------------------------------------------
%         som(u.inputs(:,q));
         
         
        input = u.inputs(:,qq);
%         o = som(input);
        d = repmat(input',N, 1) - som.IW{1};
        dist = zeros(N, 1);
        for i = 1:N
          dist(i) = norm(d(i,:));
        end
      
        
        o = dist == min(dist);
       
        [result, sigma_neig, s] = crsom_hidden_output(som, u.inputs(:,q), length(o), find(o), epoch + 1, param.epochs, 200, 0.01, dist);

    % ---------------------------------------------------
        
        divData.X{1} = result;
         divData.Pc{1} = result;
          divData.Pd{1} = result;
          divData.T{1} = u.targets(:,q);

        
        [dperf,divData,gB,gIW,gLW,gA] = nn7.perf_sig_grad(net,divData,needGradient,fcns);
        
       
        Y = divData.Y{1};
        target = divData.T{1};
        NEURONS = length(o);
        input_size = length(input);
        
         delta_k = (Y - target).* Y.* (1 - Y);

       first_part = -s;
       delta_ks = repmat(delta_k', NEURONS, 1);
       sumation = sum((delta_ks.*(net.IW{1}'))')';
       delta_h = first_part .* sumation;
       adjust = d.* repmat(sigma_neig.*delta_h .* LR2, 1, input_size);
       som.IW{1} = som.IW{1} + adjust;
    
       
%------------- logging ---------------------------------
        if u.store_errors
           errors(qq) = dperf;
        end
        
        if u.computing_details              
          epoch_adjust(qq) = mean(mean(adjust)');
          epoch_s(qq) = mean(s);
          epoch_sigma(qq) = mean(sigma_neig);
          epoch_O_h(qq) = mean(result); 
        end
% --------------------------------------------------------------  
       
        % Update with Weight and Bias Learning Functions
        for ts=1:data.TS
            for i=1:net.numLayers
                ii = layer2output{i};
                
                % Update Input Weight Values
                for j=find(net.inputConnect(i,:))
                    fcn = fcns.inputWeights(i,j).learn;
                    if fcn.exist
                        Pd = nntraining.pd(net,1,divData.Pc,divData.Pd,i,j,ts);
                        [dw,IWLS{i,j}] = fcn.apply(net.IW{i,j}, ...
                            Pd,divData.Zi{i,j},divData.N{i},divData.Ac{i,ts+net.numLayerDelays},...
                            [divData.T{ii,ts}],[divData.E{ii,ts}],gIW{i,j,ts},...
                            gA{i,ts},net.layers{i}.distances,fcn.param,IWLS{i,j});
                        net.IW{i,j} = net.IW{i,j} + dw;
                    end
                end
                
                % Update Layer Weight Values
                for j=find(net.layerConnect(i,:))
                    fcn = fcns.layerWeights(i,j).learn;
                    if fcn.exist
                        Ad = cell2mat(divData.Ac(j,ts+net.numLayerDelays-net.layerWeights{i,j}.delays)');
                        [dw,LWLS{i,j}] = fcn.apply(net.LW{i,j}, ...
                            Ad,divData.Zl{i,j},divData.N{i},divData.Ac{i,ts+net.numLayerDelays},...
                            [divData.T{ii,ts}],[divData.E{ii,ts}],gLW{i,j,ts},...
                            gA{i,ts},net.layers{i}.distances,fcn.param,LWLS{i,j});
                        net.LW{i,j} = net.LW{i,j} + dw;
                    end
                end
                
                % Update Bias Values
                if net.biasConnect(i)
                    fcn = fcns.biases(i).learn;
                    if fcn.exist
                        [db,BLS{i}] = fcn.apply(net.b{i}, ...
                            BP,divData.Zb{i},divData.N{i},divData.Ac{i,ts+net.numLayerDelays},...
                            [divData.T{ii,ts}],[divData.E{ii,ts}],gB{i,ts},...
                            gA{i,ts},net.layers{i}.distances,fcn.param,BLS{i});
                        net.b{i} = net.b{i} + db;
                    end
                end
            end
        end
    end
    
%     [perf,vperf,tperf] = nn7.trainValTestPerfs(net,data,fcns);
    
    

    if u.store_errors
      mean_error = mean(errors);
      mean_errors(epoch+1) = mean_error;
      perf = mean_error;
    end
    
    if u.enable_snapping
        if mod(epoch, ceil(net.trainParam.epochs / 8)) == 0
            snapped_epochs = [snapped_epochs epoch];
            history_snaps = [history_snaps {som.IW{1}}];
            context_snaps = [context_snaps net]
        end        
    end
    
    if u.computing_details
%        mean_adjust(epoch+1) = mean(epoch_adjust);
%        mean_s(epoch+1) = mean(epoch_s);
%        mean_sigma(epoch+1) = mean(epoch_sigma);
%        mean_O_h(epoch+1) = mean(epoch_O_h);

    mean_adjust = [mean_adjust epoch_adjust];
    mean_s = [mean_s epoch_s];
    mean_sigma = [mean_sigma epoch_sigma];
    mean_O_h = [mean_O_h epoch_O_h];
    end
    
end


    som.userdata.mean_adjusts = mean_adjust;
    som.userdata.first_part = mean_s;
    som.userdata.second_part = mean_sigma;
    som.userdata.errors = mean_errors;
    som.userdata.history_snaps = history_snaps;
    som.userdata.context_snaps = context_snaps;
    som.userdata.snapped_epochs = snapped_epochs;
    som.userdata.mean_O_h = mean_O_h;
    som.userdata.net_name = net.userdata.net_name;
    som.userdata.context_net = net;

    net.userdata.som = som;
end

% TODO - Add Validation
% TODO - Add silent/fast mode
