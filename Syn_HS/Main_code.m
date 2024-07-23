clc; clear; close all;
global one_composite_trace Model_composite Wavelet
 for i=1:1
objectiveFunction = @Global_optimization_PS;
 Seismic = load('obs_501.mat');
 st= Seismic.synth_modeled(:, i);
%  one_composite_trace = awgn(st, 10, 'measured');
  one_composite_trace =  st;
  Model = read_segy_file('Export_Strata_Model_as_volume_P-Impedance.sgy',{'times',0,1000},{'traces',42:1:42});
 Model_composite = Model.traces(:, i);
step=2;
wavelet=s_create_wavelet({'type','Ricker'},{'step',step});
Wavelet = wavelet.traces;

% Generation_Data =10;
lb = Model_composite-1000;
ub = Model_composite+1000;
numberOfVariables = 501;
maxIter = 30000;
harmonyMemorySize = 501;
hmCR = 0.9;
hmPAR = 0.3;
bw = 0.01;
MaxIter_Data=20;   
% Run harmony search algorithm
[bestSolution, bestFitness] = harmony_search(objectiveFunction , numberOfVariables, lb, ub, maxIter, harmonyMemorySize, hmCR, hmPAR, bw);
%  options = optimoptions('patternsearch',  'Display', 'iter','MaxIter', MaxIter_Data);
%  [bestParameters_local, bestFitness_local] = fminunc(objectiveFunction, bestSolution, options);
AI_inverted(:,i) = bestSolution;
layer = i+1
save HS_inverted_impedance_11_05_2024_501.txt AI_inverted -ascii
 end