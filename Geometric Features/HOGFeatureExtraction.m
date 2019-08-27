function hog_2x2 = HOGFeatureExtraction(BW)

%% Hog Feature Extraction %%

resizedImg = imresize(BW,[32,64]);
edge0=edge(resizedImg,'sobel');

hog_2x2 = extractHOGFeatures(edge0,'CellSize',[2 2]);


end