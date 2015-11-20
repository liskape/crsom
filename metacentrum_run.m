function metacentrum_run    
% *************************************************************************
% dataset-epochs-version-additional_info
net_name = 'IRIS-100-normalconf-LR2-0_1-normalized';
settings = 'IRIS, 100 epochs, normal config, LR2 = 0.1 normalize';
todo =     '';
epochs = 100;
% -------------------------------------------------------------------------
  
    while 1
        [tf msg] = license('checkout','Neural_Network_Toolbox');
        if tf==1, break, end
        display(strcat(datestr(now),' waiting for licence '));
        pause(5);
    end 

    [crsom, in, ta, uc ] = train_iris(epochs, net_name, true, 0.1);
    save(strcat(net_name,'.mat'));
end

