function value = Convexity(BW)

%%%  paper  refernce %%%
%%% Computer aided diagnosis for thyroid cancer system based on internal
%%% and external characteristics %%%


properties = regionprops(BW,'Perimeter');
convexHull = bwconvhull(BW);

%   Calculate the perimeter of the convex hull
ConvexHullPerimeter = regionprops(convexHull, 'Perimeter');

value =[ConvexHullPerimeter.Perimeter]/[properties.Perimeter];

end