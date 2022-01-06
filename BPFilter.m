function [out] = BPFilter(signal,f1 , f2 , Fs)
bpFilt = designfilt('bandpassfir','FilterOrder',120, ...
         'CutoffFrequency1',f1,'CutoffFrequency2',f2, ...
         'SampleRate',Fs);
     
     out = filter(bpFilt,signal);
end

