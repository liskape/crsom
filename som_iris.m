load fisheriris;
load iris_dataset;
% gplotmatrix(meas)
% gscatter(meas(:,1), meas(:, 2), species)
% scatterhist(meas(:,1), meas(:,2),'Group',species)
% gplotmatrix(meas(:, 1:2), meas(:, 3:4), species)

N = 10
net = selforgmap([N N],10, 3, 'gridtop', 'dist');
net = train(net, (meas'));

test = meas(:, :)'
% 
% y = net(test);
% classes = vec2ind(y);

% pos = gridtop(50,50);
% plotsom(pos);


% plotsomtop(net);

a = [vec2ind(net(test(:, :))); vec2ind(irisTargets)];
% gscatter(row_idx(a(1,:), 2500), col_inx(a(1,:), 2500), species)

A = a(1,:);
[n, bin] = histc(A, unique(A));
multiple = find(n > 1);
index    = find(ismember(bin, multiple));


% delete later
% a(2, 11) = 2;
% ---------------

unique_misses = unique(a(:,index)','rows')';

A = (unique_misses(1,:));
[n, bin] = histc(A, unique(A));
multiple = find(n > 1);
index    = find(ismember(bin, multiple));

bad_neurons = unique(A(index));


bad_neurons_map = ismember(a(1,:), bad_neurons)

% a(2, index) = 4
spe = species;
spe(bad_neurons_map) = {'miss'}

tar = vec2ind(irisTargets);
tar(index) = 4;


gscatter(row_idx(a(1,:),N), col_inx(a(1,:), N), spe)
% scatter(row_idx(a(1,:), 2500), col_inx(a(1,:), 2500), tar,'d','.','o', 'x')