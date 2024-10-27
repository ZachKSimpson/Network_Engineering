function result = runTwoSeriesLinkSim(K, p, N)
    % Check inputs for validity
    if K <= 0
        error('K must be a positive integer.');
    end
    if p < 0 || p > 1
        error('p must be between 0 and 1.');
    end
    if N <= 0
        error('N must be a positive integer.');
    end

    simResults = zeros(1, N); % Initialize to store simulation results

    for i = 1:N
        txAttemptCount = 0; % Transmission count
        pktSuccessCount = 0; % Number of packets successfully transmitted

        while pktSuccessCount < K
            r1 = rand; % Generate random number for link 1
            r2 = rand; % Generate random number for link 2
            txAttemptCount = txAttemptCount + 1; % Count attempt

            % If either link fails (r1 < p or r2 < p), retry
            while r1 < p || r2 < p
                r1 = rand; % Retry for link 1
                r2 = rand; % Retry for link 2
                txAttemptCount = txAttemptCount + 1; % Count additional attempt
            end

            pktSuccessCount = pktSuccessCount + 1; % Count this packet as successful
        end

        simResults(i) = txAttemptCount; % Record total attempts for this simulation
    end

    result = mean(simResults); % Return average number of attempts
end
