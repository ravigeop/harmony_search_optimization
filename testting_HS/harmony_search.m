function [bestSolution, bestFitness] = harmony_search(objectiveFunction, numVars, lb, ub, maxIter, harmonyMemorySize, hmCR, hmPAR, bw)
    % Initialize harmony memory (HM)
    HM = repmat(lb, 1, harmonyMemorySize) + rand(numVars, harmonyMemorySize) .* (repmat(ub, 1, harmonyMemorySize) - repmat(lb, 1, harmonyMemorySize));
    fitness = zeros(1, harmonyMemorySize);
    
    % Evaluate the fitness of initial harmonies
    for i = 1:harmonyMemorySize
        % Ensure the objective function output is scalar
        f = objectiveFunction(HM(:, i));
        if ~isscalar(f)
            error('Objective function must return a scalar value. Check the function implementation.');
        end
        fitness(i) = f;
    end
    
    % Find the best harmony in the memory
    [bestFitness, bestIndex] = min(fitness);
    bestSolution = HM(:, bestIndex);
    % Open a file to save the best fitness at each iteration
    fileID = fopen('best_fitness_per_iteration.txt', 'w');
    if fileID == -1
        error('Cannot open file for writing: best_fitness_per_iteration.txt');
    end
    
    % Main loop of the Harmony Search
    for iter = 1:maxIter
        % Create a new harmony
        newHarmony = zeros(numVars, 1);
        for i = 1:numVars
            if rand < hmCR
                % Memory consideration
                index = randi(harmonyMemorySize);
                newHarmony(i) = HM(i, index);
                if rand < hmPAR
                    % Pitch adjustment
                    newHarmony(i) = newHarmony(i) + bw * (rand - 0.5);
                end
            else
                % Random selection
                newHarmony(i) = lb(i) + rand * (ub(i) - lb(i));
            end
            
            % Ensure the new harmony is within bounds
            newHarmony(i) = max(min(newHarmony(i), ub(i)), lb(i));
        end
        
        % Evaluate the new harmony
        newFitness = objectiveFunction(newHarmony);
        
        % Update the harmony memory if the new harmony is better than the worst harmony
        [worstFitness, worstIndex] = max(fitness);
        if newFitness < worstFitness
            HM(:, worstIndex) = newHarmony;
            fitness(worstIndex) = newFitness;
            
            % Update the best harmony if the new harmony is the best
            if newFitness < bestFitness
                bestFitness = newFitness;
                bestSolution = newHarmony;
            end
        end
        % Save the best fitness of the current iteration to the file
        fprintf(fileID, 'Iteration %d: Best Fitness = %f\n', iter, bestFitness);
        
        % Display iteration and error
        disp(['Iteration ', num2str(iter), ': Best Fitness = ', num2str(bestFitness)]);
    end
end
