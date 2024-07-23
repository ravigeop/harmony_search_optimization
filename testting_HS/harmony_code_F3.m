clc; clear; close all;
% Harmony Search Optimization for Weierstrass Function

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

% Weierstrass Function Parameters
a = 0.5;
b = 3;
K = 20;

% Objective Function
objectiveFunction = @(x) weierstrass(x, a, b, K);

% Call Harmony Search
[bestSolution, bestFitness] = harmony_search(objectiveFunction, numVars, lb, ub, maxIter, harmonyMemorySize, hmCR, hmPAR, bw);


% Weierstrass Function
function z = weierstrass(x, a, b, K)
    n = length(x);
    term1 = 0;
    for i = 1:n
        sum1 = 0;
        for k = 0:K
            sum1 = sum1 + a^k * cos(2 * pi * b^k * (x(i) + 0.5));
        end
        term1 = term1 + sum1;
    end
    
    term2 = 0;
    for k = 0:K
        term2 = term2 + a^k * cos(2 * pi * b^k * 0.5);
    end
    
    z = term1 - n * term2;
end
