function value = FormFactor(BW)

%% Form Factor %%
properties = regionprops(BW,{'Area','Perimeter'});

value = (4 * pi *[properties.Area])/([properties.Perimeter]*[properties.Perimeter]);

end


