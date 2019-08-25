function value = Extent(BW)

%%%  paper  refernce %%%
%%% A Segmentation Method and Comparison of Classification Methods for Thyroid Ultrasound Images
 %%%


properties = regionprops(BW,{'Area','Perimeter','Extent'});
value= properties.Extent;


end










