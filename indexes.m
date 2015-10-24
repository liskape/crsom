function [ output_args ] = indexes(ind, n  )
   a = n;
   output_args = [ceil(ind/a), mod(ind - 1, a) + 1];
end
