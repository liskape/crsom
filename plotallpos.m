function [ output_args ] = plotallpos( crsom, in, tar )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    [dims, examples] = size(in);
    a = nchoosek(1:dims, 2);
    
    original = crsom.IW{1};
    original_inputs = in;
    
    for i = 1:length(a)
        figure
       crsom.IW{1}(:, 1:2) = original(:, a(i,:));
       
       in(1:2,:) = original_inputs(a(i,:),:);
       
      
       plotsompos(crsom, in);
       
        gscatter(in(1,:), in(2,:), vec2ind(tar)');
    end

end

