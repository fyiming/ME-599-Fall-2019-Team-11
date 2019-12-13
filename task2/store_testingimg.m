load('testingimage.mat');
for i = 1:1:800
im = imread(folder_names{i});
imshow(im);
h = folder_names{i};
m = split(h,'\');
m2 = split(h,'/');
if i < 10
    temp = strcat('000',int2str(i),'.jpg');
elseif i<100
    temp = strcat('00',int2str(i),'.jpg');
else
    temp = strcat('0',int2str(i),'.jpg');
end
imwrite(im,temp);
end