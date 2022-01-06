function [Unified , max] = UniRange(signals)
    max = 0;
    for i = 1 : length(signals)
        if length(signals{i}) > max
            max = length(signals{i});
        end
    end
    
    Unified = zeros(length(signals) , max);
    for i = 1 : length(signals)
        Unified(i,1 : end) = PadSignal(signals{i}, max);
    end
end

