function [adjustments, new_cn, E, O_h, s, sigma_neig] = context_net_adapt2( cn, som, input, target, win, t, t_end, LR2, s_0, s_end )
   [NEURONS, input_size] = size(som.IW{1});
   OUTPUTS = length(target);
   [O_h, sigma_neig, I_h, s] = crsom_hidden_output(som, input', NEURONS, win, t, t_end, s_0, s_end);
   [new_cn,Y,E,Pf,Af,tr] = adapt2(cn, O_h, target);

%     Y = sim(cn, O_h);
%     new_cn  = cn;
    E = tr.perf;
  

%    E = mean((target - Y).^2);
   delta_k = (Y - target).* Y.* (1 - Y);

   %    -------------------------
% for i=1:NEURONS
%    cn.IW{1}(:,i) = cn.IW{1}(:,i) - delta_k.*LR.*O_h(i);
% end
% 
% 
%     cn.b{1}(:) = cn.b{1}(:) + delta_k.*LR;

%        new_cn = cn;
%    -------------------------
   first_part = -s;
   delta_ks = repmat(delta_k', NEURONS, 1);
   sumation = sum((delta_ks.*(cn.IW{1}'))')';
   delta_h = first_part .* sumation;
   
   d = repmat(input', NEURONS, 1)  - som.IW{1};
  
   adjustments = d.* repmat(sigma_neig.*delta_h .* LR2, 1, input_size);
 end

