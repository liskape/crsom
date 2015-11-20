function metacentrum_run    
% *************************************************************************
  % dataset-epochs-version-additional_info
  net_name = 'IRIS-1000-normalconf-LR2-0_1-denormalized';
  settings = 'IRIS, 1000 epochs, normal config, LR2 = 0.1 denormalize';
  todo =     '1)hartono16 recreate experiment 2) compare to IRIS-1000-randomconf-LR2-0_1-normalized';
  epochs = 1000;
% -------------------------------------------------------------------------
  
    while 1
        [tf msg] = license('checkout','Neural_Network_Toolbox');
        if tf==1, break, end
        display(strcat(datestr(now),' waiting for licence '));
        pause(5);
    end 

    [crsom, in, ta, uc ] = train_iris(epochs, net_name, false);
    save(strcat(net_name,'.mat'));
end

