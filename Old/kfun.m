%K_FUN Summary of this function goes here
%   Detailed explanation goes here
function K = kfun(U,V)

d=(U'-V')*(U-V);
K3=(d+3*d^0.5+3)*exp(-d^0.5);
K1=1/2*exp(-d^0.5/16);
K8=1/4*(1+d^0.5)*exp(-d^0.5);
K2=1/2*exp(-d/16);
K3=(d+1)^0.1;

K4=(d)^0.1;
K=K2;