function [adjustments, new_cn, E] = context_net_adapt2( cn, som, input, target, win, t, t_end )

   LR2=0.1;

   [NEURONS, input_size] = size(som.IW{1});
   OUTPUTS = length(target);
   
   [O_h, sigma_neig, I_h, s] = crsom_hidden_output(som, input', NEURONS, win, t, t_end);
   [new_cn,Y,e,Pf,Af,tr] = adapt(cn, O_h, target);

   delta_k = (Y - target).* Y.* (1 - Y);
   
   E = tr.perf;
      
   first_part = -exp(-I_h);
   delta_ks = repmat(delta_k', NEURONS, 1);
   sumation = sum((delta_ks.*(cn.IW{1}'))')';
   delta_h = first_part .* sumation;
    
   koefs = sigma_neig.*delta_h .* LR2;
    
   d = repmat(input', NEURONS, 1)  - som.IW{1};
  
   adjustments = d.* repmat(koefs, 1, input_size);
    
    
%      sigma_neig
%     LR2
    
%     if t == 1
%         t
%     end
% 
%     if t == 5
%         t
%     end
%     
%      if t == 10
%         t
%      end
%     
%         
%      if t == 18
%         t
%      end
%     
%              
%      if t == 800
%         t
%     end
 end

