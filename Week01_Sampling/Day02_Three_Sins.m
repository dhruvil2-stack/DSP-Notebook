clc; clear; close all;
%%Day 02: We will now combine sinusoids of multiple frequencies and
%play that sound to see how superpositioning three sinusoids affects the
%Amplitude and sound of it

t_cont = linspace(0, 1, 300000); %Time for continous signal, 300,000 points over 1s (300,000 points per second, only used to draw a smooth curve)

f_1 = 500; %frequency of signal 1
f_2 = 1200; %frequency of signal 2
f_3 = 3000; %frequency of signal 3

%Superpositioned signal of f_1,2,3 over time t

super_pos = 1*sin(2*pi*f_1*t_cont)+1*sin(2*pi*f_2*t_cont)+1*sin(2*pi*f_3*t_cont);

%The fundamental frequency of this signal is the GCD(f_1,f_2,f_3)=100Hz
%so the sum repeats every 1/100Hz = 10ms
%Thus the sampling frequency must be f_samp >= 2*f_max <=> f_samp >=
%2*3000, so as long as f_samp > 6000Hz, there should be no aliasing, thus
%lets choose f_samp = 48Khz, which is a standard rate that the sound card supports

f_samp = 48000; %Sampling Frequency

t_samp = 0:(1/f_samp):1; %Sampling times, 1/f_samp seconds between each sample, from 0 to 1s

%Same superpositioned signal as the one above, this just takes the values
%at the sampling time only

super_pos_SAMP = 1*sin(2*pi*f_1*t_samp)+1*sin(2*pi*f_2*t_samp)+1*sin(2*pi*f_3*t_samp);


figure('Name','Day 02 - Three sines at 500, 1200 and 3000 Hz','Color','White');
plot(t_cont,super_pos); %Smooth reference curve of the superpositioned signal
grid on;
hold on;
stem(t_samp,super_pos_SAMP,'filled'); %Samples taken at 48Khz, the tops of the stems should land on the curve
xlabel('t (s)');
xlim([0 0.002]); %Zoom into the first 2ms, otherwise the plot is just a solid block
ylabel('Amplitude');
legend('Continuous signal','Samples at 48Khz');
title('Sum of three sinusoids (500Hz + 1200Hz + 3000Hz) sampled at 48Khz');

super_pos_SAMP_scaled = super_pos_SAMP / 3;   % Done to avoid cliping as sound only plays sounds with an amplitude of +-1

sound(super_pos_SAMP_scaled,f_samp); %The rate here must match the rate the signal was built at (f_samp), otherwise pitch and duration change

disp(['Peak before scaling: ', num2str(max(abs(super_pos_SAMP)))])
disp(['Peak after scaling: ', num2str(max(abs(super_pos_SAMP_scaled)))])