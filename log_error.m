function log_error( epoch, error, name)
        if epoch == 0
            fileID = fopen(strcat(name,'.log'),'w');
        else
            fileID = fopen(strcat(name,'.log'),'a');
        end
        
        fprintf(fileID,'%d; %f\n',  epoch, error);
        fclose(fileID);
end

