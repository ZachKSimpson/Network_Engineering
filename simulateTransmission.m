K = [1 5 15 50 100]; % array of k values
KList = ["K=1" "K=5" "K=15" "K=50" "K=100"]

results = ones(99,10); % results of simulated and calculated values

%% Loop 
% loops from 1 to 99
% Gets calculated and simulated results
for i=1:+1:99
   for x = 1:+1:5
        results((i),x) = runSingleLinkSim(K(x),(i/100),1000);
	    results((i),(x + 5)) = K(x)/(1- (i/100));
   end
end

%% Figure 
% Creates a figure with simulated and calculated values for k
% All K and calculated results included
figure('Name','Single Link','NumberTitle','off');
set(gca,'XTickLabel',0:.05:1);
semilogy(1:99,results(:,6:10)) 
hold on
scatter(1:99,results(:,1:5))
hold off
set(gca, 'yscale', 'log')
legend('K = 1','K = 5','K = 15','K = 50','K = 100')

for i = 1:+1:5
        figure('Name', KList(i) ,'NumberTitle','off');
        set(gca,'XTickLabel',0:.05:1);
        semilogy(1:99,results(:,6:10)) 
        hold on
        scatter(1:99,results(:,1:5))
        hold off
        set(gca, 'yscale', 'log')
        legend(KList(i))
end

