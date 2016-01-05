function [ crsom, inputs, targets, untrained, lr2 ] = train_katy_soad( epochs, net_name, normalized, LR2, s0, s_end, map_size)
  
    in = importdata('katy-soad-1-in.csv')
    
    if normalized == 1
        inputs = mapminmaxT(in');
    elseif normalized == 2
        inputs = mapstd(in');
    else
        inputs = in
    end
      
    targets = importdata('katy-soad-1-ta')'  
    crsom = create_crsom(inputs, targets, LR2, s0, s_end, map_size);
    
    crsom.trainParam.epochs = epochs;
    crsom.userdata.net_name = net_name;
    untrained = crsom;
    crsom = train(crsom, inputs);
    
    % actual data 
    % gscatter(inputs(1,:), inputs(2,:), vec2ind(targets)')
end

