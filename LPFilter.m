function [out] = LPFilter(signal,Fc , Fs)
lpFilt = designfilt('lowpassiir','FilterOrder',8, ...
         'PassbandFrequency',Fc,'PassbandRipple',0.2, ...
         'SampleRate',Fs);
     out = filter(lpFilt , signal);
     
end

