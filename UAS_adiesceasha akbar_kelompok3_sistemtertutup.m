clc;
clear;

% Parameter motor
R = 0.5;
L = 0.0003;
J = 0.0005;
B = 0.0032;
Kt = 0.0620;
Ke = 0.0620;

% Transfer function G(s)
num = [Kt];
den = [L*J, (L*B + R*J), (R*B + Ke*Kt)];
G = tf(num, den);

% Hasil tuning PID dari PID Tuner
Kp = 0.14369;
Ki = 3.0989;
Kd = 0;

C = pid(Kp, Ki, Kd);

% Sistem tertutup
T = feedback(C*G, 1);

% Simulasi respons
step(T);
grid on;
title('Respons Step Sistem Motor DC + PID');

% Output info
info = stepinfo(T);
disp('=== Karakteristik Sistem Tertutup ===');
disp(info);
