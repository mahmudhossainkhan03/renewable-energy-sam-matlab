% =========================================================================
% MATLAB Script: Transfer Function Response & Control System Analysis
% Author: Mahmud Hossain Khan
% Description: Evaluates open-loop and closed-loop step responses, pole-zero 
%              maps, and system stability margins for mechanical control loops.
% =========================================================================

clear; clc; close all;

% --- 1. Define Plant Transfer Function ---
% Example second-order mechanical system: G(s) = 25 / (s^2 + 4s + 25)
num = [25];
den = [1, 4, 25];
G = tf(num, den);

disp('--- Plant Transfer Function G(s) ---');
display(G);

% --- 2. Step Response Analysis ---
figure('Name', 'System Step Response', 'Color', 'w');
step(G);
grid on;
title('Uncompensated System Step Response');
xlabel('Time (seconds)');
ylabel('Amplitude / Output');

% --- 3. Pole-Zero Map Evaluation ---
figure('Name', 'Pole-Zero Map', 'Color', 'w');
pzmap(G);
grid on;
title('Pole-Zero Map of Plant Model');

% --- 4. Closed-Loop Controller Integration (PID Tuning) ---
% Implementing a basic PID controller C(s) = Kp + Ki/s + Kd*s
C = pid(2.0, 1.0, 0.5);
T = feedback(C*G, 1);

figure('Name', 'Closed-Loop PID Step Response', 'Color', 'w');
step(T);
grid on;
title('Closed-Loop Step Response with PID Controller');
xlabel('Time (seconds)');
ylabel('Controlled Output');
