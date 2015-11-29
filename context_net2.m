function [ cn ] = context_net2( input, target ) 
   cn = network(1,1,1,1,0,1) ;
   cn.layers{1}.transferFcn = 'logsig';
   cn.layers{1}.initFcn = 'initnw';
   
   % Training
%   cn.dividefcn = 'dividerand';
%   cn.trainFcn = 'trainlm';
  
   cn.performFcn = 'mse';
   cn.adaptFcn = 'adaptwb';
   cn.inputWeights{1,1}.learnFcn = 'learngd';
   cn.layerWeights{find(cn.layerConnect)'}.learnFcn = 'learngd';
   cn.biases{:}.learnFcn = 'learngd';
   cn = configure(cn, input, target);
end

