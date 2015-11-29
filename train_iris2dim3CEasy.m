function [ crsom, inputs, targets, untrained, lr2 ] = train_iris2dim3CEasy( epochs, net_name, normalized, LR2, s0, s_end)
  
   load iris_dataset
    
    if normalized
        inputs = mapminmaxT(irisInputs(2:3,:)');
        inputs = inputs';
    else
        inputs = irisInputs(2:3,:);
    end
  
    targets = irisTargets;    
    crsom = create_crsom(inputs, targets, LR2, s0, s_end);
    
    crsom.trainParam.epochs = epochs;
    crsom.userdata.net_name = net_name;
    untrained = crsom;
    crsom = train(crsom, inputs);
    
    % actual data 
    % gscatter(inputs(1,:), inputs(2,:), vec2ind(targets)')
end

