function [adjustments, new_cn, E] = context_net_adapt2( cn,som, input, target, win, t, t_end )

   LR2=0.01;

   [NEURONS, input_size] = size(som.IW{1});
   OUTPUTS = length(target);
   
   [O_h, sigma_neig, I_h, s] = crsom_hidden_output(som, input', NEURONS, win, t, t_end);

   [new_cn,Y,delta_k,Pf,Af,tr] = adapt(cn, O_h, target);

   E = tr.perf;
   
   
   
    % prototype vectors adjustments ----------------------------------------
    % ?ih(t) = ?e?Iih(t) (?k(t)vik(t))
    % Wi(t+1)=Wi(t)+?2?ih(t)?(win,i,t)(X(t)?Wi(t))

%     for i = 1:NEURONS
%       first_part = -exp(-I_h(i));
%       sumation = sum(delta_k.* cn.IW{1}(:,i));
%       delta_h(i) =  first_part * sumation;
%       adjustments(i, :) =  (input' - som.IW{1}(i, :)) * sigma_neig(i) *  delta_h(i)* LR2;
%     end
    
    
    
    first_part = -exp(-I_h);
    delta_ks = repmat(delta_k', NEURONS, 1);
    sumation = sum((delta_ks.*(cn.IW{1}'))')';
    delta_h = first_part .* sumation;
    
    koefs = sigma_neig.*delta_h .* LR2;
    
    d = repmat(input', NEURONS, 1)  - som.IW{1};
  
    adjustments = d.* repmat(koefs, 1, input_size);
    
    
%      sigma_neig
%     LR2
    
    if t == 50
        t
    end
    
     if t == 200
        t
        end
    
        
     if t == 500
        t
     end
    
             
     if t == 800
        t
    end
 end
