clc; clear; close all;
% Harmony Search Optimization for Rastrigin's Function

% Problem Definition
numVars = 5;               % Number of Decision Variables
lb = -5.12 * ones(numVars, 1); % Lower Bound of Variables
ub = 5.12 * ones(numVars, 1);  % Upper Bound of Variables

% Harmony Search Parameters
maxIter = 10000;            % Maximum Number of Iterations
harmonyMemorySize = 20;    % Harmony Memory Size
hmCR = 0.9;                % Harmony Memory Consideration Rate
hmPAR = 0.3;               % Pitch Adjustment Rate
bw = 1.5;                  % Bandwidth

% Objective Function
objectiveFunction = @(x) rastrigin(x);

% Call Harmony Search
[bestSolution, bestFitness] = harmony_search(objectiveFunction, numVars, lb, ub, maxIter, harmonyMemorySize, hmCR, hmPAR, bw);


% Rastrigin's Function
function z = rastrigin(x)
    n = length(x);
    z = 10 * n + sum(x.^2 - 10 * cos(2 * pi * x));
end
