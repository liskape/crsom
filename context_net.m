function [ cn ] = context_net( input, target ) 
   cn = network(1,1,1,1,0,1) ;
   cn.layers{1}.transferFcn = 'tansig';
   cn.layers{1}.initFcn = 'initnw';
   
   % Training
%   cn.dividefcn = 'dividerand';
%   cn.trainFcn = 'trainlm';
%   cn.performFcn = 'mse';

%   % Adaption
% %   cn.adaptFcn = 'adaptwb';
% %   cn.inputWeights{1,1}.learnFcn = 'learngdm';
% %   cn.layerWeights{find(cn.layerConnect)'}.learnFcn = 'learngdm';
% %   cn.biases{:}.learnFcn = 'learngdm';
  
  cn = configure(cn, input, target);
  [a,b] = size(cn.IW{1});
  cn.IW{1}  = cn.IW{1}+rand(a,b);
  cn.b{1} = cn.b{1} + rand(1, a)';
end

