Histpath='/Users/yux8/Desktop/DataSetForRetrogradeOptogenetics/Figure1EExampleSaccadeCountsHistogram.txt';
HistData = importdata(Histpath);

RasterStimpath='/Users/yux8/Desktop/DataSetForRetrogradeOptogenetics/Figure1EExampleSaccadeRasterTimingStim.txt';
RasterStimData = importdata(RasterStimpath);

Hist = HistData.data;
RasterStim = RasterStimData.data;

RasterControlpath='/Users/yux8/Desktop/DataSetForRetrogradeOptogenetics/Figure1EExampleSaccadeRasterTimingControl.txt';
RasterControlData = importdata(RasterControlpath);


RasterControl = RasterControlData.data;

Hist_Time = Hist(:,1);
Hist_Stim = Hist(:,2);
Hist_Control = Hist(:,3);
%Set up figures
name='ExampleSaccadeRaster_FEFOpticalStim';
figure()
set(gcf,'color','w');
set(gcf,'Position', [120,100, 600,300]);
set(gcf,'Name',name)

%%Plot
StartLoc = 1;
LineWidth = 3;
Barlength = 1;

subplot(3,1,1);
AverageRegion = [0,100];
area(AverageRegion,[80+5,80+5],...
    'FaceColor','k','FaceAlpha',.1,'EdgeAlpha',.1,'HandleVisibility','off');

hold on

%Raster For Stim
SpikeRaterPlot(RasterStim,StartLoc,Barlength,'r',LineWidth);

StartLoc = size(RasterStim,1)+5;
%Raster For Control

SpikeRaterPlot(RasterControl,StartLoc,Barlength,'k',LineWidth);
xlim([-100,200]);


 set(gca,'LineWidth',3,'FontSize',20,'FontWeight','Bold');
 yticks([]);
 box off

 
 
subplot(3,1,2);

maxy = max(max(Hist_Stim),max(Hist_Control))+2;
AverageRegion = [0,100];
area(AverageRegion,[maxy,maxy],...
    'FaceColor','k','FaceAlpha',.1,'EdgeAlpha',.1,'HandleVisibility','off');

hold on

%{
plot(TimeSeq,SaccadeCountStim_Sum,'-r','LineWidth',3)
hold on
plot(TimeSeq,SaccadeCountControl_Sum,'-k','LineWidth',3)
%}
bar(Hist_Time,Hist_Stim,'r')
set(gca,'LineWidth',3,'FontSize',20,'FontWeight','Bold');
 
 box off
max_stimtime = Hist_Time(Hist_Stim == max(Hist_Stim));
maxstim = max(Hist_Stim)+3;
for i = 1:length(max_stimtime )
  plot([max_stimtime(i),max_stimtime(i)],[maxstim,maxstim],'v','MarkerSize',10,'Color','r','MarkerFaceColor','r');
end
ylim([0,maxstim]);

legend({'Stim'});


subplot(3,1,3);
bar(Hist_Time,Hist_Control,'k')

box off;
xlabel('Time from Opto-stim On'); 
ylabel('Number of saccades');

set(gca,'LineWidth',3,'FontSize',20,'FontWeight','Bold');

legend({'Control'});


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

