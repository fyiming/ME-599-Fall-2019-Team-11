% srcFiles = dir('./trainval/*/*_image.jpg');
%  n=length(srcFiles)
% for i = 1 : length(srcFiles)
%     i/n
% srcFiles = dir('E:\ROB535\Final Project\rob535-fall-2019-task-1-image-classification\data-2019\test\2b0b4d7d-2d10-46c6-b81d-6a7ec08ad6a9\0000_image.jpg');
% filename = strcat(srcFiles(1).folder,"\",srcFiles(1).name);
% folder_names = split(srcFiles(i).folder,"\");
% folder_names = folder_names(end);
% im = imread(filename);
% croppedImage = imcrop(im, [1118,331,423,160]);
% imshow(croppedImage);
% k=imresize(croppedImage,[224,224]);
% folder_names =strcat('E:\ROB535\Final Project\rob535-fall-2019-task-1-image-classification\data-2019\cropped_image\',folder_names(1));
% if ~exist(folder_names{1}, 'dir')
%        mkdir(folder_names{1})
% end
% newfilename=fullfile(folder_names{1},srcFiles(i).name);
% imwrite(k,newfilename);
% % end
files = dir('./test/*/*_image.jpg');
load('VGGYOLOResult.mat');

for i = 1:1:length(files)
    i/length(files)
    groundtruth = results.Boxes(i);
    if size(cell2mat(groundtruth),1) > 1
        temp = cell2mat(groundtruth);
        groundtruth = temp(1,:);
    elseif size(cell2mat(groundtruth),1) ==0
        groundtruth = [0 0 224 224];
    else
        groundtruth = cell2mat(groundtruth);
%     elseif size(cell2mat(groundtruth),1)
    end
%     snapshot = [files(i).folder, '/', files(i).name];
%     imshow(snapshot)
    cropimg(files,i,groundtruth);
end

function [] = cropimg(srcFiles,i,groundtruth)
filename = strcat(srcFiles(i).folder,"\",srcFiles(i).name);
folder_names = split(srcFiles(i).folder,"\");
folder_names = folder_names(end);
im = imread(filename);
im = imresize(im, [224,224]);
croppedImage = imcrop(im, groundtruth);
% k=imresize(croppedImage,[224,224]);
imshow(croppedImage);
folder_names =strcat('E:\ROB535\Final Project\rob535-fall-2019-task-1-image-classification\data-2019\cropped_test_image_VGGYOLO\',folder_names(1));
if ~exist(folder_names{1}, 'dir')
       mkdir(folder_names{1});
end
newfilename=fullfile(folder_names{1},srcFiles(i).name);
imwrite(croppedImage,newfilename);
end
