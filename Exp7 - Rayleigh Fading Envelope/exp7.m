%%  Experiment 7: To Simulate PDF of Rayleigh Fading envelope

%{
     Name:- Smit Shah
     Date:- 12/10/2020
%}

% Tools/Software Required: MATLAB

%% Theory

%{
    Rayleigh fading is a statistical model for the effect of a propagation environment on a radio signal, such as that used by wireless devices.
    
    Rayleigh fading is caused by multipath reception. The mobile antenna receives a large number, say N, reflected and scattered waves. Because of wave cancellation effects, the instantaneous received power seen by a moving antenna becomes a random variable, dependent on the location of the antenna.
    
    Rayleigh fading is viewed as a reasonable model for tropospheric and ionospheric signal propagation as well as the effect of heavily built-up urban environments on radio signals.[1][2] Rayleigh fading is most applicable when there is no dominant propagation along a line of sight between the transmitter and receiver.
%}

%% Code and Result

clc %for clearing the command window
close all %for closing all the window except command window
clear all %for deleting all the variables from the memory

N=1000000;   % Number of samples to generate
variance=0.2;  % Variance of underlying Gaussian random vriables
% Independent Gaussian random vriables with zero mean and unit variance
x=randn(1,N);
y=randn(1,N);

% Rayleigh Fading envelope with the desired variance
r=sqrt(variance*(x.^2 + y.^2));
% Define bin steps and range for histogram plotting
step = 0.1; range = 0:step:3;

% Get histogram values and approximate it to get the pdf curve
h=hist(r,range);
approxPDF = h/(step*sum(h));  % Simulated PDF from the x and y samples

% Theoretical PDF from the Rayleigh Fading equation
theoretical = (range/variance).*exp(-range.^2/(2*variance));
plot(range,approxPDF,'b*',range,theoretical,'r');
title('Simulated and theoretical rayleigh PDF for variance = 0.5')
legend('simulated PDF','Theoretical PDF')
xlabel('r --->');
ylabel('P(r) --->');
grid;

% PDF of phase of Rayleigh envelope
theta = atan(y./x);
figure(2)
hist(theta);  % Plot histogram of the phase part

% Approximate the histogram of the phase part to a nice PDF curve
[counts,range] = hist(theta,100);
step= range(2)-range(1);

% Normalizing the PDF to match theoretical curve
approxPDF = counts/(step*sum(counts));   % Simulated PDF from the x and y samples
bar(range, approxPDF, 'b');
hold on
plotHandle = plot(range,approxPDF,'r');
set(plotHandle,'LineWidth',3.5);
axis([-2 2 0 max(approxPDF)+0.2])
hold off
title ('Simulated PDF of Phase of Rayleigh Distribution ');
xlabel('\theta --->');
ylabel('P(\theta) --->');
grid on;

%% Conclusion

%{
    Hence, we can observe that the simulated values and theoretical values
    of Rayleigh PDF for 0.5 variance is same and the phase of simulated pdf
    of Rayleigh Distribution is constant.
%}