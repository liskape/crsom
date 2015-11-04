function metacentrum_run    
% *************************************************************************
  net_name = 'realy-random-init-IRIS-1000epochs';
  settings = 'realy random init, IRIS';
  todo = '1)check plotsompos uc and crsom 2)check error, compare with other inits 3)check myplotsom';
  epochs = 1000;
% -------------------------------------------------------------------------
  
    while 1
        [tf msg] = license('checkout','Neural_Network_Toolbox');
        if tf==1, break, end
        display(strcat(datestr(now),' waiting for licence '));
        pause(5);
    end 

    [crsom, in, ta, uc ] = train_iris(epochs, net_name);
    save(strcat(net_name,'.mat'));
end

