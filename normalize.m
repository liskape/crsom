function [ out ] = normalize( matrix )

    x = max(matrix);
    n = min(matrix);
    [r c] = size(matrix);
    
    for i = 1:c
        matrix(:, i) = (matrix(:, i) - repmat(n(i), r, 1))./ (repmat(x(i), r, 1) - repmat(n(i), r, 1));
    end
    out = matrix;
end

