function [ colors ] = colorize( classVector )
    [w, d] = size(classVector)
    colors = ones(d, 3)
    miss_class = max(classVector);
    
    colors = replaceColor(colors,classVector, miss_class, [0 0 0]);
    colors = replaceColor(colors,classVector, 1, [0 0 1]);
    colors = replaceColor(colors,classVector, 2, [1 0 0]);
    
    if miss_class > 3
        colors = replaceColor(colors,classVector, 3, [0 1 0]);
    end
end

