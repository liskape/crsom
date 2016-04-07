function [ output_args ] = animate_citizenship_formation(crsom)
    snaps = crsom.userdata.context_snaps;
    context_net = crsom.userdata.context_net;
    
    
   for i=1:length(snaps)
       subplot(3,3,i);
       
       snapped_net = context_net;
       crsom.userdata.context_net = snaps(i);
       plot_citizenship( crsom )
   end
   
   crsom.userdata.context_net = context_net;
   subplot(3,3,length(snaps) + 1);
   plot_citizenship( crsom );
end
