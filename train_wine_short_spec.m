function [ output_args ] = train_wine_short_spec(regenerate)
    if regenerate
        [net, n, t] = train_wine_short(30, 'a');
        save(strcat('train_wine_short_spec_net','.mat'), 'net');
        save(strcat('train_wine_short_spec_net_n_net','.mat'), 'n');
        save(strcat('train_wine_short_spec_t','.mat'), 't');    
    else
        a = 'running...'
        [actual_net, actual_n, actual_t] = train_wine_short(30, 'a');
        load('train_wine_short_spec_net');
        load('train_wine_short_spec_net_n_net');
        load('train_wine_short_spec_t');
        
        if ~isequal(actual_n, n);
            error('input FAIL');
        end
        
        if ~isequal(actual_t, t);
            error('target FAIL');
        end
        
        if ~isequal(net.IW{1},actual_net.IW{1});
            error('FAIL');
        else
            output_args = 'OK'
        end
    end
end

