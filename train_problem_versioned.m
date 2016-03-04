function [ crsom, inputs, targets, untrained, lr2 ] = train_problem_versioned(problem, epochs, net_name, normalized, LR2, s0, s_end, map_size, crsom_version)
  
    data = importdata(strcat(problem, '-in'))
    in = data.data;
    
    if normalized == 1
        inputs = mapminmax(in');
    elseif normalized == 2
        inputs = mapstd(in');
    elseif normalized == 0
        inputs = in
    elseif normalized == 3
        inputs = mapminmax(in', 0);
    elseif normalized == 4
        inputs = mapminmax(in', 0, 0.5);
    end
      
    targets = importdata(strcat(problem, '-ta'))'
    
    switch crsom_version
        case 'bench0'
            crsom = create_crsom(inputs, targets, LR2, s0, s_end, map_size);
        case 'bench1'
            crsom = create_crsom1(inputs, targets, LR2, s0, s_end, map_size);
        case 'bench2'
            crsom = create_crsom2(inputs, targets, LR2, s0, s_end, map_size);
        case 'bench3'
            crsom = create_crsom3(inputs, targets, LR2, s0, s_end, map_size);
        otherwise
            FAIL
    end
    
    
    crsom.trainParam.epochs = epochs;
    crsom.userdata.net_name = net_name;
    untrained = crsom;
    crsom = train(crsom, inputs);
end

