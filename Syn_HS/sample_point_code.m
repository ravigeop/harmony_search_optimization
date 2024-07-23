clc; clear; close all;
Inverted_AI_HS_101=load('HS_inverted_impedance_11_05_2024_test.txt');
Inverted_AI_HS_501=load('HS_inverted_impedance_11_05_2024_501.txt');
AI_Model_01 = read_segy_file('Export_Strata_Model_as_volume_P-Impedance.sgy',{'times',600,800},{'traces',42:1:42});
figure
subplot(2,2,1)
Time = linspace(900,1100,101)';
plot(AI_Model_01.traces, Time,'b')
set(findobj(gcf,'type','axes'),'FontName','Times New Roman','FontSize',11,'FontWeight','Normal', 'LineWidth', 0.80);
set(gca,'YDir','reverse')
set(gca,'XAxisLocation','top')
hold on
 Aimp_2142_log = read_segy_file('inversion_analysis_log.sgy',{'times',600,800});
 plot(Aimp_2142_log.traces(:,1),Time,'k')
hold on
plot(Inverted_AI_HS_101, Time,'r','LineWidth',1.0)
hold on
plot(AI_Model_01.traces-2000, Time,':b', 'LineWidth', 1)
hold on
plot(AI_Model_01.traces+2000, Time,':b', 'LineWidth', 1)
  ylim([900 1100])
ylabel('Time (ms)')
xlabel('Impedance (m/s*g/cc)')
legend('Model', 'Well log','Inverted')
set(findobj(gcf,'type','axes'),'FontName','Times New Roman','FontSize',11,'FontWeight','Normal', 'LineWidth', 0.80);
set(gca,'YDir','reverse')
set(gca,'XAxisLocation','top')
grid on
grid minor
correlation_HS_101 =corrcoef(Aimp_2142_log.traces(:,1),Inverted_AI_HS_101);
avg_c_HS_101= mean(abs(correlation_HS_101));
subplot(2,2,2)
Time = linspace(300,1300,501)';
AI_Model_01 = read_segy_file('Export_Strata_Model_as_volume_P-Impedance.sgy',{'times',0,1000},{'traces',42:1:42});
plot(AI_Model_01.traces, Time,'b')
set(findobj(gcf,'type','axes'),'FontName','Times New Roman','FontSize',11,'FontWeight','Normal', 'LineWidth', 0.80);
set(gca,'YDir','reverse')
set(gca,'XAxisLocation','top')
hold on
 Aimp_2142_log = read_segy_file('inversion_analysis_log.sgy',{'times',0,1000});
 plot(Aimp_2142_log.traces(:,1),Time,'k')
hold on
plot(Inverted_AI_HS_501, Time,'r','LineWidth',1.0)
hold on
plot(AI_Model_01.traces-2000, Time,':b', 'LineWidth', 1)
hold on
plot(AI_Model_01.traces+2000, Time,':b', 'LineWidth', 1)
  ylim([300 1100])
ylabel('Time (ms)')
xlabel('Impedance (m/s*g/cc)')
legend('Model', 'Well log','Inverted')
set(findobj(gcf,'type','axes'),'FontName','Times New Roman','FontSize',11,'FontWeight','Normal', 'LineWidth', 0.80);
set(gca,'YDir','reverse')
set(gca,'XAxisLocation','top')
grid on
grid minor
correlation_HS_501 =corrcoef(Aimp_2142_log.traces(:,1),Inverted_AI_HS_501);
avg_c_HS_501= mean(abs(correlation_HS_501));
%% cross plot
subplot(2,2,3)
 Aimp_2142_log = read_segy_file('inversion_analysis_log.sgy',{'times',600,800});
scatter(Aimp_2142_log.traces(:,1),Inverted_AI_HS_101,'o','filled','r','MarkerEdgeColor','k')
 grid on
grid minor
xlim([0 14500])
 ylim([0 14500])
 ylabel('Original Impedance (m/s*g/cc)')
xlabel('Inverted Impedance (m/s*g/cc)')
subplot(2,2,4)
 Aimp_2142_log = read_segy_file('inversion_analysis_log.sgy',{'times',0,1000});
scatter(Aimp_2142_log.traces(:,1),Inverted_AI_HS_501,'o','filled','r','MarkerEdgeColor','k')
 grid on
grid minor
xlim([0 14500])
 ylim([0 14500])
 ylabel('Original Impedance (m/s*g/cc)')
xlabel('Inverted Impedance (m/s*g/cc)')
%% trace
len = length(Inverted_AI_HS_101);
for i=1:(len-1)
    R_modeled_HS_101(i) = (Inverted_AI_HS_101(i+1)-Inverted_AI_HS_101(i))/(Inverted_AI_HS_101(i+1)+Inverted_AI_HS_101(i));
end
R_modeled_HS_101 = R_modeled_HS_101';
R_modeled_HS_101 = [R_modeled_HS_101;0];
step=2;
wavelet=s_create_wavelet({'type','Ricker'},{'step',step});
Wavelet = wavelet.traces;
synth_modeled_HS_101 = conv(R_modeled_HS_101,Wavelet,'same');
Seismic = read_segy_file('blackfoot_seismic.sgy',{'times',600,800},{'traces',42:1:42});
Seismic.traces = synth_modeled_HS_101 ;
Seismic_plot = read_segy_file('blackfoot_seismic.sgy',{'times',600,800},{'traces',42:1:42});
figure
subplot(1,2,1)
 s_compare(Seismic,Seismic_plot,{'figure','old'},{'peak_fill','k'},{'wiggle_color1','k'},{'peak_fill2','r'}, {'wiggle_color2','r'});
 ylabel('Time (ms)')
 correlation_I_HS_101 =corrcoef(Seismic.traces, Seismic_plot.traces);
 avg_I_HS_101 = mean(abs( correlation_I_HS_101));
 len = length(Inverted_AI_HS_501);
for i=1:(len-1)
    R_modeled_HS_501(i) = (Inverted_AI_HS_501(i+1)-Inverted_AI_HS_501(i))/(Inverted_AI_HS_501(i+1)+Inverted_AI_HS_501(i));
end
R_modeled_HS_501 = R_modeled_HS_501';
R_modeled_HS_501 = [R_modeled_HS_501;0];
step=2;
wavelet=s_create_wavelet({'type','Ricker'},{'step',step});
Wavelet = wavelet.traces;
synth_modeled_HS_501 = conv(R_modeled_HS_501,Wavelet,'same');
Seismic = read_segy_file('blackfoot_seismic.sgy',{'times',0,1000},{'traces',42:1:42});
Seismic.traces = synth_modeled_HS_501 ;
Seismic_plot = read_segy_file('blackfoot_seismic.sgy',{'times',0,1000},{'traces',42:1:42});
subplot(1,2,2)
 s_compare(Seismic,Seismic_plot,{'figure','old'},{'peak_fill','k'},{'wiggle_color1','k'},{'peak_fill2','r'}, {'wiggle_color2','r'});
 ylabel('Time (ms)')
 correlation_I_HS_501 =corrcoef(Seismic.traces, Seismic_plot.traces);
 avg_I_HS_501 = mean(abs( correlation_I_HS_501));