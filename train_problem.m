function [ crsom, inputs, targets, untrained, trained_som, ids ] = train_problem(problem, epochs, net_name, normalized, LR2, s0, s_end, map_size)
  
    
    data = importdata(strcat('/datasets/',problem, '-in'));
    
    ids = data.textdata;
    in = data.data;
    
    if normalized == 1
        inputs = mapminmax(in');
    elseif normalized == 2
        inputs = mapstd(in');
    elseif normalized == 0
        inputs = in'
    elseif normalized == 3
        inputs = mapminmax(in', 0);
    elseif normalized == 4
        inputs = mapminmax(in', 0, 0.5);
    elseif normalized == 5
        inputs = mapminmax(in', 0, 0.25);
    else
        DONT_KNOW_HOW_TO_NORMALIZE_THIS
    end
       
    targets = importdata(strcat(problem, '-ta'))';
    crsom = create_crsom(inputs, targets, LR2, s0, s_end, map_size);

    crsom.trainParam.epochs = epochs;
    crsom.userdata.net_name = net_name;
    
    crsom.userdata.som.userdata.inputs = inputs;
    crsom.userdata.som.userdata.targets = targets;
    s = crsom.userdata.som;
    untrained = s; 
    context_inputs = s(inputs);
    crsom = train(crsom, context_inputs, targets);
    
    crsom = crsom.userdata.som
        
    [neurons, dims] = size(crsom.IW{1});
    nodes_size = sqrt(neurons);
    trained_som = selforgmap([nodes_size nodes_size],10, 3, 'gridtop', 'dist');
    trained_som.trainParam.showWindow = false;
    trained_som = train(trained_som, inputs);
    % actual data 
    % gscatter(inputs(1,:), inputs(2,:), vec2ind(targets)')
end

