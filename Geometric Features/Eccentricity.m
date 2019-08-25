function value = Eccentricity(BW)

%%%  paper  refernce %%%
%%% Computer aided diagnosis for thyroid cancer system based on internal
%%% and external characteristics %%%


properties = regionprops(BW,{'MajorAxisLength','Minor Axis Length'});
value= properties.Minor Axis Length / properties.Major Axis Length ;

end










