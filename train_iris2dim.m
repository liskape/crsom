function [ crsom, inputs, targets, untrained, lr2 ] = train_iris2dim( epochs, net_name, normalized, LR2)
  
   load iris_dataset
    
    if normalized
        inputs = mapminmaxT(irisInputs(1:2,1:100)');
        inputs = inputs';
    else
        inputs = irisInputs(1:2, 1:100);
    end
  
    targets = irisTargets(:, 1:100);    
    crsom = create_crsom(inputs, targets, LR2);
    
    crsom.trainParam.epochs = epochs;
    crsom.userdata.net_name = net_name;
    untrained = crsom;
    crsom = train(crsom, inputs);
    
% actual data 
% gscatter(in(1,:), in(2,:), vec2ind(ta)')
end

