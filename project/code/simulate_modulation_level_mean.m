function [throughputAvg, berAvg, outputX] = simulate_modulation_level_mean(bw, mcs, iterations)

    throughputs = [];
    bers = [];
    for i = 1:iterations
        [throughput, ber, outputX] = simulate_modulation_level(bw, mcs);
        throughputs = [throughputs;throughput];
        bers = [bers;ber];
    end

    throughputAvg = mean(throughputs);
    berAvg = mean(bers);
end

