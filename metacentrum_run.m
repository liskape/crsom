function metacentrum_run    
% *************************************************************************
todo = 'look at map formation & result';
epochs = 1000;
normalize = false;
LR2 = 0.1;
s_0 = 1000; 
s_end = 0.01;
settings = 'NEW SIGMA'; 
problem = 'train_iris2dim3CEasy';
% net_name = sprintf('%s_epochs=%d_normalize=%i_LR2=%.2f_s_0=%d_s_end=%.2f_%s', problem, epochs, normalize, LR2, s_0, s_end,settings);
net_name = 'new_sigma_1000epoch_zeros_init';
% -------------------------------------------------------------------------
  
    while 1
        [tf msg] = license('checkout','Neural_Network_Toolbox');
        if tf==1, break, end
        display(strcat(datestr(now),' waiting for licence '));
        pause(5);
    end 

    [crsom, in, ta, uc ] = train_iris2dim3CEasy(epochs, net_name, normalize, LR2, s_0, s_end );
    save(strcat(net_name,'.mat'));
    
%     delete this shit
    plotsompos(crsom, in);
    savefig(strcat(net_name, '.fig'));
end

