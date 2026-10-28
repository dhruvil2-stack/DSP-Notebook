clc; clear; close all;

%%Week 1 of learning more about DSP
%Project for day 1 is to just write a simple line of code
%About plotting and creating a 1Khz sine wave sampled at 48Khz for 10ms
%Will be plotted using stem and plot functions

f = 1000; %This is the signals frequency of 1Khz

t = linspace(0,0.010, 10000);%This is the continuous time signal

f_samp = 48000; %This is the sampling rate at which the sine signal will be measured at

t_samp = 0:(1/f_samp):0.010; %This is the duration of the sample and signal and step size
%Step size of 2.08333333E-5 was determined by the equation 1/f_samp = step

sig = 1*sin(2*pi*f*t); % Continous time signal with frequency 1Khz and draw with 10000 points between 0 and 10ms

sig_samp = 1*sin(2*pi*f*t_samp); %Sampeled discrete signal which is sampeled at a rate of 48Khz over time t_samp with 1/f_samp steps between them

x_upperLIM = 0.0010;

figure('Name','Day 01 - 1Khz sine sampeled at 48Khz','Color','White');
subplot(2,1,1);
plot(t,sig);
grid on;
xlabel('t (s)')
xlim([0 x_upperLIM]);
ylabel('Sin(2\pi\cdot1000\cdott)')
title('Plot of a 1Khz sinusoid signal over a duration of 10ms')

subplot(2,1,2);
stem(t_samp,sig_samp, 'filled');
grid on;
xlabel('t (s)');
xlim([0 x_upperLIM]);
ylabel('Amplitude');
title('Plot of the samples amplitude taken at a step calculated by 1/f_samp')

disp(['Number of Samples in t_samp: ',num2str(length(t_samp))]);
disp(['Samples per cycle: ',num2str(f_samp/f)]);
disp(['Sample Spacing in us: ', num2str((1/f_samp)*10^6,5)]);