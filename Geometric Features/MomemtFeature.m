function [AOH,PhiOH]= MomemtFeature(BW)


n = 4; m = 2;           % Define the order and the repetition of the moment

[~, AOH, PhiOH] = Zernikmoment(BW,n,m);      % Call Zernikemoment fuction

end