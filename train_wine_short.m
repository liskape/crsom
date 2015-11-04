function [ crsom, s_inputs, s_targets] = train_wine_short(epochs, net_name)
    ds = csvread('wine.dat');
    inputs = ds(:, 2:14)';
    targets = ds(:, 1);
    targets = full(ind2vec(targets',3));

    % CROP inputs and targets
%         s_inputs = mapminmaxT([ inputs(:, 1) inputs(:, 2)]);
%     s_targets = [ targets(:, 1) targets(:, 2)];
    s_inputs = mapminmaxT([ inputs(:, 1) inputs(:, 2) inputs(:, 100) inputs(:, 111) inputs(:, 150) inputs(:, 160)]);
    s_targets = [ targets(:, 1) targets(:, 2)  targets(:, 100) targets(:, 111)  targets(:, 150) targets(:, 150)];
    % -------    

    crsom = create_crsom(s_inputs, s_targets );
    crsom.trainParam.epochs = epochs;
%     crsom.trainParam.showWindow = false;
    crsom.userdata.net_name = net_name;
    
    crsom = train(crsom, s_inputs);
end
