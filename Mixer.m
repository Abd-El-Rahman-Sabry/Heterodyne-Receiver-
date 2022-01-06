function [out] = Mixer(signal, channel , fc , df , wif , Fs)
t = (0:length(signal)-1) * 1/(Fs);
out = signal.*cos(2*pi*(fc + (channel -1)*(df) + wif) *t);
end

