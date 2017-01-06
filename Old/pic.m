fid=fopen('bb.idx3-ubyte');
rll=fread(fid,784016);
rl=rll(17:784016);
for m=1:1000
    A(1:28,1:28,m)=zeros(28,28);
    for n=1:28
        A(n,1:28,m)=rl(28*(n-1)+784*(m-1)+1:28*n+784*(m-1));
    end
end
for n=95:100;
% figure();imshow(A(1:28,2:28,n)/255);
end
