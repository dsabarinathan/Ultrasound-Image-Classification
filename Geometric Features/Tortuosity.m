function value = Tortuosity(BW)


%%%  paper  refernce %%%
%%% Computer aided diagnosis for thyroid cancer system based on internal
%%% and external characteristics %%%

properties = regionprops(BW,{'MajorAxisLength','Perimeter'});

value= ([properties.MajorAxisLength]*2)/[properties.Perimeter];

end