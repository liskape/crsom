function [ crsom ] = train_wine( epochs, net_name)
    ds = csvread('wine.dat');
    inputs = mapminmaxT(ds(:, 2:14)');
    
    targets = ds(:, 1);
    targets = full(ind2vec(targets',3));
    
    crsom = create_crsom(inputs, targets);
    crsom.trainParam.epochs = epochs;
    crsom.userdata.net_name = net_name;
    
    crsom = train(crsom, inputs);
end
