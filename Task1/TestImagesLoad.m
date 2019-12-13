%% Loading the testing Data

files1 = dir('E:\ROB535\Final Project\rob535-fall-2019-task-1-image-classification\data-2019\test/*/*_image.jpg'); 

testdataset = [files1(1).folder, '/', files1(1).name];
name = split(testdataset,'\');
name = name(7);
s1 = {char(testdataset)};
testDataset = table(s1);
for j = 2:numel(files1)
    testdataset = [files1(j).folder, '/', files1(j).name];
    name = split(testdataset,'\');
    name = name(7);
    s1 = {char(testdataset)};
    testDataset = [testDataset; table(s1)];
end

save('Test_normal.mat','testDataset');