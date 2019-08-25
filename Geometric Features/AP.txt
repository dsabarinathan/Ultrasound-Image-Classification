function value =AP(BW)

%%%  paper  refernce %%%
%%% A Segmentation Method and Comparison of Classification Methods for Thyroid Ultrasound Images
 %%%


properties = regionprops(BW,{'Area','Perimeter'});
value= properties.Area/properties.Perimeter;

end










