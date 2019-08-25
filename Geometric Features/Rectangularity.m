function value = Rectangularity(BW)


%%%  paper  refernce %%%
%%% Computer aided diagnosis for thyroid cancer system based on internal
%%% and external characteristics %%%

properties = regionprops(BW,{'ConvexArea','Area','BoundingBox'});

BoundingBox = properties.BoundingBox;

value =properties(1).ConvexArea/(BoundingBox(3)*BoundingBox(4));

end
