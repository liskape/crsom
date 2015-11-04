function metacentrum_run    
% *************************************************************************
  net_name = 'random-conf-IRIS-v3.3';
  settings = 'Random prototype vectores, IRIS';
  todo = 'Compare crsom and uc with plottings';
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

