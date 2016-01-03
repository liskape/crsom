function [ crsom, inputs, targets, untrained, lr2 ] = train_led_b( epochs, net_name, normalized, LR2, s0, s_end, map_size)
  
    in = importdata('lz-b-1-in.csv')
    in = in.data'
    
    if normalized
        inputs = mapminmaxT(in);
        inputs = inputs';
    else
        inputs = in;
    end
  
    targets = importdata('lz-b-1-ta')'  
    crsom = create_crsom(inputs, targets, LR2, s0, s_end, map_size);
    
    crsom.trainParam.epochs = epochs;
    crsom.userdata.net_name = net_name;
    untrained = crsom;
    crsom = train(crsom, inputs);
    
    % actual data 
    % gscatter(inputs(1,:), inputs(2,:), vec2ind(targets)')
end

