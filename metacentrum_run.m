function metacentrum_run    
% *************************************************************************
% dataset-epochs-version-additional_info
settings = 'dunno';
net_name = regexprep(settings,'[^\w'']','-');
todo =     'will see, what happens, divide clusters :( - check animate position formation';
epochs = 1000;
normalize = true;
LR2 = 0.05;
s_0 = 200; 
s_end = 0.01;

% -------------------------------------------------------------------------
  
    while 1
        [tf msg] = license('checkout','Neural_Network_Toolbox');
        if tf==1, break, end
        display(strcat(datestr(now),' waiting for licence '));
        pause(5);
    end 

    [crsom, in, ta, uc ] = train_iris2dim3CEasy(epochs, net_name, normalize, LR2, s_0, s_end );
    save(strcat(net_name,'.mat'));
end

