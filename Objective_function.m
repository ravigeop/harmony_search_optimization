function RMSE = Objective_function(optimiseMe)
global one_composite_trace Model_composite Wavelet
Z_modeled = optimiseMe;
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
  RMSE = (sum(abs(synth_observed-synth_modeled))/sum(abs(synth_observed)))+(sum(abs(Z_pri-Z_mod))/(sum(abs(Z_pri))));
diary('HS_iteration_traces_18_06_2024_1_50.txt');
