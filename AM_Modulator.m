%{
The function takes an array of strings that represent the names of the audio files “audioArr” and the carrier frequency “ fc + n*df ” the r is used to take a (r*100)% of the original file size to make the simulation faster and finally “interpf “ the factor of the interpolation process to increase the sampling frequency to satisfy the Nyquest criteria.
The outputs: 
-	Carried: the final signal after the FDM 
-	Modes: A Cell Array of every single signal after mixing it with its carrier 
-	Fs: The Sampling frequency 
-	BW: Array of the Bandwidth of every signal in the baseband 
-	t: the time vector

%}

function [carried ,modes, Fs ,BW ,t] = AM_Modulator(audioArr , fc , df ,r , interpf)

countSignals = length(audioArr);

signals = {};
modes = {};
Fs = [];
BW = [];
    for i = 1:countSignals
        [y , F] = audioread(audioArr(i));
        signals{end + 1} = sum(y , 2)';
        signals{end} = signals{end}(1:end*r);
        Fs(end+1) = F;
        BW(end+1) = obw(signals{end} , F);
    end 

    [unified, max] = UniRange(signals);

    ip = interpf;
    
    t = (0:ip*max-1) * 1/(ip*Fs(1));

carried = zeros(1 , ip*max);
    for i = 1:countSignals
        k = interp(unified(i , 1:end),ip).*cos(2*pi*(fc + (i-1)*df)*t);
        modes{end+1} = k;
        carried = carried + k; 
    end
    Fs = Fs(1)*ip;
end

