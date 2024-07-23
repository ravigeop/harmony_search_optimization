% Harmony Search Optimization for Ackley's Function

% Problem Definition
numVars = 5;               % Number of Decision Variables
lb = -32.768 * ones(numVars, 1); % Lower Bound of Variables
ub = 32.768 * ones(numVars, 1);  % Upper Bound of Variables

% Harmony Search Parameters
maxIter = 10000;            % Maximum Number of Iterations
harmonyMemorySize = 20;    % Harmony Memory Size
hmCR = 0.9;                % Harmony Memory Consideration Rate
hmPAR = 0.3;               % Pitch Adjustment Rate
bw = 1.5;                  % Bandwidth

% Objective Function
objectiveFunction = @(x) ackley(x);

% Call Harmony Search
[bestSolution, bestFitness] = harmony_search(objectiveFunction, numVars, lb, ub, maxIter, harmonyMemorySize, hmCR, hmPAR, bw);


% Ackley's Function
function z = ackley(x)
    n = length(x);
    term1 = -20 * exp(-0.2 * sqrt(sum(x.^2) / n));
    term2 = exp(sum(cos(2 * pi * x)) / n);
    z = term1 - term2 + 20 + exp(1);
end
