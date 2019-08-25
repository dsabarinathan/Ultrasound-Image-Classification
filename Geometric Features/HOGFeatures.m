 resizedImg=imresize(BW,.25);
    edge0=edge(resizedImg,'sobel');
    [hog_2x2, vis2x2] = extractHOGFeatures(edge0,'CellSize',[2 2]);










