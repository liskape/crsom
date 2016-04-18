function [ crsom, inputs, targets, untrained, trained_som, ids ] = train_problem(problem, epochs, net_name, normalized, LR2, s0, s_end, map_size)
  
    data = importdata(strcat(problem, '-in'));
    
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
    elseif normalized == 6
        inputs = mapminmax(in', 0, 0.15);
    elseif normalized == 7
        inputs = mapminmax(in', 0, 0.1);
    elseif normalized == 8
        inputs = mapminmax(in', 0, 0.5);
    elseif normalized == 9
        inputs = mapminmax(in', -0.25, 0.25); 
    elseif normalized == 10
        inputs = mapstd(in')*0.5;
    elseif normalized == 11
        inputs = mapstd(in')*0.25; 
    elseif normalized == 12
        inputs = mapstd(in')*0.1;
    elseif normalized == 13
        inputs = mapstd(in')*0.05; 
    elseif normalized == 14
        inputs = mapstd(in')*0.01;
    elseif normalized == 15
        inputs = mapminmax(in', 0, 0.9); 
     elseif normalized == 16
        inputs = mapminmax(in', 0, 0.8);    
      elseif normalized == 17
        inputs = mapminmax(in', 0, 0.7);   
      elseif normalized == 18
        inputs = mapminmax(in', 0, 0.6);
    elseif normalized == 18
        inputs = mapminmax(in', 0, 0.4);
    elseif normalized == 19
        inputs = mapminmax(in', 0, 0.3);
    elseif normalized == 20
        inputs = mapminmax(in', 0, 0.2);
    elseif normalized == 21
        inputs = mapminmax(in', -0.9, 0.9);
    elseif normalized == 22
        inputs = mapminmax(in', -0.8, 0.8); 
    elseif normalized == 23
        inputs = mapminmax(in', -0.7, 0.7); 
    elseif normalized == 24
        inputs = mapminmax(in', -0.6, 0.6);
    elseif normalized == 25
        inputs = mapminmax(in', -0.5, 0.5);
    elseif normalized == 26
        inputs = mapminmax(in', -0.4, 0.4);
    elseif normalized == 27
        inputs = mapminmax(in', -0.3, 0.3);
    elseif normalized == 28
        inputs = mapminmax(in', -0.2, 0.2);
    elseif normalized == 29
        inputs = mapminmax(in', -0.1, 0.1);
    elseif normalized == 30
        inputs = mapminmax(in', -0.05, 0.05);
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

