function sri = SRI( crsom, in, ta )

N = length(in);
M = length(unique(vec2ind(ta)));
NEURONS = length(crsom.IW{1});
N_SIDE = sqrt(NEURONS);

a = zeros(N, 1);

for i = 1:N
    a(i) = SRI_example( crsom, in, ta, i);
end

I = sum(a) / (N * (M - 1));



a = zeros(N, 1);

for i = 1:N
    win = find(crsom(in(:, i)));
    C = vec2ind(ta(:,i));
    H = [col_inx(win, N_SIDE) row_idx(win, N_SIDE) ];
    
    a(i) = norm(H - out( crsom, in, ta, i, C, false));
end

O = sum(a) / N;




sri =  O / I;

end

