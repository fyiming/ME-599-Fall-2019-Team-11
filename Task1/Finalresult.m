%% Testing the Neural net

D = load('Test_cropped_VGGYOLO.mat'); 
% load('trained_finalstruggle.mat');
testDataset = D.testDataset;

for i = 1:height(testDataset)
    s = char(testDataset.s1(i));
    I = imread(s);
    [y1,x1,z1] = size(I);
    if y1>220 || x1>220
        testDataset.label(i) = '0';
    elseif y1<32 || x1<32
        testDataset.label(i) = '1';
    else
        testDataset.label(i) = '1';
        I = imresize(I, [224,224]);
        testDataset.label(i) = char(classify(myNet,I,'MiniBatchSize', 54));
    end

end
save('Test.mat','testDataset'); 