K = [1 5 15 50 100]; % Array of k values
KList = ["K=1", "K=5", "K=15", "K=50", "K=100"]; % Labels for legend
numIterations = 99; % Number of iterations
numK = length(K); % Number of K values

results = zeros(numIterations, 10); % Initialize results array

% Assign distinct colors that are less intense but have good contrast
colorsCalc = [0, 0.447, 0.741; 0, 0.5, 0; 0.3, 0.3, 0.3; 0.25, 0.25, 0.75; 0.1, 0.6, 0.3]; % Subdued colors for calculated lines
colorsSim = [0.85, 0.33, 0.1; 0.494, 0.184, 0.556; 0.929, 0.694, 0.125; 0.635, 0.078, 0.184; 0.301, 0.745, 0.933]; % Darker, muted colors for simulated markers

%% Loop 
for i = 1:numIterations
    for x = 1:numK
        results(i, x) = runSingleLinkSim(K(x), (i / 100), 1000); % Simulated results
        results(i, x + 5) = K(x) / (1 - (i / 100)); % Calculated results
    end
end

%% Figure for all K
figure('Name', 'Single Link', 'NumberTitle', 'off');
set(gca, 'XTick', 1:numIterations, 'XTickLabel', linspace(0, 1, numIterations));

plotHandles = []; % Array to store plot handles for the legend
for x = 1:numK
    % Plot calculated values with a subdued color as a solid line
    hCalc = plot(1:numIterations, results(:, 5 + x), '-', 'Color', colorsCalc(x,:), 'LineWidth', 1.5); 
    hold on;
    plotHandles = [plotHandles, hCalc]; % Store handle for calculated line
    
    % Plot simulated values with a muted color as larger hollow circles
    hSim = plot(1:numIterations, results(:, x), 'o', 'MarkerSize', 6, 'MarkerFaceColor', 'none', ...
                'MarkerEdgeColor', colorsSim(x,:), 'LineWidth', 1.2);
    plotHandles = [plotHandles, hSim]; % Store handle for simulated hollow circles
end

hold off;
set(gca, 'yscale', 'log');
xlabel('Normalized Parameter (i/100)');
ylabel('Values');
title('Simulated vs Calculated Values for Different K');

% Create legend labels
legendLabels = [strcat("Calculated ", cellstr(KList)), strcat("Simulated ", cellstr(KList))];
legend(plotHandles, legendLabels, 'Location', 'best');
grid on;

%% Individual figures for each K
for i = 1:numK
    figure('Name', KList(i), 'NumberTitle', 'off');
    set(gca, 'XTick', 1:numIterations, 'XTickLabel', linspace(0, 1, numIterations));
    
    % Plot calculated values for the current K as a solid line with subdued color
    calcPlot = plot(1:numIterations, results(:, 5 + i), '-', 'Color', colorsCalc(i,:), 'LineWidth', 1.5);
    hold on;
    
    % Plot simulated values with a muted, contrasting color as larger hollow circles
    simPlot = plot(1:numIterations, results(:, i), 'o', 'MarkerSize', 6, 'MarkerFaceColor', 'none', ...
                   'MarkerEdgeColor', colorsSim(i,:), 'LineWidth', 1.2);
    hold off;
    
    set(gca, 'yscale', 'log');
    xlabel('Normalized Parameter (i/100)');
    ylabel('Values');
    title(['Simulated and Calculated Results for ' KList(i)]);
    
    % Create a legend showing both simulated and calculated results for the current K
    legend([calcPlot, simPlot], {['Calculated ' char(KList(i))], ['Simulated ' char(KList(i))]}, 'Location', 'best');
    grid on; % Adds grid for better readability
end
