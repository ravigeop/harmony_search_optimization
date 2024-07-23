clc; clear; close all;
Inverted_AI_HS_0N=load('HS_inverted_impedance_11_05_2024_test.txt');
Inverted_AI_HS_10N=load('HS_inverted_impedance_11_05_2024_test_10N.txt');
Inverted_AI_HS_20N=load('HS_inverted_impedance_11_05_2024_test_20N.txt');
Inverted_AI_HS_30N=load('HS_inverted_impedance_11_05_2024_test_30N.txt');
AI_Model_01 = read_segy_file('Export_Strata_Model_as_volume_P-Impedance.sgy',{'times',600,800},{'traces',42:1:42});
figure
subplot(2,4,1)
Time = linspace(900,1100,101)';
plot(AI_Model_01.traces, Time,'b')
set(findobj(gcf,'type','axes'),'FontName','Times New Roman','FontSize',11,'FontWeight','Normal', 'LineWidth', 0.80);
set(gca,'YDir','reverse')
set(gca,'XAxisLocation','top')
hold on
 Aimp_2142_log = read_segy_file('inversion_analysis_log.sgy',{'times',600,800});
 plot(Aimp_2142_log.traces(:,1),Time,'k')
hold on
plot(Inverted_AI_HS_0N, Time,'r','LineWidth',1.0)
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
correlation_HS_0N =corrcoef(Aimp_2142_log.traces(:,1),Inverted_AI_HS_0N);
avg_c_HS_0N= mean(abs(correlation_HS_0N));
subplot(2,4,2)
Time = linspace(900,1100,101)';
plot(AI_Model_01.traces, Time,'b')
set(findobj(gcf,'type','axes'),'FontName','Times New Roman','FontSize',11,'FontWeight','Normal', 'LineWidth', 0.80);
set(gca,'YDir','reverse')
set(gca,'XAxisLocation','top')
hold on
 Aimp_2142_log = read_segy_file('inversion_analysis_log.sgy',{'times',600,800});
 plot(Aimp_2142_log.traces(:,1),Time,'k')
hold on
plot(Inverted_AI_HS_10N, Time,'r','LineWidth',1.0)
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
correlation_HS_10N =corrcoef(Aimp_2142_log.traces(:,1),Inverted_AI_HS_10N);
avg_c_HS_10N= mean(abs(correlation_HS_10N));
subplot(2,4,3)
Time = linspace(900,1100,101)';
plot(AI_Model_01.traces, Time,'b')
set(findobj(gcf,'type','axes'),'FontName','Times New Roman','FontSize',11,'FontWeight','Normal', 'LineWidth', 0.80);
set(gca,'YDir','reverse')
set(gca,'XAxisLocation','top')
hold on
 Aimp_2142_log = read_segy_file('inversion_analysis_log.sgy',{'times',600,800});
 plot(Aimp_2142_log.traces(:,1),Time,'k')
hold on
plot(Inverted_AI_HS_20N, Time,'r','LineWidth',1.0)
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
correlation_HS_20N =corrcoef(Aimp_2142_log.traces(:,1),Inverted_AI_HS_20N);
avg_c_HS_20N= mean(abs(correlation_HS_20N));
subplot(2,4,4)
Time = linspace(900,1100,101)';
plot(AI_Model_01.traces, Time,'b')
set(findobj(gcf,'type','axes'),'FontName','Times New Roman','FontSize',11,'FontWeight','Normal', 'LineWidth', 0.80);
set(gca,'YDir','reverse')
set(gca,'XAxisLocation','top')
hold on
 Aimp_2142_log = read_segy_file('inversion_analysis_log.sgy',{'times',600,800});
 plot(Aimp_2142_log.traces(:,1),Time,'k')
hold on
plot(Inverted_AI_HS_30N, Time,'r','LineWidth',1.0)
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
correlation_HS_30N =corrcoef(Aimp_2142_log.traces(:,1),Inverted_AI_HS_30N);
avg_c_HS_30N= mean(abs(correlation_HS_30N));
%% single trace
len = length(Inverted_AI_HS_0N);
for i=1:(len-1)
    R_modeled_HS_0(i) = (Inverted_AI_HS_0N(i+1)-Inverted_AI_HS_0N(i))/(Inverted_AI_HS_0N(i+1)+Inverted_AI_HS_0N(i));
end
R_modeled_HS_0 = R_modeled_HS_0';
R_modeled_HS_0 = [R_modeled_HS_0;0];
step=2;
wavelet=s_create_wavelet({'type','Ricker'},{'step',step});
Wavelet = wavelet.traces;
synth_modeled_HS_0 = conv(R_modeled_HS_0,Wavelet,'same');
Seismic = read_segy_file('blackfoot_seismic.sgy',{'times',600,800},{'traces',1:1:1});
Seismic.traces = synth_modeled_HS_0 ;

Seismic_plot = read_segy_file('blackfoot_seismic.sgy',{'times',600,800},{'traces',42:1:42});

