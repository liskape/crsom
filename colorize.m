function [ colors ] = colorize( classVector, classes_count )
    [w, d] = size(classVector)
    colors = ones(d, 3)
    
    
    if max(classVector) > classes_count
        miss_class = classes_count + 1;
        % black
        colors = replaceColor(colors,classVector, miss_class, [0 0 0]);
    end
    
    % blue
    colors = replaceColor(colors,classVector, 1, [0 0 1]); 
    
    % red
    colors = replaceColor(colors,classVector, 2, [1 0 0]);
    

    if classes_count > 2
        % green
        colors = replaceColor(colors,classVector, 3, [0 1 0]);
    end
    
    
    if classes_count > 3
        colors = replaceColor(colors,classVector, 4, [1 0 1]);
    end
    
    if classes_count > 4
        colors = replaceColor(colors,classVector, 5, [1 1 0]);
    end
end

