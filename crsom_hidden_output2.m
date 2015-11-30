function [result, neighborhood_restiction, I, s] = crsom_hidden_output2(map, input, neurons, neighborhood_restiction )
        
    w = map.IW{1};
    
    d = repmat(input, neurons, 1) - w;
    
    I = zeros(neurons, 1);
    
    for i=1:neurons
        I(i) = power(norm(d(i,:)),2);
    end
    
    s = exp(-I);
    result = s .* neighborhood_restiction;
end

