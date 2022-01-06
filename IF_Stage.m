function [out] = IF_Stage(signal, channel , BW , wif , Fs)

out = BPFilter(signal , (( wif)) - BW ,(( wif))+ BW ,Fs);
end

