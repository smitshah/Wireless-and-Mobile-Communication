%% Experiment 10: To Simulate Hata-Okumura Models

%{
     Name:- Smit Shah
     Date:- 02/11/2020
%}

% Tools/Software Required: MATLAB

%% Theory

%{
    The Hata model is a radio propagation model for predicting the path loss of cellular transmissions in exterior environments, valid for microwave frequencies from 150 to 1500 MHz. It is an empirical formulation based on the data from the Okumura Model, and is thus also commonly referred to as the Okumura–Hata model.

    The model incorporates the graphical information from Okumura model and develops it further to realize the effects of diffraction, reflection and scattering caused by city structures. Additionally, the Hata Model applies corrections for applications in suburban and rural environments.
%}

%% Code and Result

clc %for clearing the command window
close all %for closing all the window except command window
clear all %for deleting all the variables from the memory


Hbts = 50; % Height measured from the base of the BTS tower to the radiation centerline
Tbts = 350; % Terrain elevation at the location of the BTS
Htav = 300; % Height of the average terrain (from 3 Km to 15 Km distance from the BTS)
Hm = 3; % Height of the mobile antenna in meters
f = 870; % 100:100:3000; % Range of frequencies in MHZ
d = 3:3:15; % Range of Tx-Rx separation distances in Km
Pt = 19.5; % Power transmitted by the BTS antenna in Watts
Gt = 10; % BTS antenna gain in dBi

Hb = Hbts + Tbts + Htav; % Effective Height of the BTS antenna in meters

% Cell array to store various model names
models = {'Big City(Urban model)'; 'Small & Medium City(Urban model)'; 'Sub-urban environment'; 'Open Rural environment'};

display('Hata-Okumura Model');
display(['1 ' models{1,1}]);
display(['2 ' models{2,1}]);
display(['3 ' models{3,1}]);
display(['4 ' models{4,1}]);
reply = input('Select Your choice of environment: ','s');

if 0<str2num(reply)<4
    modelName = models{str2num(reply),1};
    display(['Chosen Model: ' modelName])
else
    error('Invalid Selection')
end

switch reply
    case '1',
        c = 0;
        if f<=200
            aHm = 8.29*(log10(1.54*Hm))^2-1.1;
        else
            aHm = 3.2*(log10(11.75*Hm))^2-4.97;
        end
    case '2',
        c = 0;
        aHm = (1.1*log10(f)-0.7)*Hm-(1.56*log10(f)-0.8);
    case '3',
        aHm = (1.1*log10(f)-0.7)*Hm-(1.56*log10(f)-0.8);
        c = -2*(log10(f/28))^2-5.4;
    case '4',
        aHm = (1.1*log10(f)-0.7)*Hm-(1.56*log10(f)-0.8);
        c = -4.78*(log10(f))^2+18.33*log10(f)-40.98;
    otherwise
        error('Invalid model selection');
end

A = 69.55 + 26.16*log10(f) - 13.82*log10(Hb) - aHm;
B = 44.9 - 6.55*log10(Hb);

PL = A + B*log10(d) + c;
subplot(2,1,1)
plot(d,PL,'r','linewidth',2);
title(['Hata-Okumura Path Loss Model for: ' modelName]);
xlabel('Distance(Km)');
ylabel('Path Loss(dB)');

% Compute Received Signal Level
Pr = 10*log10(Pt*1000)+Gt-PL;
subplot(2,1,2)
plot(d,Pr,'r','linewidth',2);
title(['Hata-Okumura Path Loss Model for: ' modelName]);
xlabel('Distance(Km)');
ylabel('Received Signal Level(dBm)');

%% Conclusion

%{
    Hence, we observed path loss and received signal level for Small &
    Medium City(Urban model) using Hata-Okumura Model. We saw that the path
    loss was increasing and received signal level was decreasing, with
    increase in distance.
%}