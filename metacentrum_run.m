function metacentrum_run    
% *************************************************************************
% dataset-epochs-version-additional_info
settings = 'wtf 1 cluster 3000';
net_name = regexprep(settings,'[^\w'']','-');
todo =     'should create one cluster';
epochs = 3000;
normalize = true;
LR2 = 0.1;
% -------------------------------------------------------------------------
  
    while 1
        [tf msg] = license('checkout','Neural_Network_Toolbox');
        if tf==1, break, end
        display(strcat(datestr(now),' waiting for licence '));
        pause(5);
    end 

    [crsom, in, ta, uc ] = train_iris2dim(epochs, net_name, normalize, LR2);
    save(strcat(net_name,'.mat'));
end

