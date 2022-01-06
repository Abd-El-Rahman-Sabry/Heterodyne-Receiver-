%Input
Messages = [
          "Short_BBCArabic2.wav",... 
          "Short_FM9090.wav",...
          "Short_QuranPalestine.wav",...
          "Short_SkyNewsArabia.wav",...
          "Short_RussianVoice.wav"
       ];
%**************************


%******* AM Modulator ***********

% AM parameters ********* 
fc = 100e3;
df = 50e3;
audiofileFactor = 0.9;
interpolationFactor = 20;
%*************************

[c , modes , Fs , BW ,t] =  AM_Modulator(Messages, fc, df, audiofileFactor , interpolationFactor);
plotSignalArray(modes , Fs , Messages)




%************************************************************************
%                     Receiver
%************************************************************************
wif = 25e3;
channel = 1;

s  = c;

%{ 
********** RF_Stage ************** 
figure
s = RF_Stage(s , channel ,BW(channel), fc , df  , Fs);
[x ,y] = plotFD(s , Fs);
plot(x , y , 'b')
title("RF Stage Output")
xlabel("Frequency(Hz)")
ylabel("Magntude")
 %}

% ********** Mixer ************** 
figure
s = Mixer(s , channel , fc , df , wif , Fs);
[x ,y] = plotFD(s , Fs);
plot(x , y , 'b')
title("Mixer Output")
xlabel("Frequency(Hz)")
ylabel("Magntude")


% ********** IF_Stage ************** 
figure
s = IF_Stage(s , channel , BW(channel) ,wif, Fs);
[x ,y] = plotFD(s , Fs);
plot(x , y , 'y')
 title("IF-Stage Output")
xlabel("Frequency(Hz)")
ylabel("Magntude")


% ********** Baseband Detection_Stage ************** 
figure
[s , s0] = BaseBandDetection(s , wif , BW(channel) , Fs);
[x ,y] = plotFD(s , Fs);
plot(x , y , 'g')
title("BaseBand Detection Output")
xlabel("Frequency(Hz)")
ylabel("Magntude")
figure 
[x ,y] = plotFD(s0 , Fs);
plot(x , y , 'g')
title("BaseBand Detection (Bef) Output")
xlabel("Frequency(Hz)")
ylabel("Magntude")
%Play Sound of The Message 
figure
subplot(1 ,2 , 1)
s = downsample(s , interpolationFactor);
sound(s , 44100)


