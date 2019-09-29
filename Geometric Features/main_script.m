clear;
clear all;

% 
% trainFolder = 'E:\Data_Science\ultrasound\codeandimages\trainImages';
% label = dir(trainFolder);
% 


TrainImage= dir('E:\Data_Science\ultrasound\new_dataset\val_aug\Benign\Mask\');


count=1;
% trainpath='E:\Data_Science\ultrasound\codeandimages\malig\';
maskpath='E:\Data_Science\ultrasound\new_dataset\val_aug\Benign\Mask\';

features = zeros(size(TrainImage,1)-3,16775);
% label =ones(size(TrainImage,1)-3);
for row=3:size(TrainImage,1)

    %     I = imread ([path,raw{row}(pos0(end)+1:end)]);
%     I = imread ([trainpath,TrainImage(row).name]);
    
    BW=imread([maskpath,TrainImage(row).name]);
    BW=im2bw(BW); %#ok<IM2BW>
%     BW = BW(20:end,:);
    BW = bwareaopen(BW,2500);
    features(count,1)=AP(BW);
    features(count,2)=Area(BW);
    features(count,3)= Aspectratio(BW);
    
    [value1,value2,value3,value4] = BoundingBoxCords(BW);
    features(count,4)= value1;
    features(count,5)= value2;
    features(count,6)= value3;
    features(count,7)= value4;
    [x,y]= Centroid(BW);
    
    features(count,8)= x;
    features(count,9)= y;
    features(count,10) = Circularity(BW);
    features(count,11) = Compactness(BW);
    features(count,12) = ConvexArea(BW);
    features(count,13) = Convexity(BW);
    features(count,14) = diameters(BW);
    features(count,15) = Dispersion(BW);
    features(count,16) = Eccentricity(BW);
    features(count,17) = EquivDiameter(BW);
    features(count,18) = EulerNumber(BW);
    features(count,19) = Extent(BW);
    features(count,20) = FilledArea(BW);
    features(count,21) = FindingEdgeAspect(BW);
    features(count,22) = FormFactor(BW);
    features(count,23:23+16739) =HOGFeatureExtraction(BW); 
    
    features(count,16763) =MajorAxislength(BW); 

    features(count,16764) =MinorAxisLength(BW); 
    [AOH,PhiOH ] =MomemtFeature(BW);
    
    features(count,16765) = AOH;
    features(count,16766) = PhiOH;
    features(count,16767) = Orientation(BW);
    features(count,16768) = Perimeter(BW);
    features(count,16769) = RatioAspect(BW);
    features(count,16770) = RatioHeightWidth(BW);
    features(count,16771) = Rectangularity(BW);
    features(count,16772) = RoundNess(BW);
    features(count,16773) = Solidity(BW);
    features(count,16774) = TCARatio(BW);

    features(count,16775) = Tortuosity(BW);
    
  
    display(count)
    count=count+1;

    

    
end

save('feature_vector_validation_Benign.mat','features')