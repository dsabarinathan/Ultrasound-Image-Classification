function value =MajorAxislength (BW)

%%%  paper  refernce %%%
%%% A Segmentation Method and Comparison of Classification Methods for Thyroid Ultrasound Images
 %%%


properties = regionprops(BW,{'MajorAxislength'});
value= properties.MajorAxislength;

end










