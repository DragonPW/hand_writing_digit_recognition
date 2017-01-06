clear;
clc;
fid=fopen('t10k-images.idx3-ubyte');
[rll,count1]=fread(fid);
trainum=100;
rll=rll(17:16+784*trainum);
rll=1*(rll>158);
A=reshape(rll,28,28,trainum);
a1=reshape(sum(A),28,trainum)';
for n=1:trainum
    A1(:,:,n)=A(:,:,n)';
end
a2=reshape(sum(A1),28,trainum)';
stud(1:trainum,1:28)=a1;
% stud(1:trainum,29:56)=a2;








fid=fopen('t10k-labels.idx1-ubyte');
[labels,count2]=fread(fid);
labels=labels(9:trainum+8);


lab0=ismember(labels,[0]);
lab1=1*ismember(labels,[1]);
lab2=2*ismember(labels,[2]);
lab3=3*ismember(labels,[3]);
lab4=4*ismember(labels,[4]);
lab5=5*ismember(labels,[5]);
lab6=6*ismember(labels,[6]);
lab7=7*ismember(labels,[7]);
lab8=8*ismember(labels,[8]);
lab9=9*ismember(labels,[9]);
labs=zeros(10,trainum);

labs(1,:)=lab0;
labs(2,:)=lab1;
labs(3,:)=lab2;
labs(4,:)=lab3;
labs(5,:)=lab4;
labs(6,:)=lab5;
labs(7,:)=lab6;
labs(8,:)=lab7;
labs(9,:)=lab8;
labs(10,:)=lab9;

Kernel_FunctionValue=('linear');

for n=1:10
    train(n)=svmtrain(stud,labs(n,:),'Kernel_Function',Kernel_FunctionValue);
end


