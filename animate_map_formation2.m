function [ output_args ] = animate_map_formation2( crsom, in, ta)
    snaps = length(crsom.userdata.history_snaps);

   for i=1:2
%        subplot(3,3,i);
       [crosses_cols, crosses_rows] = plot_crsom_crosses(crsom, in, ta)
            title('CRSOM map')
             hold on
            %  scatter(0,0,0, R, 'filled' ); %RED
            scatter(0,0,0.001, G, 'filled' ); %BLUE
            scatter(0,0,0.001, B, 'filled'); %GREEN
            hold on
            scatter(crosses_cols, crosses_rows, 100, [0 0 0], 'x', 'LineWidth', 2);
       e = crsom.userdata.snapped_epochs(i)
       title(sprintf('after %d epochs',e), 'FontSize', 20);
       if i == 1
%            set(gca,'XTick',0:22, 'XMinorTick','on')
%             set(gca,'YTick',0:22, 'YMinorTick','on')
            xlabel('x-coordinate of neuron', 'FontSize', 20);
            ylabel('y-coordinate of neuron', 'FontSize', 20);
            legend('Katy Perry', 'Ramones')
       end
        hold off
   end
   
   hold off
%    subplot(3,3,snaps + 1);
   my_plot_som_no_confl(crsom, in, ta);
   title(sprintf('after %d epochs',500), 'FontSize', 20);
end

