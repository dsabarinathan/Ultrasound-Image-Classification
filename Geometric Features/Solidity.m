function value = Solidity(BW)


%%%  paper  refernce %%%
%%% Computer aided diagnosis for thyroid cancer system based on internal
%%% and external characteristics %%%

properties = regionprops(BW,{'ConvexArea','Area'});

value = properties.Area/properties.ConvexArea;


end
