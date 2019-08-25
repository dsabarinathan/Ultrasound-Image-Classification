function value = MinorAxisLength (BW)

%%%  paper  refernce %%%
%%% A Segmentation Method and Comparison of Classification Methods for Thyroid Ultrasound Images
 %%%


properties = regionprops(BW,{'MinorAxisLength'});
value= properties.MinorAxisLength;

end






