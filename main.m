%%  hand writing digit number recogition - machine learning project
%   testing method:  Support vector machine with polynomial kernel
%   by dragonPW
%   Version 1 
%   2017-01-03
%%
clear;
% clc;
close all;

%% read training data from files

fid_label=fopen('train-labels.idx1-ubyte');
fid_image=fopen('train-images.idx3-ubyte');
fread(fid_label,4); % skip the file head
fread(fid_image,16); % skip the file head
data = fread(fid_label,4);
total_number = data(1)*256*256*256+data(2)*256*256+data(3)*256+data(4); % total number of data in the file
% training_N = total_number;
training_N = 4000;
IMAGE_SIZE = 28;
training_label = fread(fid_label,training_N)';
image_data = fread(fid_image,training_N*IMAGE_SIZE*IMAGE_SIZE);
training_image = reshape(image_data,IMAGE_SIZE,IMAGE_SIZE,[]);
fclose(fid_label);
fclose(fid_image);
%% display the data
% figure(1)
% for i=1:20
%     subplot(4,5,i);
%     imshow(training_image(:,:,i)');
%     xlabel(training_label(i));
% end

%% read testing data from files
fid_label=fopen('t10k-labels.idx1-ubyte');
fid_image=fopen('t10k-images.idx3-ubyte');
fread(fid_label,4); % skip the file head
fread(fid_image,16); % skip the file head
data = fread(fid_label,4);
total_number = data(1)*256*256*256+data(2)*256*256+data(3)*256+data(4); % total number of data in the file
testing_N = total_number;
IMAGE_SIZE = 28;
testing_label = fread(fid_label,testing_N)';
image_data = fread(fid_image,testing_N*IMAGE_SIZE*IMAGE_SIZE);
testing_image = reshape(image_data,IMAGE_SIZE,IMAGE_SIZE,[]);
fclose(fid_label);
fclose(fid_image);

%%  training and classifying
% input: training_image,training_label,testing_image,
% output: classifier_output 

training_testing_SVM_polynomial


%% compare the result
err = testing_label==classifier_output;
misMatch = testing_N-sum(err);
error_rate = misMatch/testing_N;
display(['training size: ' num2str(training_N)]);
display(['error: ' num2str(misMatch)  ' out of ' num2str(testing_N)]);
display(['error rate: ' num2str(error_rate*100) '%']);

%% display the data
error_idx = find(err==0);

figure(1)
for i=1:20
    subplot(4,5,i);
    imshow(testing_image(:,:,error_idx(i))');
    xlabel([num2str(testing_label(error_idx(i))) '->' num2str(classifier_output(error_idx(i)))]);
end

%%  performance
% SVMModels{j} = fitcsvm(X',y','Standardize',false,'KernelFunction','polynomial',...
%     'PolynomialOrder',6,'KernelScale','auto');
% training size: 1000
% error rate: 9.85%
% training size: 2000
% error rate: 7.33%
% training size: 4000
% error rate: 5.26%
% training size: 8000
% error rate: 3.84%
% training size: 16000
% error rate: 2.89%
% training size: 60000
% error rate: 1.61%
% 
% However, the time for training is really long for training size greater than 4000.
