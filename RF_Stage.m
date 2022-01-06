function [out] = RF_Stage(FDMSignal, channel ,bw, fc , df , Fs)
WL = fc + (channel - 1)*df - bw;
WH = fc + (channel - 1)*df + bw;
out = BPFilter(FDMSignal , WL ,WH, Fs);
end

