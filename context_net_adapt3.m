function [ delta_h, new_cn, E, O_h, s, sigma_neig ] =  context_net_adapt3( cn, som, input, target, sigma_neig )
   [NEURONS, input_size] = size(som.IW{1});
   OUTPUTS = length(target);
   
   [O_h, sigma_neig, I_h, s] = crsom_hidden_output2(som, input', NEURONS, sigma_neig);
   [new_cn,Y,e,Pf,Af,tr] = adapt(cn, O_h, target);

   E = tr.perf;
   
   delta_k = (Y - target).* Y.* (1 - Y);
   
   first_part = -s;
   delta_ks = repmat(delta_k', NEURONS, 1);
   sumation = sum((delta_ks.*(cn.IW{1}'))')';
   delta_h = first_part .* sumation;
end

