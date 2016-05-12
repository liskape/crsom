function [crosses_cols, crosses_rows, neurons ] = plot_crsom_crosses( crsom, examples, targets )

targets = vec2ind(targets);

% % neuron map side
N = crsom.layers{1}.dimensions(1);


winners = cell(1, N*N);


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

neurons = zeros(1,N*N);
miss = max(targets)+1;


for i=1:length(winners)
    assigned_inputs = cell2mat(winners(i));
    
   if ~isempty(assigned_inputs)
       
       classes = targets(assigned_inputs);
       
       if length(unique(classes)) == 1
           to_plot_rows = [to_plot_rows row_idx(i, N)]; 
           to_plot_cols = [to_plot_cols col_inx(i, N)]; 
           sizes = [sizes sqrt(length(assigned_inputs)) * 80];
           colors = [colors; paintit(assigned_inputs, targets)];
           
           
            neurons(i) = classes(1);
       else
            crosses_rows = [crosses_rows row_idx(i, N)];
            crosses_cols = [crosses_cols col_inx(i, N)];
            
             neurons(i) = miss;
       end
   else
       neurons(i) = 0;
   end
end

s = scatter(to_plot_cols, to_plot_rows, sizes, colors, 'filled');

 hold on
scatter(crosses_cols, crosses_rows, 100, [0 0 0], 'x', 'LineWidth', 2);


grid on
axis([0,N+1,0,N+1])
xlabel('x-coordinate of neuron', 'FontSize', 18)
ylabel('y-coordinate of neuron', 'FontSize', 18)
set(gca,'XTick',0:N+1, 'XMinorTick','on')
set(gca,'YTick',0:N+1, 'YMinorTick','on')


title('semantic map', 'FontSize', 22)
box on
end

