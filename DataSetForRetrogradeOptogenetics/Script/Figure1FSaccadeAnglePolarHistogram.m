Histpath='/Users/yux8/Desktop/DataSetForRetrogradeOptogenetics/Figure1FPolarDistributionSaccadeAngle.txt';
HistData = importdata(Histpath);
hist = HistData.data;
SaccadeVector = hist(:,1); %The saccade angle interval center for polar plot
Control_R = hist(:,2);%Proportion of saccades during control trials for monkey R
Control_A = hist(:,3);% Proportion of saccades during control trials for monkey A
Stim_R = hist(:,4); %Proportion of saccades in optical stimulated trials for monkey R
Stim_A = hist(:,5); %Proportion of saccades in optical stimulated trials for monkey A

%Set up figures
name='SaccadeAngleHistogram_FEFOpticalStim';
figure()
set(gcf,'color','w');
set(gcf,'Position', [120,100, 600,300]);
set(gcf,'Name',name)

  h = polarplot([SaccadeVector;SaccadeVector(1)],[Control_R; Control_R(1)],...
    '-k','LineWidth',3);
     hold on
     h = polarplot([SaccadeVector; SaccadeVector(1)],[Control_A ;Control_A(1)],...
    '-b','LineWidth',3);

hold on
%s = polarwitherrorbar([SaccadeVector/180*pi SaccadeVector(1)/180*pi],[PropAngleStim_All PropAngleStim_All(1)],[NumberOfAngle_Stim_Sem' NumberOfAngle_Stim_Sem(1)],...
%    '-r',3);
%
s = polarplot([SaccadeVector; SaccadeVector(1)],[Stim_R; Stim_R(1)],...
    '-r','LineWidth',3);
%s.MarkerSize = 0.5;
hold on
s = polarplot([SaccadeVector;SaccadeVector(1)],[Stim_A;Stim_A(1)],...
    '-m','LineWidth',3);
set(gca,'ThetaDir' , 'counterclockwise');
set(gca,'ThetaZeroLocation','top')
set(gca,'FontSize',30,'FontWeight','Bold','LineWidth',3);
%set(gca,'FontSize',30,'LineWidth',0.5);


thetaticks([0:45:359]);
thetaticklabels([0:45:359]);
rlim([0,0.6]);


