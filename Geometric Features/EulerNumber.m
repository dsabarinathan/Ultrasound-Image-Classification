function value =EulerNumber(BW)

%%%  paper  refernce %%%
%%% ShapeDescriptor/Feature Extraction Techniques
Fred Park
UCI iCAMP2011


properties = regionprops(BW,{'EulerNumber'});
value= properties.EulerNumber;

end










