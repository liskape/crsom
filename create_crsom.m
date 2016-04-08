function [ crsom ] = create_crsom(inputs, targets, LR2, s_0, s_end, map_size)
    [r_in c_in] = size(inputs);
    [r_tar c_tar] = size(targets);

    nodes_size = floor(sqrt(c_in * map_size));

 
    som = selforgmap([nodes_size nodes_size],10, 3, 'gridtop', 'dist');

        
  som.userdata = struct('targets', targets,...
                        'enable_snapping', true,...
                        'store_errors', true,...
                        'enable_logging', false,...
                        'computing_details', true, 'errors', [],...
                        'net_name', '', 'mean_adjusts', [],...
                        'history_snaps', [], 'context_snaps', [],...
                        'snapped_epochs', [], 'lr2', LR2, 's_0', s_0, 's_end',...
                        s_end, 'mean_O_h', [], 'first_part', [],'second_part', [],...
                        'observed_delta_h', [], 'observed_koefs', []);
                    
  som = configure(som, inputs);
  cn = context_net2(ones(nodes_size*nodes_size,1), ones(r_tar,1));
  cn.trainFcn = 'traincrsom';
  cn.userdata.som = som;

  
  crsom = cn;

end

