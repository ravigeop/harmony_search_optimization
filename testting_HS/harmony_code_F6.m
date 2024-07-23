% Harmony Search Optimization for Sphere Function

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
objectiveFunction = @(x) sum(x.^2);

% Call Harmony Search
[bestSolution, bestFitness] = harmony_search(objectiveFunction, numVars, lb, ub, maxIter, harmonyMemorySize, hmCR, hmPAR, bw);

