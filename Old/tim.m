
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
unknows=reshape(unknows,784,number);
unknows=reshape(unknows,28,28,number);
unknow(1:22,1:22,:)=unknows(4:25,4:25,:);
unknow=reshape(unknow,484,number)';



result=zeros(1,number);
time=cputime;
for tt=1:number;
    for n=1:10
        for i=1:N
           xx(i)=kfun(unknow(tt,:)',samples(:,i,n));
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

time=cputime-time;