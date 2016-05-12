function [ output_args ] = plot_crsom_summary3( crsom, us, uc, inputs, targets )

     figure(1);
     plot_crsom_crosses(us, inputs, targets);
     title('SOM map');
     
     figure(2);
     plot_crsom_crosses(crsom, inputs, targets);  
     title('CRSOM map')
 

end

