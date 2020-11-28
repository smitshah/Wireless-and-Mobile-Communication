%% Experiment 9: Maximum Likelihood Estimation

%{
     Name:- Smit Shah
     Date:- 26/10/2020
%}

% Tools/Software Required: MATLAB

%% Theory

%{
    In statistics, maximum likelihood estimation (MLE) is a method of estimating the parameters of a probability distribution by maximizing a likelihood function, so that under the assumed statistical model the observed data is most probable.

    The point in the parameter space that maximizes the likelihood function is called the maximum likelihood estimate. The logic of maximum likelihood is both intuitive and flexible, and as such the method has become a dominant means of statistical inference.
%}

%% Code and Result

clc %for clearing the command window
close all %for closing all the window except command window
clear all %for deleting all the variables from the memory

d = 410; % Number of bits in error
n = 90*10; % Total number of bits sent
k = n-d; % Number of Bits NOT in error
q = 0:0.002:1; % Range of success probability of test likelihood

y = binopdf(k,n,q); % Assuming binomial distribution

plot(q,y);
xlabel('Probability q');
ylabel('Likelihood');
title('Maximum Likelihood Estimation');
[maxY, maxIndex] = max(y); % Finding the max and it's index

disp(sprintf('MLE of q is %f', q(maxIndex))) % Print the probability corresponding to the max(y)

%% Conclusion

%{
    Hence, we can observe the maximum likelihood for the assumed binomial
    distribution.
%}