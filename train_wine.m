function [ crsom ] = train_wine( epochs )
    ds = csvread('wine.dat');
    inputs = ds(:, 2:14)';
    
    targets = ds(:, 1);
    targets = full(ind2vec(targets',3));
    
    crsom = create_crsom(inputs, targets);
    crsom.trainParam.epochs = epochs;

    crsom = train(crsom, inputs);
end
