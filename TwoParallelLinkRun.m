K = [1 5 15 50 100]; % Array of k values
KList = ["K=1", "K=5", "K=15", "K=50", "K=100"]; % Ensure correct formatting

numIterations = 99; % Number of iterations
results = zeros(numIterations, 10); % Initialize results to zeros

%% Loop 
for i = 1:numIterations
    for x = 1:length(K)
        results(i, x) = runTwoParallelLinkSim(K(x), (i / 100), 1000); % Simulated results
        results(i, x + 5) = K(x) / ((1 - (i / 100))^2); % Theoretical results
    end
end

%% Figure for all K
figure('Name', 'Parallel Series Link', 'NumberTitle', 'off');
set(gca, 'XTick', 1:numIterations); % Set x-ticks to match iterations

% Define colors for each K value
lineColors = lines(length(K)); % Generates distinct colors

% Plot theoretical results
hold on;
for x = 1:length(K)
    semilogy(1:numIterations, results(:, 6 + x - 1), 'LineWidth', 2, 'Color', lineColors(x,:)); % Plot theoretical results
end

% Plot simulated results as hollow circles with the same colors
for x = 1:length(K)
    scatter(1:numIterations, results(:, x), 'MarkerEdgeColor', lineColors(x,:), 'MarkerFaceColor', 'none', 'LineWidth', 1.5); % Hollow circles
end
hold off;

set(gca, 'yscale', 'log');
xlabel('Normalized Parameter (i/100)');
ylabel('Values');
title('Simulated vs Calculated Values for Different K');
legend(KList, 'Location', 'best');
grid on; % Adds grid for better readability

% Remove x-axis tick labels
set(gca, 'XTickLabel', []); % Clear x-tick labels

% Individual figures for each K
for i = 1:length(K)
    figure('Name', KList(i), 'NumberTitle', 'off');
    set(gca, 'XTick', 1:numIterations); % Set x-ticks to match iterations
    
    % Plot only the calculated results for the current K
    semilogy(1:numIterations, results(:, 6 + i - 1), 'LineWidth', 2, 'Color', lineColors(i,:)); % Plot calculated results for current K
    hold on;
    
    % Scatter plot only for the current K value as hollow circles with matching colors
    scatter(1:numIterations, results(:, i), 'MarkerEdgeColor', lineColors(i,:), 'MarkerFaceColor', 'none', 'LineWidth', 1.5); % Hollow circles
    hold off;
    
    set(gca, 'yscale', 'log');
    xlabel('Normalized Parameter (i/100)');
    ylabel('Values');
    title(['Results for ' KList(i)]);
    
    % Create a legend showing the relevant K value
    legend(KList(i), 'Calculated');
    grid on; % Adds grid for better readability
end
