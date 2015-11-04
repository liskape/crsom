function metacentrum_run    
% *************************************************************************
  net_name = 'IRIS-30000-normconf';
  settings = 'IRIS, 3000epochs, normal config';
  todo = '1)compare with IRIS-3000 | 2)look at history of map formation';
  epochs = 30000;
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

