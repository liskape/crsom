function [ output_args ] = col_inx( ind, n)
   a = n;
   output_args = mod(ind - 1, a) + 1;

end

