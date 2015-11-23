function sri = SRI( crsom, in, ta )

N = length(in);
M = length(unique(vec2ind(ta)));

% NEURONS = length(crsom.IW{1});
a = zeros(N);

for i = 1:N
    a(i) = SRI_example( crsom, in, ta, i)
end

I = sum(a) / (N * (M - 1));


% I_class = 

sri = 10


end

