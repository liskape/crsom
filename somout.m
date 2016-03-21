function [ a ] = somout( n, varargin )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

if ischar(n)
%   a = nnet7.transfer_fcn(mfilename,n,varargin{:});
    a = compet(n);
    return;
end

end

