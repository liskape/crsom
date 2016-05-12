% activated neuron for outerclass nearest input
function [ result ] = out( crsom, in, ta, i, j, find_min);

   current_input = in(:, i);
   j_class_map = (vec2ind(ta) == j)';
   
     a = length(in);
     b = zeros(a, 1);
     c = in - repmat(current_input, 1, a);
   
   
     for d = 1:a
       b(d, :) = norm(c(:, d));
     end
        
   if find_min
    nearest_j_class_points = find(b == min(b(j_class_map)));
    result = find(crsom(in(:,nearest_j_class_points(1))));
    
   else
    farthest_j_class_points = find(b == max(b(j_class_map)));
    result = find(crsom(in(:,farthest_j_class_points(1))));
   end
end

