function [ color ] = paintit(assigned_inputs, targets)

colors = [];
a = targets(assigned_inputs);

for i=1:length(a)
    class = a(i);
    
%     if max(targets) == 3
%          if class == 1
%             c = [1 1 1]
%         elseif class == 2
%             c = [0 1 0] 
%         elseif class == 3
%             c =[0.5 0 0.5]         
%          end
    if max(targets) == 3
         if class == 1
            c = [228 26 28];
        elseif class == 2
            c = [55 126 184];
        elseif class == 3
            c =[77 175 74]         
         end
    elseif max(targets) == 2
         if class == 1
            c = [228 26 28];
        elseif class == 2
            c = [55 126 184];        
         end
    end
    c =c /255;
    
    colors = [colors; c];
    
end
  
    [r, c] = size(colors);

  if r > 1
      color = mean(colors);
  else
      color = colors;
  end
end

