%%  Experiment 5: To simulate Friis Free Space Path Loss Equation

%{
     Name:- Smit Shah
     Date:- 28/09/2020
%}

% Tools/Software Required: MATLAB

%% Theory

%{
    The information, or message, that is to be transmitted, is modulated onto
    a frequency carrier, which is then emitted from a transmit antenna in the
    form of an electromagnetic (EM) wave.  This EM wave propagates through
    free space, and is then collected by the receive antenna.  The receive
    antenna then converts the EM wave into an electrical signal which can
    then be demodulated back into  the original message.  However, the signal
    power (watts) received by the antenna is much less than the transmitted
    power due to attenuation loss. The Friis equation (also known as the
    Free Space Loss, FSL equation) describes this attenuation loss.
%}

%% Code and Result

clc %for clearing the command window
close all %for closing all the window except command window
clear all %for deleting all the variables from the memory

% Input section
PtdBm=52; % Input- Transmitted power in dBm
GtdBi=25; % Gain of the transmitted antenna in dBi
GrdBi=15; % Gain of the receiver antenna in dBi
frequency= 1*10^9; % transmitted signalfrequency in Hertz
% Example Frequency =1 GHz
d=41935000*(1:1:200); % Array of input distances in meters 
L=1; % Other System Losses, No loss case L=1

% Convert all powers to linear scale %
Pt=10^((PtdBm-30)/10); % COnvert to Watts
Gt=10^(GtdBi/10);
Gr=10^(GrdBi/10);
lambda=3*10^8/frequency; % Wavelength in meters
Pr= Pt*(Gt*Gr*lambda^2)./((4*pi.*d).^2*L);
PrdBm=10*log10(Pr)+30; %Convert to dBm
plot(log10(d),PrdBm) ;
title('Free space Path loss model')
xlabel('log10(d)');
ylabel('P_r (dBm)');

%% Conclusion

%{
    Hence, we can observe that the graph of Free space was linearly
    increasing in negavtive axis, i.e. as we increase the value of d, the
    loss was inceasing.
%}