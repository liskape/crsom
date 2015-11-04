function metacentrum_run    
% *************************************************************************
  net_name = 'normal-init-IRIS-3000epochs';
  settings = 'normal init, IRIS';
  todo = '1)Compare crsom and uc with plottings 2)check error 3)compare with IRIS 1000';
  epochs = 3000;
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

