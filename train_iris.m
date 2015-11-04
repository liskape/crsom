function [ crsom ] = train_iris( epochs, net_name)
load iris_dataset 
inputs = mapminmaxT(irisInputs');
inputs = inputs'
targets = irisTargets;    
crsom = create_crsom(inputs, targets);
crsom.trainParam.epochs = epochs;
crsom.userdata.net_name = net_name;
crsom = train(crsom, inputs);

end

