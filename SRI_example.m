function [ result ] = SRI_example( crsom, in, ta, i)
N = length(in);
M = length(unique(vec2ind(ta)));
NEURONS = length(crsom.IW{1});
N_SIDE = sqrt(NEURONS);


win = find(crsom(in(:, i)));

C = vec2ind(ta(:,i));
H = [col_inx(win, N_SIDE) row_idx(win, N_SIDE) ];

inner = zeros(M, 1);

for j = 1:M
    if j ~= C
        min_out = out( crsom, in, ta, i, j, true);

        H_min = [col_inx(min_out, N_SIDE) row_idx(min_out, N_SIDE) ];
        inner(j) = norm(H - H_min);
    end
end

result = sum(inner');
end

