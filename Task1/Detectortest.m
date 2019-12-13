D = load('testingimage.mat'); %% Load the Test.mat file created by running T19TestImagesLoad.m dile
count = 0;
numImages = numel(folder_names);
results = table('Size',[numImages 3],...
        'VariableTypes',{'cell','cell','cell'},...
        'VariableNames',{'Boxes','Scores','Labels'});

for i = 1:numImages
    i/numImages
    s = char(folder_names{i});
    I = imread(s);
    I = imresize(I, [224,224]);
    [bboxes, scores, labels] = detect(detector, I);
    if length(scores) > 1
        idx = find(max(scores));
        scores = scores(idx);
        bboxes = bboxes(idx,:);
    end
%     if scores < 0.8
%         bboxes = [];
%     end
    results.Boxes{i} = bboxes;
    results.Scores{i} = scores;
    results.Labels{i} = labels;
    TF = isempty(bboxes);
    if ~TF
        I = insertObjectAnnotation(I,'rectangle',bboxes,scores);
        imshow(I)
        count = count+1;
    end
end


% 
% I= imread('E:\ROB535\Final Project\rob535-fall-2019-task-1-image-classification\data-2019\resize_image\0aede570-5574-4c56-8450-5a796a2b9f0c/0001_image.jpg');
% I = imresize(I, [224,224]);
% imshow(I)
% 
% [bboxes, scores, labels] = detect(detector, I);
% I = insertObjectAnnotation(I,'rectangle',bboxes,scores);
% figure
% imshow(I)