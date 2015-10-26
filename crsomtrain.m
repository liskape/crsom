function [som, cn, E] = crsomtrain(inputs, targets)
    
% % % % % % REMOVE
 inputs = inputs(:,1:2);
 targets = targets(:,1:2);
% % % % REMOVE    
    
   som = selforgmap([10 10],10, 3, 'gridtop', 'dist');
   som = configure(som, inputs);
   
   
    E = [];
    T_END = 200;
    cn = context_net(ones(100,1), targets);
    
    [a,b] = size(inputs);
    
    for t = 1:T_END
        t
        for i = 1:b
            [som, cn, e] = crsom_adapt(som, cn,inputs(:,i), targets(:,i),t, T_END);
            E = [E e];
        end
    end
    
    % TODO: EXTRACT
    % scatter output
    % scatter(row_idx(1:100, 10), col_inx(1:100, 10),  hl_output*5000, 'filled')
   
    % scatter input (distance)
    % scatter(row_idx(1:100, 10), col_inx(1:100, 10),  I*10, 'filled')
     
    % scatter neigh function
    % scatter(row_idx(1:100, 10), col_inx(1:100, 10),  neigh*400, 'filled')
     
   
    % scatter first part of expr (similiarity)
    % scatter(row_idx(1:100, 10), col_inx(1:100, 10),  s*5000, 'filled')
    
end
