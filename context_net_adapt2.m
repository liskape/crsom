function [adjustments, new_cn, E, O_h, s, sigma_neig, observed_delta_h, observed_koefs] = context_net_adapt2( cn, som, input, target, win, t, t_end, LR2, s_0, s_end )
    OBSERVED_NEURON = 1;
   [NEURONS, input_size] = size(som.IW{1});
   OUTPUTS = length(target);
   
   [O_h, sigma_neig, I_h, s] = crsom_hidden_output(som, input', NEURONS, win, t, t_end, s_0, s_end);
   [new_cn,Y,e,Pf,Af,tr] = adapt(cn, O_h, target);

   E = tr.perf;
   
   
   delta_k = (Y - target).* Y.* (1 - Y);
   
   first_part = -s;
   delta_ks = repmat(delta_k', NEURONS, 1);
   sumation = sum((delta_ks.*(cn.IW{1}'))')';
   delta_h = first_part .* sumation;

%    delta_h = 1;
   
   koefs = sigma_neig.*delta_h .* LR2;
    
   
   observed_delta_h = delta_h(OBSERVED_NEURON);
   observed_koefs = koefs(OBSERVED_NEURON);
   
   d = repmat(input', NEURONS, 1)  - som.IW{1};
  
   adjustments = d.* repmat(koefs, 1, input_size);
   
   
    if t == 40
   t
   end
    
    if t == 5
       t
      end
    
        if t == 15
       t
        end
    
    if t == 30
       t
    end
 end

