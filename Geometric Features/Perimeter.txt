function value = perimeter(BW)

%%%  paper  refernce %%%
%%% A Segmentation Method and Comparison of Classification Methods for Thyroid Ultrasound Images
 %%%


properties = regionprops(BW,{'Perimeter'});
value= properties.Perimeter ;

end










