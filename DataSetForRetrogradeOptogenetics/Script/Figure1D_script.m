%Load data
Datapath='/Users/yux8/Desktop/DataSetForRetrogradeOptogenetics/Figure1DExampleTriggerredSaccadeVector.txt';
Data = importdata(Datapath);
Vec = Data.data;
Vec_Stim = Vec(:,1:4);%X_start,Y_start,X_comp,Y_comp
Vec_Control = Vec(:,5:8);

%Set up figures
name='ExampleSaccadeVector_FEFOpticalStim';
figure()
set(gcf,'color','w');
set(gcf,'Position', [120,100, 600,300]);
set(gcf,'Name',name)

%Plot   
subplot(1,2,1)
title('Optical Stim');
quiver(Vec_Stim(:,1),Vec_Stim(:,2),Vec_Stim(:,3),Vec_Stim(:,4),'AutoScale', 'off','Color','r','LineWidth',3);
xlim([-40,40]);
ylim([-40,40]);
subplot(1,2,2)
title('Control');
quiver(Vec_Control(:,1),Vec_Control(:,2),Vec_Control(:,3),Vec_Control(:,4),'AutoScale', 'off','Color','k','LineWidth',3);
xlim([-40,40]);
ylim([-40,40]);
keyboard