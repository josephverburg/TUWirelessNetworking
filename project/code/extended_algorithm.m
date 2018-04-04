function [mcs] = extended_algorithm(bandwidth, snrs, idx)

    MODE = 2;
    

    startIdx = max(idx - 5, 1);
    sub = snrs(startIdx:idx);
    x = find(sub>0);
    y = sub(x);
    if length(y) > 3
        if MODE == 1
            P = polyfit(x, y, 1);
            snr = P(1) * 6 + P(2);
            %disp([num2str(snr) ' ' num2str(y)]);
        elseif MODE == 2
            P = polyfit(x, y, 2);
            snr = P(1) * 6 * 6 + P(2) * 6 + P(3);
            %disp([num2str(snr) ' ' num2str(y)]);
        end
    elseif ~isempty(y)
        snr = y(length(y));
    else
        snr = 0;
    end
    
    %bandwidth_20_table = [0 12.27 16.31 18.74 22.78 26.82 28.03 32.47 33.69 -1];
    bandwidth_20_table = [0 12.27 16.31 17.12 22.78 26.01 28.5 32.47 33.69 -1];

    bandwidth_40_table = [0 10.25 15.51 17.12 22.78 24.39 29.65 30.05 33.69 35];
    
    bandwidth_80_table = [0 10.66 14 16.5 21.2 24.5 26.5 30 32 34];
    %bandwidth_80_table = [0 12.27 15 17 21 24.5 27 30 32 34];
    
    bandwidth_160_table = [0 10 13.6 16 20 24.5 27 29.8 32 34];
    %bandwidth_160_table = [0 9.04 13.08 15.7 20 24 26 30 32 34];
    
    if isequal(bandwidth, 'CBW20') || isequal(bandwidth, "CBW20")
        tbl = bandwidth_20_table;
    elseif isequal(bandwidth, 'CBW40') || isequal(bandwidth, "CBW40")
        tbl = bandwidth_40_table;
    elseif isequal(bandwidth, 'CBW80') || isequal(bandwidth, "CBW80")
        tbl = bandwidth_80_table;
    elseif isequal(bandwidth, 'CBW160') || isequal(bandwidth, "CBW160")
        tbl = bandwidth_160_table;
    end
    mcs = 0;
    for i = 1:10
        if tbl(i) == -1
           continue
        end
        if tbl(i) > snr
           break
        end
        mcs = i - 1;
    end
end

