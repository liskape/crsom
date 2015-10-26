function [ output_args ] = metacentrum_run( )
    ds = csvread('wine.dat');
    som = winemmap();
    som = train(som, ds(:,2:14)');
    save('outputsom.mat', 'som');
end

