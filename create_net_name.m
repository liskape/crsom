function [ netname ] = create_net_name( problem, epochs, normalize, map_size, LR2, settings )
netname = sprintf('%s_ep=%d_norm=%i_size=%.2f_LR2=%.2f_%s', problem, epochs, normalize, map_size, LR2, settings);
end

