function Value =  RatioHeightWidth(BW)



%%%  paper  refernce %%%
%%% Computer aided diagnosis for thyroid cancer system based on internal
%%% and external characteristics %%%

%% Ratio height-width %%

properties = regionprops(BW,{'BoundingBox','Area'});

Value = properties(1).Area/(BoundingBox(3)*BoundingBox(4));

end