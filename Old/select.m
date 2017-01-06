function [sum] = select(sample,train)
%SELECT Summary of this function goes here
%   Detailed explanation goes here
N=size(sample);
Group=zeros(10,N(1));
Group(1,:)=svmclassify(train(1), sample);
Group(2,:)=svmclassify(train(2), sample);
Group(3,:)=svmclassify(train(3), sample);
Group(4,:)=svmclassify(train(4), sample);
Group(5,:)=svmclassify(train(5), sample);
Group(6,:)=svmclassify(train(6), sample);
Group(7,:)=svmclassify(train(7), sample);
Group(8,:)=svmclassify(train(8), sample);
Group(9,:)=svmclassify(train(9), sample);
Group(10,:)=svmclassify(train(10), sample);
sum=zeros(1,N(1));
for n=2:10
    sum=sum+Group(n,:);
end

