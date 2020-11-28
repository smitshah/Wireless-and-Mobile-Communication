%% Experiment 3: BPSK generation

%{
     Name:- Smit Shah
     Date:- 14/09/2020
%}

% Tools/Software Required: MATLAB

%% Theory

%{
    Phase-shift keying (PSK) is a digital modulation process which conveys
    data by changing (modulating) the phase of a constant frequency
    reference signal (the carrier wave).

    One type of PSK is called binary phase shift keying (BPSK), where
    “binary” refers to the use of two phase offsets (one for logic high, one
    for logic low). In BPSK, the transmitted signal is a sinusoid of fixed
    amplitude. It has one fixed phase when the data is at one level and when
    the data is at the other level, phase is different by 180 degree.
%}

%% Code and Result

clc;
clear all;
close all;

t=0:0.001:1; % for setting the sampling interval
fc= 40 %input('Enter the freq of Sine Wave carrier:');  
fm= 10 %input('Enter the freq of Message signal:');   
amp= 2 %input('Enter the carrier and message amplitude (Assuming both equal):'); 
c=amp.*sin(2*pi*fc*t); % Generating carrier sine

subplot(3,1,1)%for plotting carrier wave
plot(t,c)
xlabel('Time')
ylabel('Amplitude')
title('Carrier')
m=square(2*pi*fm*t);

subplot(3,1,2)%for plotting message signal
plot(t,m)
xlabel('Time')
ylabel('Amplitude')
title('Message signal') %sine wave multiplied with square wave in order to generate
x=c.*m;

subplot(3,1,3)
plot(t,x)
xlabel('t')
ylabel('y')
title('BPSK')

%% Conclusion

%{
    Hence, we can observe that when it had one fixed phase when the data was at one level and when the data was at the other level, phase was different by 180 degree.
%}