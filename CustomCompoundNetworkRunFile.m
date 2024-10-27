
K = [1 5 10]; % array of k values
results = ones(99,18); % results of simulated and calculated values

%% Loop section
% loops from 1 percent to 99 percent
% Gets results for k and specific p calues
for i=1:+1:99
   
    %% Loop
    % Gets results for 
    % p1=10%, p2=60%, p3=1%-99%
    for x=1:+1:3 
    results(i,x) = runCustomCompoundNetworkSim(K(x), 0.1, 0.6, i/100, 1000); 
    end

    %% Loop
    % Gets results for 
    %p1=60%, p2=10%, p3=1%-99%
    for x=4:+1:6 
    results(i,x) = runCustomCompoundNetworkSim(K(x-3), 0.6, 0.1, i/100, 1000);
    end

    %% Loop
    % Gets results for 
    % p1=100%, p2=1%-99%, p3=60%
    for x=7:+1:9 
    results(i,x) = runCustomCompoundNetworkSim(K(x-6), 0.1, i/100, 0.6, 1000);
    end

    %% Loop
    % Gets results for 
    % p1=60%, p2=1%-99%, p3=10%
    for x=10:+1:12
    results(i,x) = runCustomCompoundNetworkSim(K(x-9), 0.6, i/100, 0.1, 1000);
    end

    %% Loop
    % Gets results for 
    % p1=1%-99%, p2=10%, p3=60%
    for x=13:+1:15
    results(i,x) = runCustomCompoundNetworkSim(K(x-12), i/100, 0.1, 0.6, 1000);
    end

    %% Loop
    % Gets results for 
    % p1=1%-99%, p2=60%, p3=10%
    for x=16:+1:18
    results(i,x) = runCustomCompoundNetworkSim(K(x-15), i/100, 0.6, 0.1, 1000);
    end
end

%% Figure 
% Creates a figure with simulated and calculated values for k
% All K and calculated results included

%Figure 1
figure('Name','Figure 1','NumberTitle','off');
set(gca,'XTickLabel',0:.05:1);
scatter((1:99)/100,results(:,1:3))
set(gca, 'yscale', 'log')
legend('K = 1','K = 5','K = 10')


%Figure 2
figure('Name','Figure 2','NumberTitle','off');
set(gca,'XTickLabel',0:.05:1);
scatter((1:99)/100,results(:,4:6))
set(gca, 'yscale', 'log')
legend('K = 1','K = 5','K = 10')

% Figure 3
figure('Name','Figure 3','NumberTitle','off');
set(gca,'XTickLabel',0:.05:1);
scatter((1:99)/100,results(:,7:9))
set(gca, 'yscale', 'log')
legend('K = 1','K = 5','K = 10')

% Figure 4
figure('Name','Figure 4','NumberTitle','off');
set(gca,'XTickLabel',0:.05:1);
scatter((1:99)/100,results(:,10:12))
set(gca, 'yscale', 'log')
legend('K = 1','K = 5','K = 10')

% Figure 5
figure('Name','Figure 5','NumberTitle','off');
set(gca,'XTickLabel',0:.05:1);
scatter((1:99)/100,results(:,13:15))
set(gca, 'yscale', 'log')
legend('K = 1','K = 5','K = 10')

% Figure 6
figure('Name','Figure 6','NumberTitle','off');
set(gca,'XTickLabel',0:.05:1);
scatter((1:99)/100,results(:,16:18))
set(gca, 'yscale', 'log')
legend('K = 1','K = 5','K = 10')