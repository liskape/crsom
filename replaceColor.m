function [ replaced ] = replaceColor(colors, classVector, class, color)
    
    replaced = colors
    indexes = find(classVector == class)
    replaced(indexes,:) = repmat(color,length(indexes),1)
end

