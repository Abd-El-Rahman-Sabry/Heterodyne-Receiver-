function [] = plotSignalArray(signals , Fs , legends)
    Legends = {};
    L = length(signals);
    figure
    for i = 1:L
        [x , y] = plotFD(signals{i} , Fs);
        Legends{end +1} = strrep(strrep(legends(i),"_" , " "),".wav"," ");
        plot(x , y)
        hold on
    end
    hold off
    legend(Legends);
end

