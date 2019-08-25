function value = Eccentricity(BW)

%%%  paper  refernce %%%
%%% Computer aided diagnosis for thyroid cancer system based on internal
%%% and external characteristics %%%


properties = regionprops(BW,{'MajorAxisLength','Area'});
value= properties.Minor Axis Length / properties.Major Axis Length ;

end










