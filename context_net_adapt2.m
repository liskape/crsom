function [adjustments, new_cn, E] = context_net_adapt2( cn,som, input, target, win, t, t_end )

   LR2=0.01;

   [NEURONS, input_size] = size(som.IW{1});
   OUTPUTS = length(target);
   
   O_h = zeros(NEURONS,1);
   sigma_neig = zeros(NEURONS,1);
   I_h = zeros(NEURONS,1);
   s = zeros(NEURONS,1);    

   for i = 1:NEURONS
     [O_h(i),sigma_neig(i), I_h(i), s(i)] = crsom_hidden_output(som, input', i, win, t, t_end);
   end
   
   
   
   [new_cn,Y,delta_k,Pf,Af,tr] = adapt(cn, O_h, target);

   E = tr.perf;
   
    % prototype vectors adjustments ----------------------------------------
    % ?ih(t) = ?e?Iih(t) (?k(t)vik(t))
    % Wi(t+1)=Wi(t)+?2?ih(t)?(win,i,t)(X(t)?Wi(t))
    delta_h = zeros(NEURONS,1);
    adjustments = zeros(NEURONS,length(input));
    for i = 1:NEURONS
      first_part = -exp(-I_h(i));
      sumation = sum(delta_k.* cn.IW{1}(i));
      delta_h(i) =  first_part * sumation;
      adjustments(i, :) =  (input' - som.IW{1}(i, :)) * sigma_neig(i) *  delta_h(i)* LR2;
    end
    
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

