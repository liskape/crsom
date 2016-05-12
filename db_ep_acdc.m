
examples = in
targets = ta

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
crosses_rows = [];
crosses_cols = [];
sizes = [];
colors = []; 

for i=1:length(winners)
    assigned_inputs = cell2mat(winners(i));
    
   if ~isempty(assigned_inputs)
       
       if length(unique(targets(assigned_inputs))) == 1
           to_plot_rows = [to_plot_rows row_idx(i, N)]; 
           to_plot_cols = [to_plot_cols col_inx(i, N)]; 
           sizes = [sizes sqrt(length(assigned_inputs)) * 100];
           colors = [colors; paintit(assigned_inputs, targets)];
       else
            crosses_rows = [crosses_rows row_idx(i, N)];
            crosses_cols = [crosses_cols col_inx(i, N)];
       end
       
   end
end

s = scatter(to_plot_cols, to_plot_rows, sizes, colors, 'filled');

if max(targets) == 2
    hold on
    scatter(0,0,0, [0 0 0], 'filled', 'MarkerEdgeColor', [0 0 0]);
end

if max(targets) == 3
   hold on
    scatter(0,0,0, [1 0 0], 'filled', 'MarkerEdgeColor', [0 0 0]);
    scatter(0,0,0, [0 0.5 0.5], 'filled', 'MarkerEdgeColor', [0 0 0]);
end

hold on
scatter(crosses_cols, crosses_rows, 100, [0 0 0], 'x', 'LineWidth', 2);
grid on
axis([0,N+1,0,N+1])
xlabel('x-coordinate of neuron', 'FontSize', 18)
ylabel('y-coordinate of neuron', 'FontSize', 18)
% legend('David Bowie', 'Elvis Presley', 'AC/DC', 'conflict')
% title('CRSOM map')
% set(gca,'Color',[0.5 0.5 0.5]);


set(gca,'XTick',0:N+1, 'XMinorTick','on')
set(gca,'YTick',0:N+1, 'YMinorTick','on')



if isfield(crsom.userdata, 'net_name')
    title(crsom.userdata.net_name, 'FontSize', 22)
end

title('SOM map', 'FontSize', 22)
box on