function [ plot ] = my_plot_som( net, examples, targets )

targets = vec2ind(targets);

% neuron map side
N = net.layers{1}.dimensions(1);

% (example) -> [neuron, class]
a = [vec2ind(net(examples)); targets];

% classes for neuron 28
% a(2, (a(1,:) == 28))

A = a(1,:);
% n = how many in each bucket
% bin: (example) -> bin
[n, bin] = histc(A, unique(A));

% find bins with multiple assigned examples
multiple = find(n > 1);

% multiple occurence
index_multiple_occurences = find(ismember(bin, multiple)); 

% [neuron, class] ([a,1], [a,2] means miss)
unique_misses = unique(a(:,index_multiple_occurences)','rows')';

A = (unique_misses(1,:));
[n, bin] = histc(A, unique(A));
multiple = find(n > 1);
index    = find(ismember(bin, multiple));

bad_neurons = unique(A(index));
bad_neurons_map = ismember(a(1,:), bad_neurons);

evaluation_with_misses = targets;

evaluation_with_misses(bad_neurons_map) = max(targets) + 1;

unique_to_plot = unique([a(1,:); evaluation_with_misses]', 'rows');


x = unique(a(1,:)');
sizes = [x,histc(a(1,:)',x)];
colors = colorize(unique_to_plot(:,2), max(targets));
s = scatter(row_idx(unique_to_plot(:,1),N), col_inx(unique_to_plot(:,1), N),sizes(:,2)*100, colors,'filled');

unique_to_plot;
% results = [unique_to_plot(1); col_inx(a(1,:), N); evaluation_with_misses]

% scatter = gscatter(row_idx(a(1,:),N), col_inx(a(1,:), N), evaluation)
% s = scatter(row_idx(unique_to_plot(:,1),N), unique_to_plot(a(:,1), N))
end

