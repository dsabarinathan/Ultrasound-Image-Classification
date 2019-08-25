function value = Eccentricity(BW)

%%%  paper  refernce %%%
%%% A Segmentation Method and Comparison of Classification Methods for Thyroid Ultrasound Images %%%


properties = regionprops(BW,{'MajorAxisLength','MinorAxisLength'});
value= properties.MinorAxisLength / properties.MajorAxisLength ;

end










