function [bestSolution, bestFitness] = harmony_search(objectiveFunction, numVariables, lb, ub, maxIter, harmonyMemorySize, hmCR, hmPAR, bw)
    % Harmony Search algorithm for optimization problems
    % Inputs:
    %   objectiveFunction: function handle to the objective function
    %   numVariables: number of decision variables
    %   lb: lower bounds for decision variables
    %   ub: upper bounds for decision variables
    %   maxIter: maximum number of iterations
    %   harmonyMemorySize: size of the harmony memory
    %   hmCR: harmony memory considering rate
    %   hmPAR: pitch adjusting rate
    %   bw: bandwidth for pitch adjustment
    % Outputs:
    %   bestSolution: best solution found
    %   bestFitness: fitness value of the best solution

    % Initialize harmony memory
    harmonyMemory = (repmat(lb + (ub - lb) .* rand(harmonyMemorySize, numVariables), harmonyMemorySize, 1));

    % Evaluate initial harmony memory
    harmonyFitness = zeros(harmonyMemorySize, 1);
    for i = 1:harmonyMemorySize
        harmonyFitness(i) = objectiveFunction(harmonyMemory(i, :));
    end

    % Main loop
    for iter = 1:maxIter
        % Improvisation
        newHarmony = zeros(1, numVariables);
        for j = 1:numVariables
            if rand() < hmCR
                % Use memory consideration
                if rand() < hmPAR
                    index = randi([1, harmonyMemorySize]);
                    newHarmony(j) = harmonyMemory(index, j);
                else
                    newHarmony(j) = lb(j) + (ub(j) - lb(j)) * rand();
                end
            else
                % Use randomization
                newHarmony(j) = lb(j) + (ub(j) - lb(j)) * rand();
            end
            % Pitch adjustment
            if rand() < bw
                newHarmony(j) = newHarmony(j) + randn() * (ub(j) - lb(j));
                newHarmony(j) = min(max(newHarmony(j), lb(j)), ub(j));
            end
        end

        % Evaluate new harmony
        newFitness = objectiveFunction(newHarmony);

        % Update harmony memory if the new harmony is better
        [worstFit, idx] = max(harmonyFitness);
        if newFitness < worstFit
            harmonyMemory(idx, :) = newHarmony;
            harmonyFitness(idx) = newFitness;
        end
        

    % Find the best solution
    [bestFitness, bestIdx] = min(harmonyFitness);
    bestSolution = harmonyMemory(bestIdx, :);
        % Display error with iteration
        fprintf('Iteration %d, Best Fitness: %.4f\n', iter, bestFitness);
    end
end
