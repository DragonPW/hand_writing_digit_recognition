clear;
clc;
fid=fopen('t10k-labels.idx1-ubyte');
N=100;
labels=fread(fid,10008);
labels=labels(9:10008);
fclose(fid);
adr=zeros(10,N);
for n=1:10
     m=1;
     flag=0;
     while  flag<N
         if (labels(m)==n-1) 
             flag=flag+1;
             adr(n,flag)=m;
             m=m+1;
         end
         m=m+1;
     end
end

fid=fopen('t10k-images.idx3-ubyte');
rll=fread(fid,16+784*10000);
rll=rll(17:16+784*10000);
rll=reshape(rll,28,28,10000);
rl(1:24,1:24,:)=rll(3:26,3:26,:);
rl=reshape(rl,576,10000);

fclose(fid);
rll=1*(rll>158);
samples=zeros(784,N,10);
for n=1:10
    for m=1:N
        samples(1:784,m,n)=rll(784*adr(n,m)-783:784*adr(n,m));
    end
end





Kr=zeros(N,N,10);
for n=1:10
    for i=1:N
       for j=1:N
           Kr(i,j,n)=kfun(samples(:,i,n),samples(:,j,n));
       end
    end
end


%``````````````````````````````
weishu=50;
V=zeros(N,weishu,10);
D=zeros(weishu,weishu,10);
lamd=zeros(weishu,weishu);
for n=1:10
[V(:,:,n),D(:,:,n)]=eigs(Kr(:,:,n),weishu);
lamd(n,:)=sum(D(:,:,n));
end 

%``````````````````````````
fid=fopen('train-labels.idx1-ubyte');
number=200;
std=fread(fid,8+number);
std=std(9:8+number);
fclose(fid);
fid=fopen('train-images.idx3-ubyte');
unknows=fread(fid,16+784*number);
unknows=unknows(17:16+784*number);
unknows=1*(unknows>158);


fclose(fid);
% unknows=reshape(unknows,784,number);
% unknows=reshape(unknows,28,28,number);
% unknow(1:24,1:24,:)=unknows(3:26,3:26,:);
unknows=reshape(unknows,784,number)';

t=cputime;

result=zeros(1,number);
for tt=1:number;
    for n=1:10
        for i=1:N
           xx(i)=kfun(unknows(tt,:)',samples(:,i,n));
        end
        outp=0;
        for m=1:weishu
            outp=outp+(xx*V(:,m,n))^2;
        end
     x(n)=outp;
    end
    xxx=x/max(x);
    xxx=1*ismember(xxx,[1]);
      flag=0;
    for n=1:10
        if xxx(n)==0 &flag==0
            result(tt)=result(tt)+1;
        else    flag=1;
        end
    end
end
rate=result'-std;
rate=ismember(rate,[0]);
rate=sum(rate)/number;
t=cputime-t;








