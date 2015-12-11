function [ crsom, inputs, targets, untrained, lr2 ] = train_iris( epochs, net_name, normalized, LR2, s_0, s_end, map_size)
    load iris_dataset
    
    if normalized
%         inputs = mapminmaxT(irisInputs');
%         inputs = inputs'
        inputs = mapstd(irisInputs);
    else
        inputs = irisInputs
    end
  
    targets = irisTargets;    
    crsom = create_crsom(inputs, targets, LR2, s_0, s_end, map_size);
    
    crsom.trainParam.epochs = epochs;
    crsom.userdata.net_name = net_name;
    untrained = crsom;
    crsom = train(crsom, inputs);
end

