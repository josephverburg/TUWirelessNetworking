

channelBandwiths = ["CBW20","CBW40","CBW80","CBW160"];
distances = [1 2 4 6 8 10 15 20];
models = ["Model-A","Model-B","Model-C","Model-D","Model-E","Model-F"];

bandwidth = 'CBW80';
model = 'Model-F';
distance = 20;
rounds = 10;
func1 = @simulate_extended_algorithm;
func2 = @simulate_basic_algorithm;
func3 = @simulate_original_algorithm;

figure
for bi = 1:4
    throughput1 = [];
    throughput2 = [];  
    throughput3 = [];  
    bandwidth = channelBandwiths(bi);
    for di = 1:6
        model = models(di);
        
        throughputs = [];
        for i = 1:rounds
            throughput = mean(func1(bandwidth, model, distance));
            throughputs = [throughputs;throughput];
        end
        disp(mean(throughputs));
        throughput1 = [throughput1;mean(throughputs)];
        
        throughputs = [];
        for i = 1:rounds
            throughput = mean(func2(bandwidth, model, distance));
            throughputs = [throughputs;throughput];
        end
        disp(mean(throughputs));
        throughput2 = [throughput2;mean(throughputs)];
        
        throughputs = [];
        for i = 1:rounds
            throughput = mean(func3(bandwidth, model, distance));
            throughputs = [throughputs;throughput];
        end
        disp(mean(throughputs));
        throughput3 = [throughput3;mean(throughputs)];
    end 
    disp(bandwidth);
    disp(num2str(throughput1));
    disp(num2str(throughput2));
    
    subplot(2, 2, bi);
    plot(1:6, throughput1);
    hold on;
    plot(1:6, throughput2);
    hold on;
    plot(1:6, throughput3);
    title(bandwidth);
    ylabel("Throughput (Mbps)");
    xlabel("Channel model");
    xticklabels({'A', 'B', 'C', 'D', 'E', 'F'});
    legend("Extended Algorithm", "Basic Algorithm", "Original Algorithm");
end

savefig("./figures/stepthree_all.fig")