function metacentrum_run    
% *************************************************************************
% dataset-epochs-version-additional_info
settings = 'IRIS2DIM-1000-0.1-50-0.1-true';
net_name = regexprep(settings,'[^\w'']','-');
todo =     'look at error and map formation - should divide clusters';
epochs = 1000;
normalize = true;
LR2 = 0.1;
s_0 = 50;
s_end = 0.1;

% -------------------------------------------------------------------------
  
    while 1
        [tf msg] = license('checkout','Neural_Network_Toolbox');
        if tf==1, break, end
        display(strcat(datestr(now),' waiting for licence '));
        pause(5);
    end 

    [crsom, in, ta, uc ] = train_iris2dim(epochs, net_name, normalize, LR2, s_0, s_end );
    save(strcat(net_name,'.mat'));
end

