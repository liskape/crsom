function metacentrum_run    
% *************************************************************************
% dataset-epochs-version-additional_info
settings = '2DIMIris-1000-0.01-200-0.01-false';
net_name = regexprep(settings,'[^\w'']','-');
todo =     'divide clusters :(';
epochs = 1000;
normalize = false;
LR2 = 0.01;
s_0 = 200;
s_end = 0.01;

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

