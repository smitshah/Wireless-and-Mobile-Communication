%% Experiment 4: QPSK generation

%{
     Name:- Smit Shah
     Date:- 21/09/2020
%}

% Tools/Software Required: MATLAB

%% Theory

%{
    QPSK is a modulation scheme that allows one symbol to transfer two bits
    of data. There are four possible two-bit numbers (00, 01, 10, 11), and
    consequently we need four phase offsets. Maximum separation between
    the phase options in this case is 90°.

    Constellation diagram represents phase. Phasor diagran shows phase
    relationships between 2 or more sine wave having same frequency.
%}

%% Code and Result

clc %for clearing the command window
close all %for closing all the window except command window
clear all %for deleting all the variables from the memory

cvx= 10 %input('enter length of random bit sequence:');
d=round(rand(1,cvx))
l=cvx;
x=0:0.01:l*2*pi;
cc=cos(x);
cs=cos(x+pi/2);
k=length(cc);
k1=k/l;

for i=1:l
    if(d(i)==0)
        d(i)=-1;
        i=i+1;
    end
end

i=1;
j=1;
while (i<l) && (j<l)
    dd1(j)=d(i);
    dd1(j+1)=d(i);
    dd2(j)=d(i+1);
    dd2(j+1)=d(i+1);
    j=j+2;
    i=i+2;
end

t=1;
for i=1:l
    for j=1:k1
        dd(t)=d(i);
        d1(t)=dd1(i);
        d2(t)=dd2(i);
        t=t+1;
        j=j+1;
    end
    i=i+1;
end

subplot(6,1,1);
stairs(dd);
axis([0 t -2 2]);
title('input bit stream');

subplot(6,1,2);
stairs(d1);
axis([0 t -2 2]);
title('odd bit stream');

subplot(6,1,3);
stairs(d2);
axis([0 t -2 2]);
title('even bit stream');

len=length(d1);
if(k<len)
    len=k;
end

for i=1:len
    qcc(i)=cc(i)*d1(i);
    qcs(i)=cs(i)*d2(i);
    i=i+1;
end

subplot(6,1,4);
plot(qcc);
axis([0 len -2 2]);
title('modulated wave of I-component');

subplot(6,1,5);
plot(qcs);
axis([0 len -2 2]);
title('modulated wave of Q-component');

qp=qcc+qcs;
subplot(6,1,6);
plot(qp);
axis([0 len -2 2]);
title('QPSK WAVEFORM');

figure, scatter(dd1, dd2, 40,'*r');
axis([-1.2 1.2 -1.2 1.2]);
title('constellation diagram of QPSK');

%% Conclusion

%{
    Hence, we can observe that constellation diagram represents phase and phasor diagran shows phase relationships between 2 or more sine wave having same frequency.
%}