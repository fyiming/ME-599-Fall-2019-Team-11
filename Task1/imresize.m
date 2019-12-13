function I = imresize(filename)
I = imread(filename);
I = imresize(I, [224,224]);
end