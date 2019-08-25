function value = Convexity(BW)


properties = regionprops(BW,'Perimeter');
convexHull = bwconvhull(BW);

%   Calculate the perimeter of the convex hull
ConvexHullPerimeter = regionprops(convexHull, 'Perimeter');

value =[ConvexHullPerimeter.Perimeter]/[properties.Perimeter];

end