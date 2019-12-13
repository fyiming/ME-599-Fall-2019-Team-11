%%Following code has been verified to work in MatLab R2018a using Deep Learning Toolbox and Deep Learning Toolbox model for VGG-19 Network
clc;clear;
%% Get the training images 
allImages = imageDatastore('E:\ROB535\Final Project\rob535-fall-2019-task-1-image-classification\data-2019\store', 'IncludeSubfolders', true,...
    'LabelSource', 'foldernames');
%%change 'all/deploy/Image' to the path of your training images. 
%%The images have to be clasified to subfolders where the folder name is the label of each class


[trainingImages, ~] = splitEachLabel(allImages, 0.9, 'randomize');

%% Load pretrained Net
net = vgg19; 
layers = net.Layers; 

%% Make some changes to classifier
layers(1) = imageInputLayer([224,224, 3],'Name','input');
layers(39) = fullyConnectedLayer(4096,'Name','fc1'); 
layers(40) = reluLayer('Name','relu_10');
layers(41) = dropoutLayer(0.5,'Name','drop3');
layers(42) = fullyConnectedLayer(64,'Name','fc4'); 
layers(43) = reluLayer('Name','relu_11');
layers(44) = dropoutLayer(0.5,'Name','drop4');
layers(45) = fullyConnectedLayer(3,'Name','fc_last');
layers(46) = softmaxLayer('Name','softmax');
layers(47) = classificationLayer('Name','classification'); 

%% Set the training options
opts = trainingOptions('sgdm', 'InitialLearnRate', 0.001,...
    'MaxEpochs', 10,'Verbose',false, ...
    'Plots','training-progress','MiniBatchSize', 54,'ExecutionEnvironment','gpu','Shuffle','every-epoch');

%% Use the custom function to resize input images for training 
trainingImages.ReadFcn = @imresize;

%% Train the net
myNet = trainNetwork(trainingImages, layers, opts);