function [value1,value2,value3,value4] = BoundingBoxCords(BW)

%%%  paper  refernce %%%
%%% A Segmentation Method and Comparison of Classification Methods for Thyroid Ultrasound Images
 %%%


properties = regionprops(BW,{'BoundingBox'});
x1 = properties.BoundingBox(1); 
y1 = properties.BoundingBox(2); 
x2 = properties.BoundingBox(2); 
y2 = properties.BoundingBox(2); 
x3 = properties.BoundingBox(3); 
y3 = properties.BoundingBox(4); 
x4 = properties.BoundingBox(4); 
y4 = properties.BoundingBox(4);) 
d1 = sqrt((x1-x2)^2*(y1-y2)^2); 
d2 = sqrt((x3-x4)^2*(y3-y4)^2) ;
d3 = sqrt((x4-x2)^2*(y4-y2)^2); 
d4 = sqrt((x1-x3)^2*(y1-y3)^2);

value1 = d1;
value2 = d2;
value3 = d3;
value4 = d4;



end










