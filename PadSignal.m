function [padded] = PadSignal(signal,Range)
L = Range;
Lx = length(signal);
Loff = L - Lx;
signal(end+1 : end+Loff) = 0;
padded = signal;
end

