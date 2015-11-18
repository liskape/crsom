function metacentrum_run    
% *************************************************************************
  % dataset-epochs-version-additional_info
  net_name = 'WINE-2000-normconf';
  settings = 'WINE, 2000 epochs, normal config';
  todo =     '1)look at result | 2)look at history of map formation';
  epochs = 2000;
% -------------------------------------------------------------------------
  
    while 1
        [tf msg] = license('checkout','Neural_Network_Toolbox');
        if tf==1, break, end
        display(strcat(datestr(now),' waiting for licence '));
        pause(5);
    end 

    [crsom, in, ta, uc ] = train_wine(epochs, net_name);
    save(strcat(net_name,'.mat'));
end

