function benchmark_implementation(type, version)
% *************************************************************************
% type = ['benchmark' | 'test']
% -------------------------------------------------------------------------
    while 1
        [tf msg] = license('checkout','Neural_Network_Toolbox');
        if tf==1, break, end
        display(strcat(datestr(now),' waiting for licence '));
        pause(5);
    end 

    switch type
        case 'benchmark'
            times = []
            err = []
            for i= 1:10
                tic
                [crsom, in, ta, uc ] = train_problem_versioned('met_mad_la', 500, 'met_mad_la_benchmark', 4, 0.1, 200, 0.01, 1, version );
                times =  [toc, times];
                load('benchmark_expected.mat')
                assert(sum(sum(benchmark_expected - crsom.IW{1})) == 0)
                err = [sum(sum(benchmark_expected - crsom.IW{1})), err]
            end
            
            log_benchmark(times, err, version)
                       
        case 'test'
            times = []
            err = []
            for i= 1:2
                tic
                [crsom, in, ta, uc ] = train_problem_versioned('arctic_monkeys_albs', 20, 'arctic_monkeys_albs_test', 4, 0.1, 200, 0.01, 1, version );
                times =  [toc, times];
                load('test_expected.mat')
                assert(sum(sum(test_expected - crsom.IW{1})) == 0)
                err = [sum(sum(test_expected - crsom.IW{1})), err]
            end
            log_benchmark(times, err, version )
              times
            mean(times)
            'cool cool cool'
        otherwise
            type
            unkknown_type
    end

end

