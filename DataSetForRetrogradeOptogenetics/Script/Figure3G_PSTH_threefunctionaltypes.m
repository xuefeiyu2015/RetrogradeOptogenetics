PSTHpath='/Users/yux8/Desktop/DataSetForRetrogradeOptogenetics/Figure3EPSTH_threetypes_targetonset.txt';
PSTHData = importdata(PSTHpath);
psth = PSTHData.data;% Time, MeanVisOnly,MeanVisuomove,MeanMove,SemVisOnly,SemVisuomove,SemMove
time = psth(:,1);%Target onset

PSTHpath2='/Users/yux8/Desktop/DataSetForRetrogradeOptogenetics/Figure3EPSTH_threetypes_saccadeonset.txt';
PSTHData2 = importdata(PSTHpath2);
psth2 = PSTHData2.data;% Time, MeanVisOnly,MeanVisuomove,MeanMove,SemVisOnly,SemVisuomove,SemMove
time2 = psth2(:,1);%SacOnset

%Set up figures
name='PSTH_FEFThreeFunctionalTypes';
figure()
set(gcf,'color','w');
set(gcf,'Position', [120,100, 600,300]);
set(gcf,'Name',name)

types = {'Vis','Visuomove','Movement'};


for i = 1:3
      
      subplot(3,2,(i-1)*2+1)
        shadedErrorBar(time,psth(:,1+i),psth(:,4+i),'lineprops','k','transparent',1,'patchSaturation',0.3)
        set(findall(gca, 'Type', 'Line'),'LineWidth',0.5);
        
       title(types(i));
        set(gca,'LineWidth',0.5,'FontSize',5,'FontWeight','Bold');
        xlabel('Time from target onset(ms)');
        ylabel('Normalized Responses');
        xlim([-300,300]);

       subplot(3,2,(i-1)*2+2)
        shadedErrorBar(time2,psth2(:,1+i),psth2(:,4+i),'lineprops','k','transparent',1,'patchSaturation',0.3)
        set(findall(gca, 'Type', 'Line'),'LineWidth',0.5);
        
       title(types(i));
         set(gca,'LineWidth',0.5,'FontSize',5,'FontWeight','Bold');
        xlabel('Time from saccade onset(ms)');
        ylabel('Normalized Responses');
        xlim([-400,200]);
      
 end

   

     
      


box off




