clc;
clear;
% function [data,testDataset] = loadingtrainingImg()
all = [];
%%
files = dir('E:\ROB535\Final Project\rob535-fall-2019-task-1-image-classification\data-2019\trainval/*/*_image.jpg'); %%Change the directory to the location of the training images.
files2 = dir('./trainval/*/*_image.jpg');
% First row
snapshot2 = [files2(1).folder, '/', files2(1).name];
snapshot = [files(1).folder, '/', files(1).name];

for i = 1:numel(files2)
i/numel(files2)
snapshot2 = [files2(i).folder, '/', files2(i).name];
snapshot = [files(i).folder, '/', files(i).name];

try
    bbox = read_bin(strrep(snapshot2, '_image.jpg', '_bbox.bin'));
catch
    disp('[*] no bbox found.')
    bbox = single([]);
end
bbox = reshape(bbox, 11, [])';
idx = find(bbox(:,11) ==0);
num = length(idx);
A = imread(snapshot);
A = imresize(A,[224 224]);
if num == 1
    case_num = bbox(idx,10);
    all = [all;case_num];
    
    switch case_num
        case 0
            filename = char(strcat('E:/ROB535/Final Project/rob535-fall-2019-task-1-image-classification/data-2019/store/0/',string(i),'.jpg'));
            imwrite(A,filename);
        case 1
            filename = char(strcat('E:/ROB535/Final Project/rob535-fall-2019-task-1-image-classification/data-2019/store/1/',string(i),'.jpg'));
            if bbox(idx,6) < 20 && abs(bbox(idx,4)) < 20
                imwrite(A,filename);
            end
        case 2
            filename = char(strcat('E:/ROB535/Final Project/rob535-fall-2019-task-1-image-classification/data-2019/store/1/',string(i),'.jpg'));
            if bbox(idx,6) < 20 && abs(bbox(idx,4)) < 20
                imwrite(A,filename);
            end
        case 3
            filename = char(strcat('E:/ROB535/Final Project/rob535-fall-2019-task-1-image-classification/data-2019/store/1/',string(i),'.jpg'));
            if bbox(idx,6) < 20 && abs(bbox(idx,4)) < 20
                imwrite(A,filename);
            end
        case 4
            filename = char(strcat('E:/ROB535/Final Project/rob535-fall-2019-task-1-image-classification/data-2019/store/1/',string(i),'.jpg'));
            if bbox(idx,6) < 20 && abs(bbox(idx,4)) < 20
                imwrite(A,filename);
            end
        case 5
            filename = char(strcat('E:/ROB535/Final Project/rob535-fall-2019-task-1-image-classification/data-2019/store/1/',string(i),'.jpg'));
            if bbox(idx,6) < 20 && abs(bbox(idx,4)) < 20
                imwrite(A,filename);
            end
        case 6
            filename = char(strcat('E:/ROB535/Final Project/rob535-fall-2019-task-1-image-classification/data-2019/store/1/',string(i),'.jpg'));
            if bbox(idx,6) < 20 && abs(bbox(idx,4)) < 20
                imwrite(A,filename);
            end
        case 7
            filename = char(strcat('E:/ROB535/Final Project/rob535-fall-2019-task-1-image-classification/data-2019/store/1/',string(i),'.jpg'));
            if bbox(idx,6) < 20 && abs(bbox(idx,4)) < 20
                imwrite(A,filename);
            end
        case 8
            filename = char(strcat('E:/ROB535/Final Project/rob535-fall-2019-task-1-image-classification/data-2019/store/1/',string(i),'.jpg'));
            if bbox(idx,6) < 20 && abs(bbox(idx,4)) < 20
                imwrite(A,filename);
            end
        case 9
            filename = char(strcat('E:/ROB535/Final Project/rob535-fall-2019-task-1-image-classification/data-2019/store/3/',string(i),'.jpg'));
            imwrite(A,filename);
        case 10
            filename = char(strcat('E:/ROB535/Final Project/rob535-fall-2019-task-1-image-classification/data-2019/store/3/',string(i),'.jpg'));
            imwrite(A,filename);
        case 11
            filename = char(strcat('E:/ROB535/Final Project/rob535-fall-2019-task-1-image-classification/data-2019/store/2/',string(i),'.jpg'));
            imwrite(A,filename);
        case 12
            filename = char(strcat('E:/ROB535/Final Project/rob535-fall-2019-task-1-image-classification/data-2019/store/2/',string(i),'.jpg'));
            imwrite(A,filename);
        case 13
            filename = char(strcat('E:/ROB535/Final Project/rob535-fall-2019-task-1-image-classification/data-2019/store/2/',string(i),'.jpg'));
            imwrite(A,filename);
        case 14
            filename = char(strcat('E:/ROB535/Final Project/rob535-fall-2019-task-1-image-classification/data-2019/store/3/',string(i),'.jpg'));
            imwrite(A,filename);
        case 15
            filename = char(strcat('E:/ROB535/Final Project/rob535-fall-2019-task-1-image-classification/data-2019/store/0/',string(i),'.jpg'));
            imwrite(A,filename);
        case 16
            filename = char(strcat('E:/ROB535/Final Project/rob535-fall-2019-task-1-image-classification/data-2019/store/0/',string(i),'.jpg'));
            imwrite(A,filename);
        case 17
            filename = char(strcat('E:/ROB535/Final Project/rob535-fall-2019-task-1-image-classification/data-2019/store/0/',string(i),'.jpg'));
            imwrite(A,filename);
        case 18
            filename = char(strcat('E:/ROB535/Final Project/rob535-fall-2019-task-1-image-classification/data-2019/store/2/',string(i),'.jpg'));
            imwrite(A,filename);
        case 19
            filename = char(strcat('E:/ROB535/Final Project/rob535-fall-2019-task-1-image-classification/data-2019/store/2/',string(i),'.jpg'));
            imwrite(A,filename);
        case 20
            filename = char(strcat('E:/ROB535/Final Project/rob535-fall-2019-task-1-image-classification/data-2019/store/2/',string(i),'.jpg'));
            imwrite(A,filename);
        case 21
            filename = char(strcat('E:/ROB535/Final Project/rob535-fall-2019-task-1-image-classification/data-2019/store/2/',string(i),'.jpg'));
            imwrite(A,filename);
        case 22
            filename = char(strcat('E:/ROB535/Final Project/rob535-fall-2019-task-1-image-classification/data-2019/store/0/',string(i),'.jpg'));
            imwrite(A,filename);
    end
else
    filename = char(strcat('E:/ROB535/Final Project/rob535-fall-2019-task-1-image-classification/data-2019/store/0/',string(i),'.jpg'));
    imwrite(A,filename);
end
end




%%
function data = read_bin(file_name)
id = fopen(file_name, 'r');
data = fread(id, inf, 'single');
fclose(id);
end
