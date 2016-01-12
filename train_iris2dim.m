function [ crsom, inputs, targets, untrained, lr2 ] = train_iris2dim( epochs, net_name, normalized, LR2, s0, s_end, map_size)
  
   load iris_dataset
    
   irisInputs = irisInputs(1:2,1:100)
       
    if normalized == 1
        inputs = mapminmaxT(irisInputs');
        inputs = inputs'
    elseif normalized == 2
        inputs = mapstd(irisInputs);
    elseif normalized == 4
        inputs = mapminmax(irisInputs, 0, 0.5);
    else
        inputs = irisInputs
    end
   

   

  
    targets = irisTargets(1:2, 1:100);    
    crsom = create_crsom(inputs, targets, LR2, s0, s_end, map_size);
    
    crsom.trainParam.epochs = epochs;
    crsom.userdata.net_name = net_name;
    untrained = crsom;
    crsom = train(crsom, inputs);
    
% actual data 
% gscatter(in(1,:), in(2,:), vec2ind(ta)')
end

