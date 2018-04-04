

bandwidth = 'CBW40';
model = 'Model-D';
distance = 20;
rounds = 1;
func1 = @simulate_extended_algorithm;
func2 = @simulate_basic_algorithm;
func3 = @simulate_original_algorithm;

figure

throughput = [];
ber = [];
mcs = [];

snr = [];
for i = 1:rounds
    [t, b, m, s] = func1(bandwidth, model, distance);

    throughput = [throughput;t];
    ber = [ber;b];
    mcs = [mcs;m];
    snr = [snr;s];
end
if rounds ~= 1
    throughput = mean(throughput);
    ber = mean(ber);
    mcs = mean(mcs);
    snr = mean(snr);
end

subplot(2, 3, 1);
title("Throughput");
%yyaxis left;
plot(throughput);
hold on;
plot([0, 100], [mean(throughput) mean(throughput)]);
%yyaxis right;
%plot(find(ber==0),ber(ber==0),'x') 
%hold on; 
%stem(find(ber>0),ber(ber>0),'or') 

subplot(2, 3, 4);
title("MCS");
yyaxis left;
plot(mcs);
yyaxis right;
plot(snr);

return;

throughput = [];
ber = [];
mcs = [];
snr = [];
for i = 1:rounds
    [t, b, m, s] = func2(bandwidth, model, distance);
    throughput = [throughput;t];
    ber = [ber;b];
    mcs = [mcs;m];
    snr = [snr;s];
end
if rounds ~= 1
    throughput = mean(throughput);
    ber = mean(ber);
    mcs = mean(mcs);
    snr = mean(snr);
end

subplot(2, 3, 2);
title("Throughput");
plot(throughput);
hold on;
plot([0, 100], [mean(throughput) mean(throughput)]);

subplot(2, 3, 5);
title("MCS");
yyaxis left;
plot(mcs);
yyaxis right;
plot(snr);



throughput = [];
ber = [];
mcs = [];
snr = [];
for i = 1:rounds
    [t, b, m, s] = func3(bandwidth, model, distance);
    throughput = [throughput;t];
    ber = [ber;b];
    mcs = [mcs;m];
    snr = [snr;s];
end
if rounds ~= 1
    throughput = mean(throughput);
    ber = mean(ber);
    mcs = mean(mcs);
    snr = mean(snr);
end

subplot(2, 3, 3);
title("Throughput");
plot(throughput);
hold on;
plot([0, 100], [mean(throughput) mean(throughput)]);

subplot(2, 3, 6);
title("MCS");
yyaxis left;
plot(mcs);
yyaxis right;
plot(snr);
