weishu=50;
V=zeros(N,weishu,10);
D=zeros(weishu,weishu,10);
lamd=zeros(weishu,weishu);
for n=1:10
[V(:,:,n),D(:,:,n)]=eigs(Kr(:,:,n),weishu);
lamd(n,:)=sum(D(:,:,n));
end 
