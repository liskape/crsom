function [ s ] = my_plot_som_no_confl( crsom, examples, targets )



targets = vec2ind(targets);

% % neuron map side
N = crsom.layers{1}.dimensions(1);


winners = cell(1, length(targets));


    for i=1:length(examples)
       win = find(crsom(examples(:, i)));
       
       winners(win) = mat2cell([cell2mat(winners(win)) i], 1);
    end

     
to_plot_rows = [];
to_plot_cols = [];
sizes = [];
colors = []; 

for i=1:length(winners)
    assigned_inputs = cell2mat(winners(i));
    
   if ~isempty(assigned_inputs)
       to_plot_rows = [to_plot_rows row_idx(i, N)]; 
       to_plot_cols = [to_plot_cols col_inx(i, N)]; 
       sizes = [sizes sqrt(length(assigned_inputs)) * 150];
       colors = [colors; paintit(assigned_inputs, targets)];
       
   end
end

s = scatter(to_plot_cols, to_plot_rows, sizes, colors, 'filled', 'MarkerEdgeColor', [0 0 0]);

if max(targets) == 2
    hold on
    scatter(0,0,0, [0 0 0], 'filled', 'MarkerEdgeColor', [0 0 0]);
end
grid on
grid minor
axis([0,N+1,0,N+1])
xlabel('x-coordinate of neuron')
ylabel('y-coordinate of neuron')
% legend('class A', 'class B')
set(gca,'Color',[0.5 0.5 0.5]);

if isfield(crsom.userdata, 'net_name')
    title(crsom.userdata.net_name)
end
end

