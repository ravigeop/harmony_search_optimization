function RMSE = Global_optimization_PS(optimiseMe)
global one_composite_trace Model_composite Wavelet
Z_modeled = optimiseMe';
len = length(Z_modeled);
for i=1:(len-1)
    R_modeled(i) = (Z_modeled(i+1)-Z_modeled(i))/(Z_modeled(i+1)+Z_modeled(i));
end
R_modeled = R_modeled';
R_modeled = [R_modeled;0];
synth_modeled = conv(R_modeled,Wavelet,'same');
synth_observed = one_composite_trace;
Z_mod = Z_modeled;
Z_pri = Model_composite;
%    RMSE = (sqrt(sum((synth_modeled-synth_observed).^2))./501);
%  RMSE = sqrt(sum((synth_modeled-synth_observed).^2))./101+sqrt(sum((Z_mod-Z_pri).^2))./101;
  RMSE = (sum(abs(synth_observed-synth_modeled))/sum(abs(synth_observed)))+(sum(abs(Z_pri-Z_mod))/(sum(abs(Z_pri))));
diary('HS_iteration__traces_14_05_2024_501_final.txt');
% clf;
% depth = linspace(900, 1100, 101)';
% plot(synth_observed, depth,'k');
% hold on
% plot(synth_modeled, depth,'r');
% set(gca,'YDir','reverse');
% set(gca,'XAxisLocation','top');
% xlabel('Compare of Seismics')
% ylabel('Time (ms)')
% drawnow
end


