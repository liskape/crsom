function metacentrum_run    
% *************************************************************************
% dataset-epochs-version-additional_info
settings = '2DimIris-1000';
net_name = regexprep(settings,'[^\w'']','-');
todo =     'will see, what happens, divide clusters :(';
epochs = 10000;
normalize = true;
LR2 = 0.1;
s_0 = 200;
s_end = 0.05;

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

