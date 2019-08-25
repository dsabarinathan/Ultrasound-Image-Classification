function value = diameters(BW)

%%%  paper  refernce %%%
%%% A Segmentation Method and Comparison of Classification Methods for Thyroid Ultrasound Images
 %%%

properties = regionprops(BW, {'Area','Centroid','BoundingBox' ,'ConvexArea', 'Eccentricity', 'EquivDiameter', 'EulerNumber', 'Extent', 'FilledArea', 'MajorAxisLength', 'MinorAxisLength', 'Orientation', 'Perimeter', 'Solidity'});
 diameters = mean([properties.MajorAxisLength properties.MinorAxisLength],2);
   
value= diameters


end










