function value = Tortuosity(BW)

%%%  paper  refernce %%%
%%% Computer aided diagnosis for thyroid cancer system based on internal
%%% and external characteristics %%%


properties = regionprops(BW,{'MajorAxisLength','Area'});
value= 2 *(properties.MajorAxisLength) / properties.Area;

end










