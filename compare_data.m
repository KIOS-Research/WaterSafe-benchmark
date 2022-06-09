clear all;close all;clc
% Load data
load dataset
load simdata
simD = ans.logsout; clear ans;
time = 1:10000;
%%
sim.q1=simD{1}.Values.Data(2:end,1);
sim.q2=simD{2}.Values.Data(2:end,1);
sim.q3=simD{3}.Values.Data(2:end,1);
sim.q4=simD{4}.Values.Data(2:end,1);
sim.d1=simD{5}.Values.Data(2:end,1);
sim.d2=simD{6}.Values.Data(2:end,1);
sim.d3=simD{7}.Values.Data(2:end,1);
sim.d4=simD{8}.Values.Data(2:end,1);
sim.h1=simD{9}.Values.Data(2:end,1);
sim.h2=simD{10}.Values.Data(2:end,1);
sim.h3=simD{11}.Values.Data(2:end,1);
sim.h4=simD{12}.Values.Data(2:end,1);
clear simD

%% 
exp.q1=dataset{1, 1}{1, 2};
exp.q2=dataset{1, 1}{2, 2};
exp.q3=dataset{1, 1}{3, 2};
exp.q4=dataset{1, 1}{4, 2};
exp.d1=dataset{1, 1}{5, 2};
exp.d2=dataset{1, 1}{6, 2};
exp.d3=dataset{1, 1}{7, 2};
exp.d4=dataset{1, 1}{8, 2};
exp.h1=dataset{1, 3}{1, 2};
exp.h2=dataset{1, 3}{2, 2};
exp.h3=dataset{1, 3}{3, 2};
exp.h4=dataset{1, 3}{4, 2};
clear dataset

%% Plot Flows
figure 
subplot(4,1,1)
plot(time,exp.q1)
hold on 
plot(time,sim.q1)
grid on
% axis([0 100 -0.2 1])
title('Flow of T_1')
legend('Experiment','Simulation')

subplot(4,1,2)
plot(time,exp.q2)
hold on 
plot(time,sim.q2)
grid on
% axis([0 100 -0.2 1])
title('Flow of T_2')

subplot(4,1,3)
plot(time,exp.q3)
hold on 
plot(time,sim.q3)
grid on
% axis([0 100 -0.2 1])
title('Flow of T_3')

subplot(4,1,4)
plot(time,exp.q4)
hold on 
plot(time,sim.q4)
grid on
% axis([0 100 -0.2 1])
title('Flow of T_4')

%% Plot Levels
figure 
subplot(4,1,1)
plot(time,exp.h1)
hold on 
plot(time, sim.h1)
grid on
% axis([0 100 10 35])
title('Level of T_1')
legend('Experiment','Simulation')

subplot(4,1,2)
plot(time,exp.h2)
hold on 
plot(time, sim.h2)
grid on
% axis([0 100 10 35])
title('Level of T_2')

subplot(4,1,3)
plot(time,exp.h3)
hold on 
plot(time, sim.h3)
grid on
% axis([0 100 10 25])
title('Level of T_3')

subplot(4,1,4)
plot(time,exp.h4)
hold on 
plot(time, sim.h4)
grid on
% axis([0 100 10 25])
title('Level of T_4')

%% Plot Demands
% figure 
% subplot(4,1,1)
% plot(time,exp.d1)
% hold on 
% plot(time, sim.d1)
% grid on
% % axis([0 100 0.003 0.05])
% title('Demand T_1')
% legend('Experiment','Simulation')
% 
% subplot(4,1,2)
% plot(time,exp.d2)
% hold on 
% plot(time, sim.d2)
% grid on
% % axis([0 100 0.003 0.05])
% title('Demand T_2')
% 
% subplot(4,1,3)
% plot(time,exp.d3)
% hold on 
% plot(time, sim.d3)
% grid on
% % axis([0 100 0.003 0.05])
% title('Demand T_3')
% 
% subplot(4,1,4)
% plot(time,exp.d4)
% hold on 
% plot(time, sim.d4)
% grid on
% % axis([0 100 0.003 0.05])
% title('Demand T_4')