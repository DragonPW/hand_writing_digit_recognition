fid1=fopen('b.idx1-ubyte');
[labels,count]=fread(fid1);
labels=labels(9:count);
y=labels(1:1000);



