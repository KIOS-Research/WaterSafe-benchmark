clear all; close all; clc;
%% constants 
% simulation time
sim_time=10000;%seconds
sim_step=1; %second

% Actuator subsystem 1
a_1= 0.107;
b_1=26.59;
c_1=-0.97;
% Actuator subsystem 2
a_2= 0.107;
b_2=26.59;
c_2=-0.97;
% Actuator subsystem 3
a_3= 0.107;
b_3=26.59;
c_3=-0.97;
% Actuator subsystem 4
a_4= 0.107;
b_4=26.59;
c_4=-0.97;
% Tank base area
A1=pi*(36/2)^2; %cm^2
A2=pi*(36/2)^2; %cm^2
A3=pi*(36/2)^2; %cm^2
A4=pi*(36/2)^2; %cm^2

%% Initial conditions
h10=21; % cm
h20=20; % cm
h30=17; % cm
h40=19; % cm
q10=0; % cm^3/sec
q20=0; % cm^3/sec
q30=0; % cm^3/sec
q40=0; % cm^3/sec

%% Fault parameters

% Leakage fault function 
theta_p_1=0.0; %tank 1
theta_p_2=0; %tank 2
theta_p_3=0.0; %tank 3
theta_p_4=0; %tank 4

% Leakage fault times
%tank-1
t_p_1_1=4000;
t_p_1_2=5000;
%tank-2
t_p_2_1=2000;
t_p_2_2=3000;
%tank-3
t_p_3_1=2000;
t_p_3_2=3000;
%tank-4
t_p_4_1=2000;
t_p_4_2=3000;

% Actuator fault function
theta_a_1=0.0; %tank 1
theta_a_2=0; %tank 2
theta_a_3=0; %tank 3
theta_a_4=0; %tank 4

% Actuator fault times
%tank-1
t_a_1_1=5500;
t_a_1_2=6300;
%tank-2
t_a_2_1=1000;
t_a_2_2=2000;
%tank-3
t_a_3_1=1000;
t_a_3_2=2000;
%tank-4
t_a_4_1=1000;
t_a_4_2=2000;

% Sensor fault function 
theta_s_1=0; %tank 1
theta_s_2=0; %tank 2
theta_s_3=0; %tank 3
theta_s_4=0; %tank 4
theta_s_1_2=0.0; % offset tank 1
theta_s_2_2=0; % offset tank 2
theta_s_3_2=0; % offset tank 3
theta_s_4_2=0; % offset tank 4

% Sensor fault times (sec)
%tank-1
t_s_1_1=1000;
t_s_1_2=2000;
%tank-2
t_s_2_1=2000;
t_s_2_2=3000;
%tank-3
t_s_3_1=2000; 
t_s_3_2=3000;
%tank-4
t_s_4_1=2000;
t_s_4_2=3000;

%% Demand pattern
load dataset
g=9.80; %m/s^2

% measured consumption
s1=dataset{1, 1}{5, 2}; s1=fillmissing(s1,'nearest');
s2=dataset{1, 1}{6, 2}; s2=fillmissing(s2,'nearest');
s3=dataset{1, 1}{7, 2}; s3=fillmissing(s3,'nearest');
s4=dataset{1, 1}{8, 2}; s4=fillmissing(s4,'nearest');

% consumption using demand valve setting
% s1=dataset{1, 4}{8, 2}; s1=fillmissing(s1,'previous');
% s2=dataset{1, 4}{9, 2}; s2=fillmissing(s2,'previous');
% s3=dataset{1, 4}{10, 2}; s3=fillmissing(s3,'previous');
% s4=dataset{1, 4}{11, 2}; s4=fillmissing(s4,'previous');

% orifice size parameter
gamma_1=2.5;
gamma_2=2.5;
gamma_3=2;
gamma_4=2;

%% PLC parameters
% Minimum and maximum thresholds of tanks (cm)
Ru_1=30;
Rl_1=20;

Ru_2=30;
Rl_2=16;

Ru_3=22;
Rl_3=16;

Ru_4=22.5;
Rl_4=15.7;

%% Simulate model and save data
sim WaterSafe.mdl
save('simdata', 'ans')

%% Compare real with simulated data
run compare_data.m

