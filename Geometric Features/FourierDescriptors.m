function FD = FourierDescriptors(bw,m,n)
%GFD is a function to calculate the generic fourier descriptors of an
%object in an binary image
% FD = GFD(BW,M,N) gets an NxX binary image BW as input with a single
% object centered to the image center. M denotes the radial frequency, N
% the angular frequency. Returns and vector FD, containing the fourier
% descriptors. The length of the output vector FD is (m*n+n+1). FD(end)
% contains the FD(0,0), the rest follow the order of FD(rad*n+ang) with
% 0 <= rad <= m and 0 <= ang <= n.
%
% Function that centers an object to the image center with its Centroid:
% http://www.mathworks.com/matlabcentral/fileexchange/52560-centerobject-bw
%
% This is an implementation of:
% "Shape-based image retrieval using generic Fourier descriptors", D.Zhang,
% G. Lu, 2002
%
% by Frederik Kratzert 24. Aug 2015
% contact f.kratzert(at)gmail.com

%check correct number of inputs
if nargin ~= 3
    error('Wrong number of input arguments');
end

%check if bw is logical
if ~islogical(bw)
    error('The input image must be of type ''logical''');
end

%check input values m,n
if mod(m,1) > 0 || mod(n,1) > 0 || m < 0 || n < 0
    error('Input arguments M and N must be an integer greater or equal to zero');
end

%get object informations
state = regionprops(bw,'Centroid','Extrema');

%error if image contains more than one object
if size(state.Centroid,1) > 1
    error('Image contains more than one object');
end

sz = size(bw);
%check if object is centered (with its Centroid) to the image center
diff = sz/2 - state.Centroid;
if sum(abs(diff) > 0.5) > 0
    error('Object is not centered to the image center. See ''help gfd''');
end

%get the maximal radius maxR
maxR = sqrt((state.Extrema(:,1)-state.Centroid(1)).^2 +...
    (state.Extrema(:,2)-state.Centroid(2)).^2);
maxR = max(maxR);


%meshgrid with origin centered to the image center
N = sz(1);
x = linspace(-N/2,N/2,N);
y = x;
[X,Y] = meshgrid(x,y);

%matrix containing radius of each cell to image center
radius = sqrt(X.^2+Y.^2)/maxR;

%matrix containing angluar of each cell to image center
theta = atan2(Y,X);
theta(theta < 0) = theta(theta <0) + 2*pi;

%Initialize variables
FR = zeros(m+1,n+1);
FI = zeros(m+1,n+1);
FD = zeros((m+1)*(n+1),1);

i = 1;
%loop over all radial frequencies
for rad = 0:m
    
    %loop over all angular frequencies
    for ang = 0:n
        
        %calculate FR and FI for (rad,ang)
        tempR = bw.*cos(2*pi*rad*radius+ang*theta);
        tempI = -1*bw.*sin(2*pi*rad*radius+ang*theta);        
        FR(rad+1,ang+1) = sum(tempR(:));
        FI(rad+1,ang+1) = sum(tempI(:));
        
        %calculate FD, where FD(end)=FD(0,0) --> rad == 0 & ang == 0
        if rad == 0 && ang == 0
            %normalized by circle area
            FD(i) = sqrt((FR(1,1)^2+FR(1,1)^2))/(pi*maxR^2);
            
        else
            %normalized by |FD(0,0)|;
            FD(i) = sqrt(((FR(rad+1,ang+1).^2+FI(rad+1,ang+1).^2)))/sqrt((FR(1,1)^2+FR(1,1)^2));
        end
        i = i+1;
    end
    
end



end