%% Function runSingleLinkSim (Appendix A)
% Simulate the average number of transmissions for K packets with a success probability of p
function result = runSingleLinkSim(K, p, N)

    simResults = ones(1, N); % Preallocate the results of each simulation
    
    for i = 1:N
        txAttemptCount = 0; % Transmission attempt counter
        pktSuccessCount = 0; % Packet success counter
        
        while pktSuccessCount < K
            r = rand; % Generate random number to check transmission success
            txAttemptCount = txAttemptCount + 1; % Increment transmission attempts
            
            % Retry transmission while packet transmission is not successful (r < p)
            while r < p
                r = rand; % Generate new success check value
                txAttemptCount = txAttemptCount + 1; % Count additional attempt
            end
            
            pktSuccessCount = pktSuccessCount + 1; % Packet was successfully transmitted
        end
        
        simResults(i) = txAttemptCount; % Record the total number of attempts
    end

    % Compute the average number of transmission attempts across all simulations
    result = mean(simResults);
end
