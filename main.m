%%  hand writing digit number recogition - machine learning project
%   testing method: 
%   by dragonPW
%   Version 1 
%   2017-01-03
%%
clear;
clc;
close all;
fid_label=fopen('train-labels.idx1-ubyte');
fid_image=fopen('train-images.idx3-ubyte');
number=10;
fread(fid_label,4); % skip the file head
fread(fid_image,16); % skip the file head
data = fread(fid_label,4);
total_number = data(1)*256*256*256+data(2)*256*256+data(3)*256+data(4); % total number of data in the file
N = total_number;
IMAGE_SIZE = 28;
training_label = fread(fid_label,N)';
image_data = fread(fid_image,N*IMAGE_SIZE*IMAGE_SIZE);
training_image = reshape(image_data,IMAGE_SIZE,IMAGE_SIZE,[]);
%% display the data
figure(1)
for i=1:20
    subplot(4,5,i);
    imshow(training_image(:,:,i)');
    xlabel(training_label(i));
end
%%  group the images by label value




%%