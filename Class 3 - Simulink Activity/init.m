clear all
close all

%% Parametri quadricottero
b  = 72e-6;    % [Ns2] coefficiente di trazione
d  = 1.1e-5;   % [Nms2] coefficiente di resistenza
g  = 9.80665;  % [ms2] accelerazione di gravità
Ix = 1e-3;     % [kgm2] momento principale di inerzia asse X_B
Iy = 1e-3;     % [kgm2] momento principale di inerzia asse Y_B
Iz = 2e-3;     % [kgm2] momento principale di inerzia asse Z_B
l  = 0.12;     % [m] distanza tra il centro di gravità ed il centro delle eliche
m  = 0.46;      % [kg] massa dell’elicottero quadrirotore
Jm = 3.4e-5;   % [kgm2] inerzia motore Jm ridotta all’albero

param = [b, d, g, Ix, Iy, Iz, l, m, Jm];

T2AV = 31.5; %Throttle2AngularVelocity constant for 

%% Drag Force 
Cd = 1; % [] Drag coefficient, it depends on the shape of the object. 1 is approximate to a cube coeeficient
p = 1.225; % [kg/m3] density of the fluid, on this case the fluid is the air
Ar = 0.250*0.106 % (0.0265) [m2] Reference area of the drone with Theta (pitch) and Phi (roll) zero
Ar2 = 2*0.020*0.200 + 0.055*0.055  % (0.0110) [m2] Reference area of the drone with Theta or Phi 90º

%% Parametri sistema di controllo
Rx     = 10/g*tf([1 1],[0.01 1]);
Ry     = -10/g*tf([1 1],[0.01 1]);
Rz     = 80*tf([0.25 1],[0.0025 1]);
Rphi   = 0.8*tf([0.25 1],[0.0025 1]);
Rtheta = 0.8*tf([0.25 1],[0.0025 1]);
Rpsi   = 1.6*tf([0.25 1],[0.0025 1]);
