clc; clear; close all;
F_1=load('best_fitness_per_iteration_F1.txt');
F_2=load('best_fitness_per_iteration_F2.txt');
F_3=load('best_fitness_per_iteration_F3.txt');
F_4=load('best_fitness_per_iteration_F4.txt');
F_5=load('best_fitness_per_iteration_F5.txt');
F_6=load('best_fitness_per_iteration_F6.txt');
figure
subplot(2,3,1)
plot(F_1(:,1),F_1(:,2),'r')
grid on 
grid minor
ylabel('GLobal minima')
xlabel('Iteration')
title('Ackley Function');
subplot(2,3,2)
plot(F_2(:,1),F_2(:,2),'r')
grid on 
grid minor
ylabel('GLobal minima')
xlabel('Iteration')
title('Easom Function');
subplot(2,3,3)
plot(F_3(:,1),F_3(:,2),'r')
grid on 
grid minor
ylabel('GLobal minima')
xlabel('Iteration')
title('Weierstrass Function');
subplot(2,3,4)
plot(F_4(:,1),F_4(:,2),'r')
grid on 
grid minor
ylabel('GLobal minima')
xlabel('Iteration')
title('Rastrigin Function');
subplot(2,3,5)
plot(F_5(:,1),F_5(:,2),'r')
grid on 
grid minor
ylabel('GLobal minima')
xlabel('Iteration')
title('Rosenbrock Function');
subplot(2,3,6)
plot(F_6(:,1),F_6(:,2),'r')
grid on 
grid minor
title('Sphere Function');
ylabel('GLobal minima')
xlabel('Iteration')
% Create an invisible axes that covers the entire figure
axes('Position',[0 0 1 1],'Visible','off');

% Add a common title to the invisible axes
text(.5, .98,'Variation of best f(x) with iterations','HorizontalAlignment','center','VerticalAlignment','top','FontSize',12);