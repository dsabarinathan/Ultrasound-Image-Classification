function value = Area(BW)

%%%  paper  refernce %%%
%%% A Segmentation Method and Comparison of Classification Methods for Thyroid Ultrasound Images
 %%%


properties = regionprops(BW,{'Area'});
value= properties.Area ;

end










