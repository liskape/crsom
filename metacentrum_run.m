function metacentrum_run    
% *************************************************************************
todo = 'compare with different settings';
epochs = 30000;
normalize = false;
LR2 = 0.01;
s_0 = 200; 
s_end = 0.01;
settings = 'random_weights'; 
problem = 'f_train_iris';
net_name = sprintf('%s_epochs=%d_normalize=%i_LR2=%.2f_s_0=%d_s_end=%.2f_%s', problem, epochs, normalize, LR2, s_0, s_end,settings);
% net_name = 'dunno'
% -------------------------------------------------------------------------
  
    while 1
        [tf msg] = license('checkout','Neural_Network_Toolbox');
        if tf==1, break, end
        display(strcat(datestr(now),' waiting for licence '));
        pause(5);
    end 

    [crsom, in, ta, uc ] = train_iris(epochs, net_name, normalize, LR2, s_0, s_end );
    save(strcat(net_name,'.mat'));
    
%     delete this shit
    plotsompos(crsom, in);
    savefig(strcat(net_name, '.fig'));
end

