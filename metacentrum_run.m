function metacentrum_run    
% *************************************************************************
  % dataset-epochs-version-additional_info
  net_name = 'WINE-1000-normconf-LR2-0_1';
  settings = 'WINE, 1000 epochs, normal config, LR2 = 0.1';
  todo =     '1)result should be the same as hartono16';
  epochs = 1000;
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

