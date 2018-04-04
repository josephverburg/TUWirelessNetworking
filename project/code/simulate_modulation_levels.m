% ----
% VHT options
% ----

% ChannelBandwidth
channelBandwiths = ["CBW20","CBW40","CBW80","CBW160"];

% 0	BPSK	1/2
% 1	QPSK	1/2
% 2	QPSK	3/4
% 3	16QAM	1/2
% 4	16QAM	3/4
% 5	64QAM	2/3
% 6	64QAM	3/4
% 7	64QAM	5/6
% 8	256QAM	3/4
% 9	256QAM	5/6
% MCS
mcsOptions = 0:8;

% ----
% TGAC options
% ----

% RandomStream
% for mt also provide 'Seed'
randomStreams = {'Global stream' 'mt19937ar with seed'};

% TransmitReceiveDistance
% in meters 1-20 ?
distances = 1:20;

% hold on;
% figure
x = 5:35/99:40;
% for bw = channelBandwiths
%     figure
%     disp(bw);
%     xlabel("SNR");
%     ylabel("Bandwith (Mb/s)");
%     for mcs = mcsOptions
%         [throughput, ber] = testSetting(bw, mcs);
%         plot(x, throughput);
%         hold on;
%         legend(num2str(mcs));
%         disp(['MCS: ' num2str(mcs)]);
%     end
%     savefig(strcat(bw, '.fig'));
% end


figure

disp('CBW20');
subplot(2, 2, 1);
xlabel("SNR");
ylabel("Bandwith (Mb/s)");
title("20 Mhz bandwith");
for mcs = 0:8
    [throughput, ber, x] = simulate_modulation_level_mean('CBW20', mcs, 10);
    plot(x, throughput);
    hold on;
    disp(['MCS: ' num2str(mcs)]);
end
legend("0", "1", "2", "3", "4", "5", "6", "7", "8");

hold off;
disp('CBW40');
subplot(2, 2, 2);
xlabel("SNR");
ylabel("Bandwith (Mb/s)");
title("40 Mhz bandwith");
for mcs = 0:9
    [throughput, ber, x] = simulate_modulation_level_mean('CBW40', mcs, 10);
    plot(x, throughput);
    hold on;
    disp(['MCS: ' num2str(mcs)]);
end
legend("0", "1", "2", "3", "4", "5", "6", "7", "8", "9");

hold off;
disp('CBW80');
subplot(2, 2, 3);
xlabel("SNR");
ylabel("Bandwith (Mb/s)");
title("80 Mhz bandwith");
for mcs = 0:9
    [throughput, ber, x] = simulate_modulation_level_mean('CBW80', mcs, 10);
    plot(x, throughput);
    hold on;
    disp(['MCS: ' num2str(mcs)]);
end
legend("0", "1", "2", "3", "4", "5", "6", "7", "8", "9");
hold off;
disp('CBW160');
subplot(2, 2, 4);
xlabel("SNR");
ylabel("Bandwith (Mb/s)");
title("160 Mhz bandwith");
for mcs = 0:9
    [throughput, ber, x] = simulate_modulation_level_mean('CBW160', mcs, 10);
    plot(x, throughput);
    hold on;
    disp(['MCS: ' num2str(mcs)]);
end
legend("0", "1", "2", "3", "4", "5", "6", "7", "8", "9");

savefig("bwsim.fig");
