 fid=fopen('train-images.idx3-ubyte');
number=100;
number2=number*784;
[sample]=fread(fid,number2+16);
sample=sample(17:16+number2);
sample=(sample>128);
sample=reshape(sample,784,number)';
fid=fopen('train-labels.idx1-ubyte');
[std,count2]=fread(fid);
std=std(9:number+8);

xxxx=svmclassify(train(9), sample);