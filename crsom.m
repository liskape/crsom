function out1 = crsom(varargin)
%% =======================================================
%  BOILERPLATE_START
%  This code is the same for all Network Functions.

  persistent INFO;
  if isempty(INFO), INFO = get_info; end
  if (nargin > 0) && ischar(varargin{1}) ...
      && ~strcmpi(varargin{1},'hardlim') && ~strcmpi(varargin{1},'hardlims')
    code = varargin{1};
    switch code
      case 'info',
        out1 = INFO;
      case 'check_param'
        err = check_param(varargin{2});
        if ~isempty(err), nnerr.throw('Args',err); end
        out1 = err;
      case 'create'
        if nargin < 2, error(message('nnet:Args:NotEnough')); end
        param = varargin{2};
        err = nntest.param(INFO.parameters,param);
        if ~isempty(err), nnerr.throw('Args',err); end
        out1 = create_network(param);
      otherwise,
        % Quick info field access
        try
          out1 = eval(['INFO.' code]);
        catch %#ok<CTCH>
          nnerr.throw(['Unrecognized argument: ''' code ''''])
        end
    end
  else
    [args,param] = nnparam.extract_param(varargin,INFO.defaultParam);
    [param,err] = INFO.overrideStructure(param,args);
    if ~isempty(err), nnerr.throw('Args',err,'Parameters'); end
    net = create_network(param);
    out1 = init(net);
  end
end

function v = fcnversion
  v = 7;
end

%  BOILERPLATE_END
%% =======================================================

function info = get_info
  info = nnfcnNetwork(mfilename,'Self-Organizing Map',fcnversion, ...
    [ ...
    nnetParamInfo('dimensions','Dimensions','nntype.strict_pos_int_row',[8 8],...
    'Dimensions of the neural layer.'), ...
    nnetParamInfo('coverSteps','Covering Steps','nntype.pos_int_scalar',100,...
    'Number of steps for neighborhood to shrink to 1.'), ...
    nnetParamInfo('initNeighbor','Initial Neighborhood','nntype.pos_int_scalar',3,...
    'Initial neighborhood size.'), ...
    nnetParamInfo('topologyFcn','Topology Function','nntype.topology_fcn','hextop',...
    'Pattern of neuron positions in the layer.'), ...
    nnetParamInfo('distanceFcn','Distance Function','nntype.distance_fcn','linkdist',...
    'Function to measure distances between neurons.') ...
    ]);
end

function err = check_param(param)
 err = '';
end

function net = create_network(param)

  % Architecture ( network(numInputs,numLayers,biasConnect,inputConnect,layerConnect,outputConnect) )
  net = network(1,2,[0; 1],[1;0],[0 0; 1 0],[0 1]);
  net.name = 'Context relevant self-organizing map (CRSOM)'  
  
  % Simulation - remains the same as in SOM
  net.layers{1}.dimensions = param.dimensions;
  net.layers{1}.topologyFcn = param.topologyFcn; % use ordinal
  net.layers{1}.distanceFcn = param.distanceFcn;
  net.inputWeights{1,1}.weightFcn = 'negdist';
  net.layers{1}.transferFcn = 'compet';
  net.layers{1}.name = 'Hidden'
  
  
  % Context layer
  net.layers{2}.dimensions = [1 3]
  net.layers{2}.distanceFcn = param.distanceFcn;
  net.layers{2}.transferFcn = 'tansig';
  net.layers{2}.name = 'Output'

  % Learning
  net.inputWeights{1,1}.learnFcn = 'learnsomb';
  net.inputWeights{1,1}.learnParam.init_neighborhood = param.initNeighbor;
  net.inputWeights{1,1}.learnParam.steps = param.coverSteps;

  % Adaption
%   net.adaptFcn = 'adaptwb';

  % Training
  net.trainFcn = 'crsomtrain';
  net.trainParam.epochs = max(200,param.coverSteps * 2);

  % Initialization
  net.initFcn = 'initlay';
  net.layers{1}.initFcn = 'initwb';
  net.inputWeights{1,1}.initFcn = 'initsompc';

  % Plots
  net.plotFcns = ...
    {'plotsomtop','plotsomnc','plotsomnd','plotsomplanes','plotsomhits','plotsompos'};
end
