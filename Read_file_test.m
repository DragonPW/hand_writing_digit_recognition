%%  test the reading and extracting of data
%  2017-01-03
%  by DragonPw
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
N = 20;
IMAGE_SIZE = 28;
training_label = fread(fid_label,N)'
image_data = fread(fid_image,N*IMAGE_SIZE*IMAGE_SIZE);
training_image = reshape(image_data,IMAGE_SIZE,IMAGE_SIZE,[]);

figure(1)
for i=1:N
    subplot(4,5,i);
    imshow(training_image(:,:,i)');
end





%%




%%