function [ output_args ] = metacentrum_run( )
while 1
    [tf msg] = license('checkout','Neural_Network_Toolbox');
    if tf==1, break, end
    display(strcat(datestr(now),' waiting for licence '));
    pause(5);
end 

    ds = csvread('wine.dat');
    som = winemmap();
    som = train(som, ds(:,2:14)');
    save('outputsom.mat', 'som');
end

