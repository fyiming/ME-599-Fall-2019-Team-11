clc;clear;    
proj=[1.1274   -0.0000    0.9565    ;
   -0.0000    1.1269    0.5255    ;
   -0.0000    0.0000    0.0010        ] * 1000 ;
% load('labels');
% load('testingimage.mat');
% bbox = gTruth.LabelData;
% bbox = table2cell(bbox);
load('result_resnet50');
load('testingimage.mat');
bbox = table2array(results);
bbox = bbox(:,1);
Store = [];
r_store = [];
theta_store = [];
%%
for i = 1:1:800
    i/800
 temp = bbox{i};
 xyz = read_bin(strrep(folder_names{i}, '_image.jpg', '_cloud.bin'));
 xyz = reshape(xyz, [], 3)';
 clr = vecnorm(xyz);
 if size(temp,1)>0 
    uv = [(temp(1)+temp(3)/2)/224*1914; (temp(2)+temp(4)/2)/224*1052; 1];
 car_pt = uv; %replace with the center point of the detected center
 %coordinate needs to be scaled back from 224*224->to 1914*1052
 % should look like this uv = [800, 300, 1] (attach this 1 at the end)
world_pt1= inv(proj(1:3,1:3))*car_pt*3;
world_pt2= inv(proj(1:3,1:3))*car_pt*2;

d_arr=[];
%xyz is the point clound corresponding to the image you are looking at
for xyzidx = 1: size(xyz,2)
    xyz_iter = xyz(:,xyzidx);
    d = point_to_line (xyz_iter,world_pt1,world_pt2);
    d_arr = [d_arr d];
end

[dist, didx] = min(d_arr);
xyz(:,didx); % this is the point we are interested in
r = vecnorm(xyz(:,didx));
theta = atan(xyz(1,didx)/xyz(3,didx))*57.2958; %covert to degrees
r_store = [r_store;r];
theta_store = [theta_store;theta];
 else
    r = sum(r_store)/size(r_store,1);
    theta = sum(theta_store)/size(theta_store,1);
 end
Store = [Store;r;theta];
end
save("Task2_result_V2",'Store');
function data = read_bin(file_name)
id = fopen(file_name, 'r');
data = fread(id, inf, 'single');
fclose(id);
end


function d=point_to_line(pt, v1, v2)
a = v1- v2;
b = pt - v2;
d = norm(cross(a,b))/norm(a);
end