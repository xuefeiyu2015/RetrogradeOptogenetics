PSTHpath='/Users/yux8/Desktop/DataSetForRetrogradeOptogenetics/Figure2GPSTH_threegroups.txt';
PSTHData = importdata(PSTHpath);
psth = PSTHData.data;% Time, MeanFastExc,MeanSlowExc,MeanInh,SemFastExc,SemSlowExc,SemInh
time = psth(:,1);

%Set up figures
name='PSTH_FEFOpticalStim';
figure()
set(gcf,'color','w');
set(gcf,'Position', [120,100, 600,300]);
set(gcf,'Name',name)

AverageRegion = [0,100];
area(AverageRegion,[1,1],...
        'FaceColor','k','FaceAlpha',.1,'EdgeAlpha',.1,'HandleVisibility','off');
        hold on
AverageRegion = [0,100];
        area(AverageRegion,[-1,-1],...
        'FaceColor','k','FaceAlpha',.1,'EdgeAlpha',.1,'HandleVisibility','off');

ColorOrder = [1,0,0;
                  0.9098    0.7020    0.1373;
                  0,0,1;
                  0.3569    0.3451    0.3451];

for i = 1:3
      

        shadedErrorBar(time,psth(:,1+i),psth(:,4+i),'lineprops',{ColorOrder(i,:)},'transparent',1,'patchSaturation',0.3)
        set(findall(gca, 'Type', 'Line'),'LineWidth',0.5);
        
       
        
      
 end

   

     legend({'Fast Ex','Slow Ex','Inh'});
       set(gca,'LineWidth',0.5,'FontSize',5,'FontWeight','Bold');
        xlabel('Time from Opto onset(ms)');
        ylabel('Normalized Responses');


box off




