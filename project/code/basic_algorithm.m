function [mcs] = basic_algorithm(bandwidth, snr)
    bandwidth_20_table = [0 12.27 16.31 18.74 22.78 26.82 30.45 32.47 33.69 -1];
    % bandwidth_20_table = [0 12.27 16.31 18.74 22.78 26.82 28.03 32.47 33.69 -1];

    % bandwidth_40_table = [0 12.27 15.51 19.14 22.78 24.39 30.05 32.47 33.69 -1];
    bandwidth_40_table = [0 10.25 15.51 17.12 22.78 24.39 27.63 32.47 33.69 36];
    
    % bandwidth_80_table = [0 12.27 14.29 15.91 20.35 -1 25.2 27.63 30.45 33.28];
    bandwidth_80_table = [0 12.27 15 17 21 24.5 27 30 32 34];
    
    %bandwidth_160_table = [0 9.04 13.08 14.7 19.14 22.78 25.2 26.41 28.84 31.67];
    
    bandwidth_160_table = [0 9.04 13.08 15.7 20 24 26 30 32 34];
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

