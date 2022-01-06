function [out1 , out0] = BaseBandDetection(signal ,wif, BW , Fs)
 t = (0 : length(signal) -1) * (1/Fs);
 out0 = signal.*cos(2*pi*t*(wif));
 out1 = LPFilter(signal.*cos(2*pi*t*(wif)) , BW , Fs);
end

