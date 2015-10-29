% not used actually !!!!!
function [ som, cn, E ] = crsom_adapt( som, cn, input, target, t, t_end )
% constants
   LR1=0.2;
   LR2=0.1;

   [NEURONS, input_size] = size(som.IW{1});
   OUTPUTS = length(target);
   
   O_h = zeros(NEURONS,1);
   sigma_neig = zeros(NEURONS,1);
   I_h = zeros(NEURONS,1);
   s = zeros(NEURONS,1);    

   for i = 1:NEURONS
     [O_h(i),sigma_neig(i), I_h(i), s(i)] = crsom_hidden_output(som, input', i, win, t, t_end);
   end
   
   % context regulation ----------------------------------------------
   O_k = zeros(OUTPUTS,1);

   for k = 1:OUTPUTS
     I_k = sum( O_h.*(cn.IW{1}(k,:)')) - cn.b{1}(k);
     O_k(k) = sigmoid(I_k);
   end

   E = sum(power(O_k - target, 2)) / 2;
   E


   % ?k(t) = (Ok(t)?Tk(t))Ok(t)(1?Ok(t)) -- delta rule
   delta_k = (O_k - target).*O_k.*(1 - O_k);

   % weights adjustments from 
   % v_ik(t + 1) = v_ik(t) ? ?1*?k(t)*O_ih(t)
   for k = 1:OUTPUTS
     cn.IW{1}(k,:) = cn.IW{1}(k,:) - (O_h.* (LR1* delta_k(k)))';
   end

    % bias adjustment
    % ?k (t + 1) = ?k(t) + ?1?k(t).
   for k = 1:OUTPUTS
     cn.b{1}(k,:) = cn.b{1}(k,:) - ( (LR1* delta_k(k)))';
   end
end

