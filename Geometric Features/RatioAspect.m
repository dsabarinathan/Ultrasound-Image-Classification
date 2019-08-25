function value = RatioAspect(BW)

%%%  paper  refernce %%%
%%% Computer aided diagnosis for thyroid cancer system based on internal
%%% and external characteristics %%%

properties = regionprops(BW,'BoundingBox');

BoundingBox = properties.BoundingBox;

value =BoundingBox(3)/BoundingBox(4);

end