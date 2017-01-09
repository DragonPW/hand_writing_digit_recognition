%%  hand writing digit number recogition - machine learning project
%   testing method: 
%   by dragonPW
%   Version 1 
%   2017-01-03
%%
clear all;
clc;
close all;
fid_label=fopen('train-labels.idx1-ubyte');
fid_image=fopen('train-images.idx3-ubyte');
fread(fid_label,4); % skip the file head
fread(fid_image,16); % skip the file head
data = fread(fid_label,4);
total_number = data(1)*256*256*256+data(2)*256*256+data(3)*256+data(4); % total number of data in the file
training_N = total_number;
IMAGE_SIZE = 28;
training_label = fread(fid_label,training_N)';
image_data = fread(fid_image,training_N*IMAGE_SIZE*IMAGE_SIZE);
training_image = reshape(image_data,IMAGE_SIZE,IMAGE_SIZE,[]);
fclose(fid_label);
fclose(fid_image);
%% display the data
figure(1)
for i=1:20
    subplot(4,5,i);
    imshow(training_image(:,:,i)');
    xlabel(training_label(i));
end
%%  group the images by label value




%% run for testing data
% read testing data
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

%% process testing image
% result = zeros(1,testing_N,1);
result = floor(rand(1,testing_N,1)*10);

%% compare the result
err = testing_label==result;
misMatch = testing_N-sum(err);
error_rate = misMatch/testing_N;
display(['error: ' num2str(misMatch)  ' out of ' num2str(testing_N)]);
display(['error rate: ' num2str(error_rate*100) '%']);
