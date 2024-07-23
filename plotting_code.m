clc; clear; close all
 %% Single trace analysis for well 01_08_logs
Inverted_AI_1_2823 =  load('HS_inverted_impedance.txt');
Inverted_AI_2142 = Inverted_AI_1_2823(1:101, 42:42);
wlog = read_las_file('01-08_logs.las');
Time = linspace(900,1100,101)';
AI_Model_2142 = read_segy_file('Export_Strata_Model_as_volume_P-Impedance.sgy',{'times',600,800},{'traces',42:1:42});
figure;
plot(AI_Model_2142.traces, Time,'b')
set(findobj(gcf,'type','axes'),'FontName','Times New Roman','FontSize',11,'FontWeight','Normal', 'LineWidth', 0.80);
set(gca,'YDir','reverse')
set(gca,'XAxisLocation','top')
hold on
Aimp_2142 = (wlog.curves(1054:1434,2).*wlog.curves(1054:1434,3));
plot(Aimp_2142,wlog.curves(1054:1434,4),'k')
hold on
plot(Inverted_AI_2142, Time,'r','LineWidth',1.0)
ylim([900 1100])
hold on
plot(AI_Model_2142.traces-2500, Time,':b', 'LineWidth', 1)
hold on
plot(AI_Model_2142.traces+2500, Time,':b', 'LineWidth', 1)
ylabel('Time (ms)')
xlabel('Impedance')
legend('Model', 'Well log','Inverted')
set(findobj(gcf,'type','axes'),'FontName','Times New Roman','FontSize',11,'FontWeight','Normal', 'LineWidth', 0.80);
set(gca,'YDir','reverse')
set(gca,'XAxisLocation','top')
grid on
grid minor

 %% impdance volume
myGmap = xlsread('myGmap.xlsx');
myGmap = myGmap./255;
seismic_01 = read_segy_file('Export_Strata_Model_as_volume_P-Impedance.sgy',{'times',600,800},{'traces',1:1:50});
Inverted_AI_1_50 = load('HS_inverted_impedance.txt');
zero_50_150 = zeros(150,50);
Inverted_AI_250_50 = [Inverted_AI_1_50; zero_50_150];
seismic_01.traces = Inverted_AI_250_50;
seismic_01.first =900;
seismic_01.last = 1400;
wlog_01_08 = read_las_file('01-08_logs.las');
wlog_01_08 = l_curve_math(wlog_01_08,'add','aimp = rhob.*dt','m/s*g/cc','Acoustic Impedance');
wlog_01_08=l_rename(wlog_01_08,{'dptm','twt'});
wlog_01_08=l_rm_nulls(wlog_01_08,'anywhere','twt');
%      Make two-way time the first column
wlog_01_08=l_switch_depth(wlog_01_08,'twt');
%     Select the desired curve (density); remove all others
wlog_01_08=l_select(wlog_01_08,{'curves','aimp'});
step=2;      % Sample interval in ms of the depth-to-time converted well log
wlog_01_08=l_resample(wlog_01_08,step);
tlog=s_log2seismic(wlog_01_08);
tlog=s_select(tlog,{'times',seismic_01.first,seismic_01.last},{'null',NaN});
tlog=tlog-nan_mean(tlog.traces);
slog=s_resample(seismic_01,step);
slog.traces(1:end,1:end)=NaN;
Seismic_01=s_data;
Seismic_01.traces = seismic_01.traces;
Seismic_01.first = 900;
Seismic_01.last = 1400;
Seismic_01.step = 2;
for i=1:50
AA(i) = i;
end
Seismic_01.headers = AA;
loc=s_trace_numbers(Seismic_01,'CDP',42); % Find the trace number with CDP == 107
slog.traces(:,loc)=tlog.traces;
% s_cplot(Seismic,{'colormap',myGmap},{'shading','interp'}
AI_Model = read_segy_file('Export_Strata_Model_as_volume_P-Impedance.sgy',{'times',600,800},{'traces',1:1:50});
AI_Model_101_50 = AI_Model.traces;
AI_Model_251_50 = [AI_Model_101_50; zero_50_150];
Seismic_01.traces = Seismic_01.traces;
slog.name = 'Seismic with well 01-08_logs';
figure
s_cplot(Seismic_01,{'colormap',myGmap},{'shading','interp'},{'annotation','cdp'},{'figure','old'})    % Plot the seismic as a color image
s_wplot(slog,{'figure','old'},{'wiggle','blue'},{'peak_fill',''}, ...
   {'interp','linear'},{'wiggle_width',1.5},{'annotation','CDP'}, ...
   {'deflection',1})
 ylabel('Time (ms)')
ylim([900 1100])
caxis([8000, 12000])

set(findobj(gcf,'type','axes'),'FontName','Times New Roman','FontSize',11,'FontWeight','Normal', 'LineWidth', 0.80);
