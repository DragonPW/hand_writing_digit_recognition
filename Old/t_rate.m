function [rate] = t_rate(std,Group,number)
%T_RATE Summary of this function goes here
%   Detailed explanation goes here
% std为正确值   Group为识别结果数组，number为所数字的数目
std0=1*ismember(std,[0]);
std1=1*ismember(std,[1]);
std2=1*ismember(std,[2]);
std3=1*ismember(std,[3]);
std4=1*ismember(std,[4]);
std5=1*ismember(std,[5]);
std6=1*ismember(std,[6]);
std7=1*ismember(std,[7]);
std8=1*ismember(std,[8]);
std9=1*ismember(std,[9]);
stds=zeros(10,number);
stds(1,:)=std0;
stds(2,:)=std1;
stds(3,:)=std2;
stds(4,:)=std3;
stds(5,:)=std4;
stds(6,:)=std5;
stds(7,:)=std6;
stds(8,:)=std7;
stds(9,:)=std8;
stds(10,:)=std9;
rate=(stds.*Group);
rate=ismember(rate,[0]);
rate=number-sum(rate');
rate=rate./sum(stds');
