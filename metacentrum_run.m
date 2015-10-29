function [ output_args ] = metacentrum_run( )
    while 1
        [tf msg] = license('checkout','Neural_Network_Toolbox');
        if tf==1, break, end
        display(strcat(datestr(now),' waiting for licence '));
        pause(5);
    end 

    som = train_wine(300);
    save('wine_som-fixed-bias-fixed-adjustments.mat', 'som');
end

