clc; clear; close all; 
AI= read_segy_file('inversion_analysis_log.sgy',{'times',0,1000});
Impdance=AI.traces(:,1);
len = length(Impdance);
for i=1:(len-1)
    R_modeled(i) = (Impdance(i+1)-Impdance(i))/(Impdance(i+1)+Impdance(i));
end
R_modeled = R_modeled';
R_modeled = [R_modeled;0];
step=2;
wavelet=s_create_wavelet({'type','Ricker'},{'step',step});
Wavelet = wavelet.traces;
synth_modeled = conv(R_modeled,Wavelet,'same');