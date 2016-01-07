function [ crsom, inputs, targets, untrained, lr2 ] = train_katy_soad_red( epochs, net_name, normalized, LR2, s0, s_end, map_size)
  
    in = importdata('katy-soad-2-in.csv');
    
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
      
    targets = importdata('katy-soad-2-ta')'  
    crsom = create_crsom(inputs, targets, LR2, s0, s_end, map_size);
    
    crsom.trainParam.epochs = epochs;
    crsom.userdata.net_name = net_name;
    untrained = crsom;
    crsom = train(crsom, inputs);
    
    % actual data 
    % gscatter(inputs(1,:), inputs(2,:), vec2ind(targets)')
end

