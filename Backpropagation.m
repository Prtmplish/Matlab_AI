clear all;
close all;
clc;

input=xlsread('fv.xlsx');
target=xlsread('target.xlsx');
nntic=tic;
hiddenLayerSize = 10;
net = feedforwardnet(hiddenLayerSize,'traingd');
net.trainParam.lr = 0.05; %its not mandatory to give this value, automatic value will be taken
net.trainParam.epochs = 3000; %its not mandatory to give this value, automatic value will be taken
net.trainParam.goal = 1e-5; %its not mandatory to give this value, automatic value will be taken
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;
net=init(net);
[net,tr] = train(net,input,target); %training
output = sim(net,input); %simulation
figure, plotconfusion(target,output)
figure, plotregression(target,output); %regresson plot
error = gsubtract(target,output);
performance = mse(error); %mean square error
figure, plotroc(target,output)
nntime=toc(nntic);

unknown=xlsread('unknown.xlsx');%let it is the unknown feature value
y = net(unknown);%results obtained for all classes

% initlay is a network initialization function that initializes each layer i according to 
% its own initialization function net.layers{i}.initFcn.
% The weights and biases of each layer i are initialized according to net.layers{i}.initFcn.