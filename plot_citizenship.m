function [ output_args ] = plot_citizenship( crsom )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
N = crsom.layers{1}.dimensions(1);
weights = crsom.userdata.context_net.IW{1}

to_plot_rows = [];
to_plot_cols = [];
sizes = [];
colors = []; 

for i=1:length(weights)
    
    citizenship = weights(:,i);

   to_plot_rows = [to_plot_rows row_idx(i, N)]; 
   to_plot_cols = [to_plot_cols col_inx(i, N)]; 
   sizes = [sizes max(citizenship) * 250];
   colors = [colors; paintit2(find(citizenship==max(citizenship)))];

end

s = scatter(to_plot_cols, to_plot_rows, sizes, colors, 'filled');


grid on
grid minor
axis([0,N+1,0,N+1])
xlabel('x-coordinate of neuron')
ylabel('y-coordinate of neuron')
% legend('class A', 'class B')
% set(gca,'Color',[0.8 0.8 0.8]);

if isfield(crsom.userdata, 'net_name')
    title(crsom.userdata.net_name)
end

end

