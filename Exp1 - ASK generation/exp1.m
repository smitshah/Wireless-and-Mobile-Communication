%% Experiment 1: ASK generation

%{
     Name:- Smit Shah
     Date:- 27/07/2020
%}

% Tools/Software Required: MATLAB

%% Theory

%{
    Amplitude-shift keying (ASK) is a form of amplitude modulation that
    represents digital data as variations in the amplitude of a carrier
    wave. In an ASK, the binary symbol 1 is represented by transmitting
    a fixed-amplitude carrier wave and fixed frequency for a bit duration
    of T seconds. If the signal value is 1 then the carrier signal will be transmitted;
    otherwise, a signal value of 0 will be transmitted.
%}

%% Code and Result

clc %for clearing the command window
close all %for closing all the window except command window
clear all %for deleting all the variables from the memory

fc= 25 %input('Enter the freq of Sine Wave carrier:');  %fc=25
fp= 5 %input('Enter the freq of Periodic Binary pulse (Message):');   %fp=5
amp= 2 %input('Enter the amplitude (For Carrier & Binary Pulse Message):');  %amp=2
t=0:0.001:1; % For setting the sampling interval
c=amp.*sin(2*pi*fc*t);% For Generating Carrier Sine wave

subplot(3,1,1) %For Plotting The Carrier wave
plot(t,c)
xlabel('Time')
ylabel('Amplitude')
title('Carrier Wave')
m=amp/2.*square(2*pi*fp*t)+(amp/2);%For Generating Square wave message

subplot(3,1,2) %For Plotting The Square Binary Pulse (Message)
plot(t,m)
xlabel('Time')
ylabel('Amplitude')
title('Binary Message Pulses')
w=c.*m; % The Shift Keyed Wave

subplot(3,1,3) %For Plotting The Amplitude Shift Keyed Wave
plot(t,w)
xlabel('Time')
ylabel('Amplitude')
title('Amplitide Shift Keyed Signal')

%% Conclusion

%{
    Hence, we can observe that when the signal value is 1 then the carrier signal was transmitted; otherwise, a signal value of 0 was transmitted. 
%}