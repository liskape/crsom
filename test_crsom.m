function [ expected_classes, actual_classes, winners ] = test_crsom( crsom, neurons, test_in, test_ta, ids, test_ids, in, ta, class )
[a,b, neurons] = plot_crsom_crosses(crsom, in, ta);
hold on;
N = crsom.layers{1}.dimensions(1);
expected_classes = [];
actual_classes = [];
winners = [];

missed_targets = []
winners = [];
misses = 0;
hits = 0;
blank = 0;

  for i=1:length(test_ta)
      cur_in = test_in(:,i);
      cur_ta = vec2ind(test_ta(:,i));
%       if class == ta
          winner = find(crsom(cur_in));
      
         expected = neurons(winner); 
      
         expected_classes = [expected_classes expected];
         actual_classes = [actual_classes cur_ta];
         winners = [winners winner];
         
         
        if expected == 0
            blank = blank + 1;
        elseif expected ~= cur_ta

            misses = misses + 1;
        else

           hits = hits + 1;
        end
        
%         'on map'
%          data_for_neuron( crsom, in, ta, ids, row_idx(winner, N), col_inx(winner, N))
         
%          'tested song'
%          test_ids(i)
         
        scatter(col_inx(winner, N), row_idx(winner, N), 50, paintit2(cur_ta), 'o','filled', 'MarkerEdgeColor', [0 0 0], 'LineWidth', 1.5);
        
        sprintf('%d - %d - %d', misses, hits, blank)
%       end
  end

