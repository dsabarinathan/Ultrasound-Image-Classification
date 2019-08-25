function value = Centroid(BW)

%%%  paper  refernce %%%
%%% ShapeDescriptor/Feature Extraction Techniques
 %%%


properties = regionprops(BW,{'Area','Perimeter','Centroid'});
value1= properties.Centroid(1);
value2= properties.Centroid(2);

end










