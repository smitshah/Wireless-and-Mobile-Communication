%%  Experiment 6: To simulate Log distance/Log Normal Shadowing Path Loss model

%{
     Name:- Smit Shah
     Date:- 05/10/2020
%}

% Tools/Software Required: MATLAB

%% Theory

%{
    Log distance path loss model is an extension to the Friis free space
    model. It is used to predict the propagation loss for a wide range of
    environments. The model encompasses random shadowing effects due to
    signal blockage by hills, trees, buildings etc. It is also referred as
    log normal shadowing model.
%}

%% Code and Result

clc %for clearing the command window
close all %for closing all the window except command window
clear all %for deleting all the variables from the memory

PtdBm=52; %Input - Transmitted power in dBm
GtdBi=25; %Gain of the Transmitted antenna in dBi
GrdBi=15; %Gain of the Receiver antenna in dBi
frequency=1*10^9; %Transmitted signal frequency in Hertz
%Example Frequency = 1 GHz
d =41935000*(1:1:500); %Array of input distances in meters
L=1; %Other System Losses, No Loss case L=1
sigma = 1; % Standard deviation of zero- mean Normal distribution

%Convert all powers to linear scale 
Pt=10^((PtdBm-30)/10); %Convert to Watts
Gt=10^(GtdBi/10);
Gr=10^(GrdBi/10);
lambda=3*10^8/frequency; %Wavelength in meters
Pr= Pt*(Gt*Gr*lambda^2)./((4*pi.*d).^2*L);
X = sigma*randn(size(Pr));
propLoss= Pr./Pt;
PLdBm= 10*log10(propLoss)+10*log10(X);
PrdBm= 10* log10(Pr) + 30; % Convert to dBm
plot(log10(d),10*log10(propLoss),'G','Linewidth',2);
title('Log Normal Shadowing Model')
xlabel('log10(d)');
ylabel('P_r/P_t (dBm)');
hold on;
plot(log10(d),PLdBm,'r.');
legend('Propagation Loss','Due to Log normal shadowing');

%% Conclusion

%{
    Hence, we can observe that the model encompasses random shadowing
    effects due to signal blockage by hills, trees, buildings etc. We see
    that log normal shadowing incearses as the blockage increases.
%}