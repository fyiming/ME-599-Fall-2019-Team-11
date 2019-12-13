D = load('Test.mat');
testDataset = D.testDataset;

for i = 1:height(testDataset)
    testdataset = char(testDataset.s1(i));
    name = split(testdataset,'\');
    name = name(7);
    name = split(name,'_');
    name = name(1);
    
    rename = {char(name)};
    testDataset.s1(i) = rename;
end

% save('Formated_Test.mat','testDataset');
%%
writetable(testDataset,'try15.csv')