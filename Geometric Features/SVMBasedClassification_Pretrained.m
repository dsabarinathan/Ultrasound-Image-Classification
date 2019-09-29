f0 = load('feature_vector_train_Benign.mat');

benignTrain = f0.features;

f1 = load('feature_vector_train_Malignant.mat');

MalginantTRain =f1.features;

f2 = load('feature_vector_validation_Benign.mat');

benignTest = f2.features;

f3 = load('feature_vector_validation_Malignant.mat');

MalginantTest =f3.features;


% X=features(:,1:21);
% Y=features(:,22);

X_train= [benignTrain;MalginantTRain];
Y_train=[ones(size(benignTrain,1),1)*-1;ones(size(MalginantTRain,1),1)];


X_test = [benignTest;MalginantTest];
Y_test=[ones(size(benignTest,1),1)*-1;ones(size(MalginantTest,1),1)];

% Randomly partitions observations into a training set and a test
% set using stratified holdout
% P = cvpartition(Y,'Holdout',0.20);
% 
% X_train = double( X(P.training,:) );
% Y_train = double( Y(P.training) ); % labels: neg_class -1, pos_class +1
% % X_train = [X_train,rand(120,4)];
% X_test = double( X(P.test,:) );
% Y_test = double( Y(P.test)); % labels: neg_class -1, pos_class +1
% % X_test = [X_test,rand(30,4)];
% % number of features

%ranking=[ 6, 12,20,2,7,16768,16763,14,7];

rankinginfs= [6,12,20,2,7,16768];

% ranking(1:k)
% Use a linear support vector machine classifier
% svmStruct = svmtrain(X_train(:,ranking(1:k)),Y_train,'showplot',true);
%SVMModel = fitcsvm(X_train(:,rankinginfs),Y_train,'Standardize',true,'KernelFunction','RBF',...
 %   'KernelScale','auto');

 load SVM_model_76.mat
 model = load('SVM_model_76.mat');
 SVMModel = model.SVMModel;
[C,score] = predict(SVMModel,X_train(:,rankinginfs));

% C = svmclassify(svmStruct,X_test(:,ranking(1:k)),'showplot',true);
err_rate = sum(Y_train~= C)/size(X_train,1); % mis-classification rate
conMat = confusionmat(Y_train,C); % the confusion matrix

display(100*(1-err_rate))



Precision = conMat(1,1)/(conMat(1,1)+conMat(1,2));

Recall = conMat(1,1)/(conMat(1,1)+conMat(2,1));

Accuracy =  (conMat(1,1)+conMat(2,2))/sum(sum(conMat));


F1_Score = 2*(Precision*Recall)/(Precision+Recall);


Selectivity = conMat(1,2)/(conMat(2,1)+conMat(1,2));

