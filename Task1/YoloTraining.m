clc;
clear;
data_table = load('Training_table_resized.mat');
data_table=data_table.T;
% Define the image input size.
imageSize = [224 224 3];
% Define the number of object classes to detect.
numClasses = width(data_table)-1;
anchorBoxes = [
    20 16
    40 32
    43 59
    18 22
    23 29
    84 109
    80 64
    160 120
    10 10
];
baseNetwork = resnet50;
% Specify the feature extraction layer.
featureLayer = 'activation_40_relu';

% Create the YOLO v2 object detection network. 
lgraph = yolov2Layers(imageSize,numClasses,anchorBoxes,baseNetwork,featureLayer);

options = trainingOptions('sgdm', ...
        'MiniBatchSize', 40, ....
        'InitialLearnRate',1e-3, ...
        'MaxEpochs',6,...
        'CheckpointPath', tempdir, ...
        'Shuffle','every-epoch','ExecutionEnvironment','gpu');    
% Train YOLO v2 detector.
[detector,info] = trainYOLOv2ObjectDetector(data_table,lgraph,options);