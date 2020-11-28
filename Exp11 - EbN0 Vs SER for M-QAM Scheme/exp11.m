%% Experiment 11: Demonstration of Eb/N0 Vs. SER for M-QAM (Quadrature Amplitude Modulation) scheme

%{
     Name:- Smit Shah
     Date:- 23/11/2020
%}

% Tools/Software Required: MATLAB

%% Theory

%{
    QAM (quadrature amplitude modulation) is a method of combining two amplitude-modulated (AM) signals into a single channel, thereby doubling the effective bandwidth. QAM is used with pulse amplitude modulation (PAM) in digital systems, especially in wireless applications.

    In a QAM signal, there are two carriers, each having the same frequency but differing in phase by 90 degrees (one quarter of a cycle, from which the term quadrature arises). One signal is called the I signal, and the other is called the Q signal. Mathematically, one of the signals can be represented by a sine wave, and the other by a cosine wave. The two modulated carriers are combined at the source for transmission. At the destination, the carriers are separated, the data is extracted from each, and then the data is combined into the original modulating information.
%}

%% Code and Result

clc %for clearing the command window
close all %for closing all the window except command window
clear all %for deleting all the variables from the memory

N=10000; %Number of input symbols
EbN0dB = -6:2:12; %Define EbN0dB range for simulation
M=16; %for 16-QAM modulation.

refArray=1/sqrt(10)*[-3-3j,-3-1j,-3+3j,-3+1j,-1-3j,-1-1j,-1+3j,  -1+1j,3-3j,3-1j,3+3j,3+1j,1-3j,1-1j,1+3j,1+1j];

symErrSimulated = zeros(1,length(EbN0dB));
k=log2(M);
EsN0dB = EbN0dB + 10*log10(k);

%Generating a uniformly distributed random numbers in the set [0,1,2,..,M-1]
data=ceil(M.*rand(N,1))-1;
s=refArray(data+1); %16-QAM Constellation mapping with Gray coding

%Reference Constellation for demodulation and Error rate computation
refI = real(refArray);
refQ = imag(refArray);

%Place holder for Symbol Error values for each Es/N0 for particular M value
index=1;
figure(1);

subplot(1,2,1);
plot(real(s),imag(s),'r*');
title('Constellation diag. of Transmitted Symbols');
xlabel('Inphase component');
ylabel('Quadrature component');

subplot(1,2,2);
for x=EsN0dB,    
    %Channel Noise for various Es/N0
    %Adding noise with variance according to the required Es/N0
    noiseVariance = 1/(10.^(x/10));%Standard deviation for AWGN Noise
    noiseSigma = sqrt(noiseVariance/2);
    
    %Creating a complex noise for adding with M-QAM modulated signal
    %Noise is complex since M-QAM is in complex representation
    noise = noiseSigma*(randn(size(s))+1i*randn(size(s)));
    received = s + noise;
    
    %I-Q Branching
    r_i = real(received);
    r_q = imag(received);
    
    %Decision Maker-Compute (r_i-s_i)^2+(r_q-s_q)^2 and choose the smallest
    r_i_repmat = repmat(r_i,M,1);
    r_q_repmat = repmat(r_q,M,1);
    plot(r_i,r_q,'*');
    title(['Constellation diag. of Received Symbols Eb/N0=' num2str(x-10*log10(k)) 'dB']);
    xlabel('Inphase component');
    ylabel('Quadrature component');
    %pause;
    distance = zeros(M,N); %place holder for distance metric
    minDistIndex=zeros(N,1);
    
    for j=1:N,
        %Distance computation - (r_i-s_i)^2+(r_q-s_q)^2
        distance(:,j) = (r_i_repmat(:,j)-refI').^2+(r_q_repmat(:,j)-refQ').^2;
        
        %capture the index in the array where the minimum distance occurs
        [dummy,minDistIndex(j)]=min(distance(:,j));
    end
    
    y = minDistIndex - 1;%The index becomes the decoded symbol
    
    %Symbol Error Rate Calculation
    dataCap = y;
    symErrSimulated(1,index) = sum(dataCap~=data)/N;
    index=index+1;
end

%Compute Theoretical Symbol Error Rates
%EsN0lin = 10.^(EsN0dB/10);
EbN0lin = 10.^(EbN0dB/10);
symErrTheory = 2*(1-1/sqrt(M))*erfc(sqrt(3/2*k*EbN0lin/(M-1)));

%Plotting commands
figure(2);
semilogy(EbN0dB,symErrTheory,'r-');hold on;
semilogy(EbN0dB,symErrSimulated,'b*');
legend('16QAM-Theory','16QAM-Sim');
xlabel('Eb/N0(dB)');
ylabel('Symbol Error Rate (Ps)');
grid on;

%% Conclusion

%{
    Hence, we observed the constellation of transmitted symbols and
    received symbol and then plotted a graph of Theoretical Symbol Error
    rate and SImulated error rate and both were coming almost similar.
%}