function [ output_args ] = log_benchmark(times, err, version )

    filename = sprintf('benchmark_result_%u.log',version);
    fileID = fopen(filename,'w');
    
    fprintf(fileID,sprintf('errors: %s\n',  mat2str(err)));
    fprintf(fileID,sprintf('mean error: %f\n',  mean(err)));
    fprintf(fileID,sprintf('times: %s\n',  mat2str(times)));
    fprintf(fileID,sprintf('mean time: %f\n',  mean(times)));
    fclose(fileID);

end

