function metacentrum_run    
% *************************************************************************
% dataset-epochs-version-additional_info
settings = 'IRIS, 5000 epochs, normal config, LR2 = 0.01, normalize';
net_name = regexprep(settings,'[^\w'']','-');
todo =     'compare with 2Kepochs';
epochs = 5000;
normalize = true;
LR2 = 0.01;
% -------------------------------------------------------------------------
  
    while 1
        [tf msg] = license('checkout','Neural_Network_Toolbox');
        if tf==1, break, end
        display(strcat(datestr(now),' waiting for licence '));
        pause(5);
    end 

    [crsom, in, ta, uc ] = train_iris(epochs, net_name, normalize, LR2);
    save(strcat(net_name,'.mat'));
end

