%% Experiment 8: To Simulate Ricean Fading for various non-centrality Parameter

%{
     Name:- Smit Shah
     Date:- 19/10/2020
%}

% Tools/Software Required: MATLAB

%% Theory

%{
    Rician fading or Ricean fading is a stochastic model for radio propagation anomaly caused by partial cancellation of a radio signal by itself — the signal arrives at the receiver by several different paths (hence exhibiting multipath interference), and at least one of the paths is changing (lengthening or shortening).

    Rician fading occurs when one of the paths, typically a line of sight signal or some strong reflection signals, is much stronger than the others.
%}

%% Code and Result
clc %for clearing the command window
close all %for closing all the window except command window
clear all %for deleting all the variables from the memory

N = 100000; % Number of samples
sigma =1; %Variance of underlying Gausian Variables
s = [0 1 2 4]; %Non-Centrality Parameter
plotStyle = {'b-', 'r-', 'k-', 'g-'}; % Simulating the pdf from two Gaussain Random Variables

for i = 1: length(s)
    X = s(i) + sigma.*randn(1,N); % Gaussian RV with mean=s and given sigma
    Y = 0 + sigma.*randn(1,N); %Gaussian RV with mean=0 and same sigma as X
    Z = X+1i*Y; 
    [val, bin] = hist(abs(Z), 1000); % PDF of generated Rayleigh Fading sample
    plot(bin, val/trapz(bin,val), plotStyle{i}); % Normalizing the pdf to match theoretical result
    
    % Trapz function gives the total area under the PDF curve. It is used
    % as the normalization factor
    
    hold on;
end

% Theoretical PDF computation
for i = 1:length(s)
    x = s(i);
    m1 = sqrt(x);
    m2 = sqrt(x*(x-1));
    r = 0:0.01:9;
    ss = sqrt(m1^2 + m2^2);
    x = r.*ss/(sigma^2);
    f = r./(sigma^2).*exp(-((r.^2 + ss^2)./(2*sigma^2))).*besseli(0,x);
    plot(r,f,plotStyle{i}, 'LineWidth', 2.5);
    legendInfo{i} = ['s = ' num2str(s(i))];
    title('Ricean Fading for various non-centrality Parameter');
    
    hold on
end

legend(legendInfo);

%% Conclusion

%{
    Hence, we can observe that Rician fading occurs when one of the paths,
    typically a line of sight signal or some strong reflection signals, is
    much stronger than the others. And we also get various graphs for
    various non-centtrality parameters as shown in above figure.
%}