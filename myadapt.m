function [ new_cn,O_k, E, d_k] = myadapt(cn, O_h, T_k)
    LR1 = 0.01;
    
    target_size = length(T_k);
    input_size = length(O_h);

 O_k = sim(cn, O_h);
 E = sum( power((O_k - T_k),2) ) * 0.5;
 
 % deltas
 d_k = (O_k - T_k).* O_k .*(1 - O_k);
 
  % weigts adjusments
   rep_O_h  = repmat(O_h, 1,target_size);
   rep_d_k = repmat(d_k', input_size, 1);
   
   adjustments = rep_O_h .* rep_d_k * LR1;
   cn.IW{1} = cn.IW{1} - adjustments';
   
  % biash adjusments
  cn.b{1} = cn.b{1} - LR1 * d_k;
    

  new_cn = cn;
end

