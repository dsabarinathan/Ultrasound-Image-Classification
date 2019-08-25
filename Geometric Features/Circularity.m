
function value = Circularity(BW)

properties = regionprops(BW,{'FilledArea','Perimeter'});

value = [properties.Perimeter] .^2 ./ (4 * pi * [properties.FilledArea]);

end