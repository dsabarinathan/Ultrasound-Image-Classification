function value = Compactness(BW)

%%%  paper  refernce %%%
%%% Computer aided diagnosis for thyroid cancer system based on internal
%%% and external characteristics %%%


properties = regionprops(BW,{'Perimeter','Area'});

value = 1 - ((4 * pi *[properties.Area])/([properties.Perimeter]*[properties.Perimeter]));

end