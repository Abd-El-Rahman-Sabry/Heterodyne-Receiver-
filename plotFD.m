function [x, y] = plotFD(signal,Fs)
c = signal;
C = fft(c);
f = (-length(c)/2:length(c)/2-1)*Fs/length(c);
x = f ;
y = fftshift(abs(C));
end

