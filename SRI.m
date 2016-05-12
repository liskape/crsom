function [sri, I, O] = SRI( crsom, in, ta )

N = length(in);
M = length(unique(vec2ind(ta)));
NEURONS = length(crsom.IW{1});
N_SIDE = sqrt(NEURONS);


% compute O --------------------------------------
a = zeros(N, 1);

for i = 1:N
    a(i) = SRI_example( crsom, in, ta, i);
end

O = sum(a) / (N * (M - 1))


% compute I -------------------------------------
a = zeros(N, 1);

for i = 1:N
    win = find(crsom(in(:, i)));
    C = vec2ind(ta(:,i));
    H = [row_idx(win, N_SIDE) col_inx(win, N_SIDE) ];

    a(i) = norm(H - getCoord(out( crsom, in, ta, i, C, false), N_SIDE));
end

I = sum(a) / N


% final result -----------------------------------

sri =   O / I;

end

