function [ output_args ] = animate_citizenship_formation(crsom)
    snaps = crsom.userdata.context_snaps;
    context_net = crsom.userdata.context_net;
    
     crsom.userdata.context_net = context_net;
%       subplot(1,3, 1);
      crsom.userdata.context_net.IW{1} = zeros(size(crsom.userdata.context_net.IW{1}))
    plot_citizenship( crsom );

   title('after 0 epochs', 'FontSize', 18);
%     crsom.userdata.snapped_epochs(1)=1
%     snaps = [snaps(1:4) snaps(6:8)]
   
    snapped_net = context_net;
     crsom.userdata.context_net = snaps(2);
      plot_citizenship( crsom )
       title(sprintf('after %d epochs',  crsom.userdata.snapped_epochs(2)), 'FontSize', 18);
%    for i=1:length(snaps)
%        subplot(3,3,i+1);
%        
%        snapped_net = context_net;
%        crsom.userdata.context_net = snaps(i);
%        plot_citizenship( crsom )
%        
%        
%       title(sprintf('after %d epochs',  crsom.userdata.snapped_epochs(i)))
%    end
   
   crsom.userdata.context_net = context_net;
%    subplot(1,3,3);
   plot_citizenship( crsom );
   title('after 500 epochs', 'FontSize', 22);
%    crsom.userdata.context_net = context_net;
%    subplot(3,3,length(snaps) + 1);
%    plot_citizenship( crsom );
end
