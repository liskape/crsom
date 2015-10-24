function [ plot ] = my_plot_som( examples, targets, N )

if nargin > 3
    error('TooManyInputs');
end

switch nargin
    case 2
        [rows cols] = size(examples);
        N = floor(sqrt(rows));
        N = N- 2
end

net = selforgmap([N, N],100, 3, 'gridtop', 'dist');
net = train(net, examples');

test = examples';


a = [vec2ind(net(test)); targets];

A = a(1,:);
[n, bin] = histc(A, unique(A));
multiple = find(n > 1);
index_multiple_occurences    = find(ismember(bin, multiple)); % multiple occurences


% delete later
% a(2, 11) = 2;
% ---------------

unique_misses = unique(a(:,index_multiple_occurences)','rows')';

A = (unique_misses(1,:));
[n, bin] = histc(A, unique(A));
multiple = find(n > 1);
index    = find(ismember(bin, multiple));

bad_neurons = unique(A(index));
bad_neurons_map = ismember(a(1,:), bad_neurons);

evaluation_with_misses = targets;
evaluation_with_misses(bad_neurons_map) = max(targets) + 1;


unique_to_plot = unique([a(1,:); evaluation_with_misses]', 'rows')


x = unique(a(1,:)')
sizes = [x,histc(a(1,:)',x)];
colors = colorize(unique_to_plot(:,2));
s = scatter(row_idx(unique_to_plot(:,1),N), col_inx(unique_to_plot(:,1), N),sizes(:,2)*100, colors,'filled')

unique_to_plot
% results = [unique_to_plot(1); col_inx(a(1,:), N); evaluation_with_misses]

% scatter = gscatter(row_idx(a(1,:),N), col_inx(a(1,:), N), evaluation)
% s = scatter(row_idx(unique_to_plot(:,1),N), unique_to_plot(a(:,1), N))
end

