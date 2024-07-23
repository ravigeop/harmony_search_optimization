clc; clear; close all;
% Harmony Search Optimization for Rastrigin's Function

% Problem Definition
numVars = 5;               % Number of Decision Variables
lb = -5 * ones(numVars, 1); % Lower Bound of Variables
ub = 5 * ones(numVars, 1);  % Upper Bound of Variables

% Harmony Search Parameters
maxIter = 10000;            % Maximum Number of Iterations
harmonyMemorySize = 20;    % Harmony Memory Size
hmCR = 0.9;                % Harmony Memory Consideration Rate
hmPAR = 0.3;               % Pitch Adjustment Rate
bw = 1.5;                  % Bandwidth

% Objective Function
objectiveFunction = @(x)  rosenbrock(x);

% Call Harmony Search
[bestSolution, bestFitness] = harmony_search(objectiveFunction, numVars, lb, ub, maxIter, harmonyMemorySize, hmCR, hmPAR, bw);


% Rosenbrock's Function
function z = rosenbrock(x)
    n = length(x);
    z = 0;
    for i = 1:(n-1)
        z = z + 100 * (x(i+1) - x(i)^2)^2 + (1 - x(i))^2;
    end
end


