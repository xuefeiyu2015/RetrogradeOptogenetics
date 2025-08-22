Histpath='/Users/yux8/Desktop/DataSetForRetrogradeOptogenetics/Figure1GSaccadeFrequencyPSTH.txt';
HistData = importdata(Histpath);
psth = HistData.data;
time = psth(:,1);
control_R = psth(:,2);
control_A = psth(:,3);
stim_R = psth(:,4);
stim_A = psth(:,5);

%Set up figures
name='SaccadeFrequencyPSTH_FEFOpticalStim';
figure()
set(gcf,'color','w');
set(gcf,'Position', [120,100, 600,300]);
set(gcf,'Name',name)

%Control

AverageRegion = [0,100];
area(AverageRegion,[22,22],...
    'FaceColor','k','FaceAlpha',.1,'EdgeAlpha',.1,'HandleVisibility','off');

hold on

%bar(TimeSeq,SaccadeCountControl_Sum_all,'k')
stairs(time,control_R,'k');
stairs(time,control_A,'b');

stairs(time,stim_R,'r');
stairs(time,stim_A,'m');

box off;
xlabel('Time from Opto-stim Onset (ms)'); 
ylabel('Saccade Frequency (Saccades/s)');

%set(gca,'LineWidth',3,'FontSize',20,'FontWeight','Bold');
set(gca,'LineWidth',0.5,'FontSize',5);
xlim([-100,200]);