subplot(2,4,5)
 s_compare(Seismic,Seismic_plot,{'figure','old'},{'peak_fill','k'},{'wiggle_color1','k'},{'peak_fill2','r'}, {'wiggle_color2','r'});
 ylabel('Time (ms)')
 correlation_I_HS_0 =corrcoef(Seismic.traces, Seismic_plot.traces);
 avg_I_HS_0 = mean(abs( correlation_I_HS_0));
 for i=1:(len-1)
    R_modeled_HS_10(i) = (Inverted_AI_HS_10N(i+1)-Inverted_AI_HS_10N(i))/(Inverted_AI_HS_10N(i+1)+Inverted_AI_HS_10N(i));
end
R_modeled_HS_10 = R_modeled_HS_10';
R_modeled_HS_10 = [R_modeled_HS_10;0];
step=2;
wavelet=s_create_wavelet({'type','Ricker'},{'step',step});
Wavelet = wavelet.traces;
synth_modeled_HS_10 = conv(R_modeled_HS_10,Wavelet,'same');
Seismic = read_segy_file('blackfoot_seismic.sgy',{'times',600,800},{'traces',1:1:1});
Seismic.traces = synth_modeled_HS_10 ;
Seismic_plot = read_segy_file('blackfoot_seismic.sgy',{'times',600,800},{'traces',42:1:42});
subplot(2,4,6)
 s_compare(Seismic,Seismic_plot,{'figure','old'},{'peak_fill','k'},{'wiggle_color1','k'},{'peak_fill2','r'}, {'wiggle_color2','r'});
 ylabel('Time (ms)')
 correlation_I_HS_10 =corrcoef(Seismic.traces, Seismic_plot.traces);
 avg_I_HS_10= mean(abs( correlation_I_HS_10));
 for i=1:(len-1)
    R_modeled_HS_20(i) = (Inverted_AI_HS_20N(i+1)-Inverted_AI_HS_20N(i))/(Inverted_AI_HS_20N(i+1)+Inverted_AI_HS_20N(i));
end
R_modeled_HS_20 = R_modeled_HS_20';
R_modeled_HS_20 = [R_modeled_HS_20;0];
step=2;
wavelet=s_create_wavelet({'type','Ricker'},{'step',step});
Wavelet = wavelet.traces;
synth_modeled_HS_20 = conv(R_modeled_HS_20,Wavelet,'same');
Seismic = read_segy_file('blackfoot_seismic.sgy',{'times',600,800},{'traces',1:1:1});
Seismic.traces = synth_modeled_HS_20 ;
Seismic_plot = read_segy_file('blackfoot_seismic.sgy',{'times',600,800},{'traces',42:1:42});
subplot(2,4,7)
 s_compare(Seismic,Seismic_plot,{'figure','old'},{'peak_fill','k'},{'wiggle_color1','k'},{'peak_fill2','r'}, {'wiggle_color2','r'});
 ylabel('Time (ms)')
 correlation_I_HS_20 =corrcoef(Seismic.traces, Seismic_plot.traces);
 avg_I_HS_20= mean(abs( correlation_I_HS_20));
  for i=1:(len-1)
    R_modeled_HS_30(i) = (Inverted_AI_HS_30N(i+1)-Inverted_AI_HS_30N(i))/(Inverted_AI_HS_30N(i+1)+Inverted_AI_HS_30N(i));
end
R_modeled_HS_30 = R_modeled_HS_30';
R_modeled_HS_30 = [R_modeled_HS_30;0];
step=2;
wavelet=s_create_wavelet({'type','Ricker'},{'step',step});
Wavelet = wavelet.traces;
synth_modeled_HS_30 = conv(R_modeled_HS_30,Wavelet,'same');
Seismic = read_segy_file('blackfoot_seismic.sgy',{'times',600,800},{'traces',1:1:1});
Seismic.traces = synth_modeled_HS_30 ;
Seismic_plot = read_segy_file('blackfoot_seismic.sgy',{'times',600,800},{'traces',42:1:42});
subplot(2,4,8)
 s_compare(Seismic,Seismic_plot,{'figure','old'},{'peak_fill','k'},{'wiggle_color1','k'},{'peak_fill2','r'}, {'wiggle_color2','r'});
 ylabel('Time (ms)')
 correlation_I_HS_30 =corrcoef(Seismic.traces, Seismic_plot.traces);
 avg_I_HS_30= mean(abs( correlation_I_HS_30));








%% error_plot
Zero_error=load('HS_error_0N.txt');
ten_error=load('HS_error_10N.txt');
twenty_error=load('HS_error_20N.txt');
thirty_error=load('HS_error_30N.txt');
Iteration=Zero_error(:,1);
Error =Zero_error(:,2);
Iteration_ten=ten_error(:,1);
Error_ten =ten_error(:,2);
Iteration_twenty=twenty_error(:,1);
Error_twenty =twenty_error(:,2);
Iteration_thirty=thirty_error(:,1);
Error_thirty =thirty_error(:,2);
figure
plot(Iteration,Error ,'r')
hold on
plot(Iteration_ten,Error_ten ,'b')
hold on
plot(Iteration_twenty,Error_twenty ,'c')
hold on
plot(Iteration_thirty,Error_thirty ,'k')
grid on
 grid minor
 ylabel('Error')
 xlabel('Iteration')

