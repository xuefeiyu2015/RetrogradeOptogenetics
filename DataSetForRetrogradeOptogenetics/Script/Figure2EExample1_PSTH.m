PSTHpath='/Users/yux8/Desktop/DataSetForRetrogradeOptogenetics/Figure2EExample1_PSTH.txt';
PSTHData = importdata(PSTHpath);

RasterStimpath='/Users/yux8/Desktop/DataSetForRetrogradeOptogenetics/Figure2EExample1_StimRaster.txt';
RasterStim = importdata(RasterStimpath);

psth = PSTHData.data;

PSTH_Time = psth(:,1);

PSTH_Stim = psth(:,2);
PSTH_Stim_sem = psth(:,3);
%Set up figures
name='ExampleFastExcitation1';
figure()
set(gcf,'color','w');
set(gcf,'Position', [120,100, 600,300]);
set(gcf,'Name',name)

%%Plot
StartLoc = 1;
LineWidth = 3;
Barlength = 1;

subplot(2,1,1);
AverageRegion = [0,100];
area(AverageRegion,[600+5,600+5],...
    'FaceColor','k','FaceAlpha',.1,'EdgeAlpha',.1,'HandleVisibility','off');

hold on

%Raster For Stim
SpikeRaterPlot(RasterStim,StartLoc,Barlength,'r',LineWidth);

StartLoc = size(RasterStim,1)+5;



 set(gca,'LineWidth',3,'FontSize',20,'FontWeight','Bold');
 yticks([]);
 box off
xlim([-100,200]);
 

 subplot(2,1,2);

maxy = 605;
AverageRegion = [0,100];
area(AverageRegion,[maxy,maxy],...
    'FaceColor','k','FaceAlpha',.1,'EdgeAlpha',.1,'HandleVisibility','off');

hold on
 
shadedErrorBar(PSTH_Time,PSTH_Stim,PSTH_Stim_sem,'lineprops',{[1,0,0]},'transparent',1,'patchSaturation',0.3)

box off
xlabel('Time from Opto-stim On'); 
ylabel('Firing Rate');

set(gca,'LineWidth',3,'FontSize',20,'FontWeight','Bold');
xlim([-100,200]);



function SpikeRaterPlot(SpikeTime,StartLoc,Barlength,Color,LineWidth)
%Plot spike raster here;YXF 10162019
Xplot=[];
Yplot=[];
  for i=1:size(SpikeTime,1)
      
      Xplot=[Xplot,repmat(SpikeTime(i,:),2,1)];
      Yplot=[Yplot,repmat([StartLoc+i-1;StartLoc+i-1+Barlength],1,size(SpikeTime(i,:),2))];
  
  end
  
  
  
plot(Xplot, Yplot,'Color',Color,'LineWidth',LineWidth);
ylim([Barlength,StartLoc-1+size(SpikeTime,1)+Barlength*2]);
%yticks ([ceil(Barlength):floor(size(SpikeTime,1)/2):floor(i+Barlength*2)])

end
