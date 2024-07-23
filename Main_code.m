clc; clear; close all;
global one_composite_trace Model_composite Wavelet
 for i=1:50
objectiveFunction = @Objective_function;
 Seismic = read_segy_file('blackfoot_seismic.sgy',{'times',600,800},{'traces',1:1:50});
 one_composite_trace = Seismic.traces(:, i);
  Model = read_segy_file('Export_Strata_Model_as_volume_P-Impedance.sgy',{'times',600,800},{'traces',1:1:50});
 Model_composite = Model.traces(:, i);
  wavelet = read_segy_file('statistical_wavelet.sgy');
 Wavelet = wavelet.traces;
lb = Model_composite-1500; % Lower Bound of Variables
ub = Model_composite+1500;% Upper Bound of Variables
numberOfVariables = 101; % Number of sample point
maxIter = 1000;
harmonyMemorySize = 10;
hmCR = 0.9;
hmPAR = 0.3;
bw = 0.01;
MaxIter_Data=20;   
% Run harmony search algorithm
[bestSolution, bestFitness] = harmony_search(objectiveFunction , numberOfVariables, lb, ub, maxIter, harmonyMemorySize, hmCR, hmPAR, bw);
AI_inverted(:,i) = bestSolution;
Traces = i+1
save HS_inverted_impedance.txt AI_inverted -ascii
 end