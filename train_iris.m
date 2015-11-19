function [ crsom, inputs, targets, untrained ] = train_iris( epochs, net_name, normalized)
    load iris_dataset
    
    if normalized
        inputs = mapminmaxT(irisInputs');
        inputs = inputs'
    else
        inputs = irisInputs
    end
  
    targets = irisTargets;    
    crsom = create_crsom(inputs, targets);
    
    crsom.trainParam.epochs = epochs;
    crsom.userdata.net_name = net_name;
    untrained = crsom;
    crsom = train(crsom, inputs);
end

