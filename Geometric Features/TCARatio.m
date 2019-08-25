function value = TCARatio(BW)


properties = regionprops(BW,{'Area','ConvexArea'});

value= [properties.Area]/[properties.ConvexArea];

end
