% do not print
a = 10;

% matrices
[1 2 3; 2 3 3]

1:5
1:2:10

M=[1 2 3; 1,2,3; 3,2,1]

M(1:2:3, 1) = 0
M(1:2, 2:3) = -1

% clear out all shit
clear all;
close all;
clc;


% plot
xAxis = [0:0.1:2*pi]
yAxis = sin(xAxis)
plot(xAxis, yAxis)


% scatter
scatter(rand(100,1),rand(100, 1))
xlabel('dunno')
ylabel('y dunno')
title('TITLE')

