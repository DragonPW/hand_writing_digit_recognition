fid2=fopen('train-images.idx3-ubyte');
number=100;
number2=number*784;
[sample]=fread(fid2,number2+16);
sample=sample(17:16+number2);
sample=1*(sample>158);

fid2=fopen('train-labels.idx1-ubyte');
[std,count2]=fread(fid2);
std=std(9:number+8)';

B=reshape(sample,28,28,number);
b1=reshape(sum(B),28,number)';
for n=1:number
    B1(:,:,n)=B(:,:,n)';
end
b2=reshape(sum(B1),28,number)';
test(1:number,1:28)=b1;
% test(1:number,29:56)=b2;;



Group=zeros(10,number);
for n=1:10
    Group(n,:)=svmclassify(train(n), test);
end
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
b=outp-std;
b=ismember(b,[0]);
b=sum(b)/number;


