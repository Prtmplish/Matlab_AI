clc
clear all
close all
%Triangular Membership Function
x=(0:1:10)';
y1=trimf(x, [2 5 9]);
subplot(3,1,2)
plot(x,[y1]);
xlabel('x axis')
ylabel('membership of x')
title('Triangular membership function')
%Trapezoidal Membership Function
x=(0:1:10)';
y1=trapmf(x, [1 3 5 7]);
subplot(3,1,1)
plot(x,[y1]);
xlabel('x axis')
ylabel('membership of x')
title('Trapezoidal membership function')
%Bell-Shaped Membership Function
x=(0:0.2:10)';
y1=gbellmf(x, [1 2 5]);
subplot(3,1,3)
plot(x,[y1]);
xlabel('x axis')
ylabel('membership of x')
title('Bell-Shaped membership function')