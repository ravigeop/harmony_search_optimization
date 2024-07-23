clc; clear; close all;
% Harmony Search Optimization for Griewank's Function

% Problem Definition
numVars = 5;               % Number of Decision Variables
lb = -10 * ones(numVars, 1); % Lower Bound of Variables
ub = 10 * ones(numVars, 1);  % Upper Bound of Variables

% Harmony Search Parameters
maxIter = 10000;            % Maximum Number of Iterations
harmonyMemorySize = 20;    % Harmony Memory Size
hmCR = 0.9;                % Harmony Memory Consideration Rate
hmPAR = 0.3;               % Pitch Adjustment Rate
bw = 1.5;                  % Bandwidth

% Objective Function
objectiveFunction = @(x)easom(x);

% Call Harmony Search

    [bestSolution, bestFitness] = harmony_search(objectiveFunction, numVars, lb, ub, maxIter, harmonyMemorySize, hmCR, hmPAR, bw);

% Griewank's Function
function z = easom(x)
    % Easom function implementation
    z = -cos(x(1)) * cos(x(2)) * exp(-(x(1) - pi)^2 - (x(2) - pi)^2);
end
