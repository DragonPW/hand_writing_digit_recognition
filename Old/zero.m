fid=fopen('train-images.idx3-ubyte');
t=cputime;
number=1000;
number2=number*784;
[sample]=fread(fid,number2+16);
sample=sample(17:16+number2);
sample=1*(sample>158);
sample=reshape(sample,784,number)';
fid=fopen('train-labels.idx1-ubyte');
[std,count2]=fread(fid);
std=std(9:number+8);


xxx=svmclassify(train(7), sample);
Group=zeros(10,number);
for n=1:10
    Group(n,:)=svmclassify(train(n), sample);
end
% Group(2,:)=svmclassify(train1, sample);
% Group(3,:)=svmclassify(train2, sample);
% Group(4,:)=svmclassify(train3, sample);
% Group(5,:)=svmclassify(train4, sample);
% Group(6,:)=svmclassify(train5, sample);
% Group(7,:)=svmclassify(train6, sample);
% Group(8,:)=svmclassify(train7, sample);
% Group(9,:)=svmclassify(train8, sample);
% Group(10,:)=svmclassify(train9, sample);
for n=1:number
     flag=1; 
    for m=[8 9 6 5 4 3 10 7 2 1]
        if (flag>0)&(Group(m,n)>0)
            flag=0;
        elseif flag<1
            Group(m,n)=0;
        end
     end
end
        

outp=zeros(1,number);
for n=2:10
    outp=outp+Group(n,:);
end

a=t_rate(std,Group,number);
b=outp-std';
b=ismember(b,[0]);
b=sum(b)/number;




t=t-cputime;

