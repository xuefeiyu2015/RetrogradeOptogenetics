path='/Users/yux8/Desktop/DataSetForRetrogradeOptogenetics/Figure1JContralRT.txt';
Data = importdata(path);
contralData = Data.data;

RT_stim = contralData(:,1);
RT_control = contralData(:,2);
MonkeyIndex = contralData(:,3);
Sig_RF = contralData(:,4);


%Set up figures
name='RT_Contra';
figure()
set(gcf,'color','w');
set(gcf,'Position', [120,100, 300,300]);
set(gcf,'Name',name)


plot([90:300],[90:300],'--k');
hold on
scatter(RT_stim(MonkeyIndex==1 & ~Sig_RF),RT_control(MonkeyIndex==1 & ~Sig_RF), 'Marker', '^','MarkerFaceColor','w','MarkerEdgeColor','k');

scatter(RT_stim(MonkeyIndex==2 & ~Sig_RF),RT_control(MonkeyIndex==2 & ~Sig_RF),'Marker', 's','MarkerFaceColor','w','MarkerEdgeColor','k');

scatter(RT_stim(MonkeyIndex==1 & Sig_RF),RT_control(MonkeyIndex==1 & Sig_RF),'filled', 'Marker', '^','MarkerFaceColor',[1,0,0],'MarkerEdgeColor','k');

scatter(RT_stim(MonkeyIndex==2 & Sig_RF),RT_control(MonkeyIndex==2 & Sig_RF),'filled', 'Marker', 's','MarkerFaceColor',[1,0,0],'MarkerEdgeColor','k');

xlim([90,300]);
ylim([90,300]);
yticks([100,200,300]);
xticks([100,200,300]);




xlabel('RT(Opto-Stim)');
ylabel('RT(Control)');
title('Contralateral saccades');
set(gca,'FontSize',5,'LineWidth',0.5);
box off

