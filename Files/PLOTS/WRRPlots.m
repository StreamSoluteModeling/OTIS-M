%%
clc;
clear all;
close all;

CF = cd;
cd('C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU3-C-2SZ-R')
C1 =  importdata('PTS_NaCl_XS_460_0_0_0.txt','\t' ,2);
C2 =  importdata('PTS_NaCl_XS_460_0_0.001_0.001.txt','\t' ,2);
C3 =  importdata('PTS_NaCl_XS_460_0_0.001_0.01.txt','\t' ,2);
C4 =  importdata('PTS_NaCl_XS_460_0_0.01_0.001.txt','\t' ,2);
cd('C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU3-N-2SZ-R')
N1 =  importdata('PTS_NaCl_XS_460_0_0_0.txt','\t' ,2);
N2 =  importdata('PTS_NaCl_XS_460_0_0.001_0.001.txt','\t' ,2);
N3 =  importdata('PTS_NaCl_XS_460_0_0.001_0.01.txt','\t' ,2);
N4 =  importdata('PTS_NaCl_XS_460_0_0.01_0.001.txt','\t' ,2);
cd(CF);
sz=10;
figure(1)
subplot(2,2,1)
plot(C1.data(:,1),C1.data(:,2),'b','LineWidth', 1)
hold on;
plot(C1.data(:,1),C1.data(:,3),'--b','LineWidth', 1)
plot(C1.data(:,1),C1.data(:,4),':b','LineWidth', 1)
plot(N1.data(:,1),N1.data(:,2),'r','LineWidth', 1)
plot(N1.data(:,1),N1.data(:,3),'--r','LineWidth', 1)
plot(N1.data(:,1),N1.data(:,4),':r','LineWidth', 1)
xlim([5 20])
xlabel ('Time (hr)','FontName','Times New Roman','FontSize',sz)
ylabel ('Concentration (g/m³)','FontName','Times New Roman','FontSize',sz)
title([{'\(\lambda=0\)'},{'\(\lambda_{STS}=0\)'},{'\(\lambda_{HTS}=0\)'}],'interpreter','latex')
set(gca,'FontName','Times New Roman','FontSize',sz)

subplot(2,2,2)
plot(C2.data(:,1),C2.data(:,2),'b','LineWidth', 1)
hold on;
plot(C2.data(:,1),C2.data(:,3),'--b','LineWidth', 1)
plot(C2.data(:,1),C2.data(:,4),':b','LineWidth', 1)
plot(N2.data(:,1),N2.data(:,2),'r','LineWidth', 1)
plot(N2.data(:,1),N2.data(:,3),'--r','LineWidth', 1)
plot(N2.data(:,1),N2.data(:,4),':r','LineWidth', 1)
xlim([5 20])
xlabel ('Time (hr)','FontName','Times New Roman','FontSize',sz)
ylabel ('Concentration (g/m³)','FontName','Times New Roman','FontSize',sz)
title([{'\(\lambda=0\)'},{'\(\lambda_{STS}=0.001\)'},{'\(\lambda_{HTS}=0.001\)'}],'interpreter','latex')
set(gca,'FontName','Times New Roman','FontSize',sz)

subplot(2,2,3)
plot(C3.data(:,1),C3.data(:,2),'b','LineWidth', 1)
hold on;
plot(C3.data(:,1),C3.data(:,3),'--b','LineWidth', 1)
plot(C3.data(:,1),C3.data(:,4),':b','LineWidth', 1)
plot(N3.data(:,1),N3.data(:,2),'r','LineWidth', 1)
plot(N3.data(:,1),N3.data(:,3),'--r','LineWidth', 1)
plot(N3.data(:,1),N3.data(:,4),':r','LineWidth', 1)
xlim([5 20])
xlabel ('Time (hr)','FontName','Times New Roman','FontSize',sz)
ylabel ('Concentration (g/m³)','FontName','Times New Roman','FontSize',sz)
set(gca,'FontName','Times New Roman','FontSize',sz)
title([{'\(\lambda=0\)'},{'\(\lambda_{STS}=0.001\)'},{'\(\lambda_{HTS}=0.01\)'}],'interpreter','latex')

subplot(2,2,4)
plot(C4.data(:,1),C4.data(:,2),'b','LineWidth', 1)
hold on;
plot(C4.data(:,1),C4.data(:,3),'--b','LineWidth', 1)
plot(C4.data(:,1),C4.data(:,4),':b','LineWidth', 1)
plot(N4.data(:,1),N4.data(:,2),'r','LineWidth', 1)
plot(N4.data(:,1),N4.data(:,3),'--r','LineWidth', 1)
plot(N4.data(:,1),N4.data(:,4),':r','LineWidth', 1)
xlim([5 20])
xlabel ('Time (hr)','FontName','Times New Roman','FontSize',sz)
ylabel ('Concentration (g/m³)','FontName','Times New Roman','FontSize',sz)
set(gca,'FontName','Times New Roman','FontSize',sz)
title([{'\(\lambda=0\)'},{'\(\lambda_{STS}=0.01\)'},{'\(\lambda_{HTS}=0.001\)'}],'interpreter','latex')

set(gcf,'PaperType','usLetter','PaperOrientation','portrait',...
        'PaperUnits','Inches','PaperPositionMode','Manual') 
set(gcf,'PaperPosition',[0 0 7 7],'Position',[100 100 700 700]) 
saveas(gcf,'WRR_Reactive.png','png')
print('-depsc2','-r600','Figure8.eps')

%%
clc;
clear all;
close all;

CF = cd;
cd('C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\Conceptual2B-N-2SZopt\')
Nopt =  importdata('PTS_Solute_XS_200.txt','\t' ,2);
cd('C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\Conceptual2B-N-2SZsame\')
Nsame =  importdata('PTS_Solute_XS_200.txt','\t' ,2);
cd('C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\Conceptual2B-C-2SZ\')
COMP =  importdata('PTS_Solute_XS_200.txt','\t' ,2);
cd(CF);
sz=10;
figure(7)
plot(COMP.data(:,1),COMP.data(:,2),'b','LineWidth', 1)
hold on;
plot(COMP.data(:,1),COMP.data(:,3),'--b','LineWidth', 1)
plot(COMP.data(:,1),COMP.data(:,4),':b','LineWidth', 1)
plot(Nopt.data(:,1),Nopt.data(:,2),'r','LineWidth', 1)
plot(Nopt.data(:,1),Nopt.data(:,3),'--r','LineWidth', 1)
plot(Nopt.data(:,1),Nopt.data(:,4),':r','LineWidth', 1)
plot(Nsame.data(:,1),Nsame.data(:,2),'g','LineWidth', 1)
plot(Nsame.data(:,1),Nsame.data(:,3),'--g','LineWidth', 1)
plot(Nsame.data(:,1),Nsame.data(:,4),':g','LineWidth', 1)
xlabel ('Time (hr)','FontName','Times New Roman','FontSize',sz)
ylabel ('Concentration (g/m³)','FontName','Times New Roman','FontSize',sz)
set(gca,'FontName','Times New Roman','FontSize',sz)
TITLE = strvcat('Conceptual Comparison of Competing versus Nested Transient', 'Storage Model Structure using Identical Parameters');
set(gcf,'PaperType','usLetter','PaperOrientation','portrait',...
        'PaperUnits','Inches','PaperPositionMode','Manual') 
set(gcf,'PaperPosition',[0 0 3.5 3.5],'Position',[100 100 350 350]) 
saveas(gcf,'WRR07.png','png')
print('-depsc2','-r600','Figure3.eps')

%% Plot June,July,August Simulations
CF = cd;
clear all;
close all;

CF = cd();
cd('C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU1-1SZ\')
S1 =  importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd('C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU2-1SZ\')
S2 =  importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd('C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU3-1SZ\')
S3 =  importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd('C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU1-C-2SZ\')
OMC1 = load('OBS_MC_NaCl_XS_460.txt');
OSTS1 = load('OBS_STS_NaCl_XS_460.txt');
C1 =  importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd('C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU2-C-2SZ\')
OMC2 = load('OBS_MC_NaCl_XS_460.txt');
OSTS2 = load('OBS_STS_NaCl_XS_460.txt');
C2 =  importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd('C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU3-C-2SZ\')
OMC3 = load('OBS_MC_NaCl_XS_460.txt');
OSTS3 = load('OBS_STS_NaCl_XS_460.txt');
C3 =  importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd('C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU1-N-2SZ\')
N1 =  importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd('C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU2-N-2SZ\')
N2 =  importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd('C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU3-N-2SZ\')
N3 =  importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd(CF)
sz = 10;
lwt=1;

figure(7); 
subplot(1,4,1);%LAU1
plot (OMC1(2:size(OMC1,1),1),OMC1(2:size(OMC1,1),2),'o','MarkerSize',5,'Color',[.5 .5 .5],'MarkerFaceColor',[.5 .5 .5]);
hold on;
plot (OSTS1(2:size(OSTS1,1),1),OSTS1(2:size(OSTS1,1),2),'kx','MarkerSize',5);
plot (C1.data(:,1),C1.data(:,2),'b','LineWidth',lwt);
plot (C1.data(:,1),C1.data(:,3),'--b','LineWidth',lwt);
plot (C1.data(:,1),C1.data(:,4),'k','LineWidth',lwt);
plot (N1.data(:,1),N1.data(:,2),'r','LineWidth',lwt);
plot (N1.data(:,1),N1.data(:,3),'--r','LineWidth',lwt);
plot (N1.data(:,1),N1.data(:,4),'m','LineWidth',lwt);
plot (S1.data(:,1),S1.data(:,2),'g','LineWidth',lwt);
plot (S1.data(:,1),S1.data(:,3),'c','LineWidth',lwt);
xlim([0 20])
text(20, 20,'A','VerticalAlignment','Top','HorizontalAlignment','Right',...
    'FontName','Times New Roman', 'FontSize',sz,'EdgeColor','Black',...
    'BackgroundColor','Black','Color','White')
xlabel('Time (hr)','FontName','Times New Roman','FontSize',sz)
ylabel('C (mg/L)','FontName','Times New Roman','FontSize',sz)
set(gca,'FontName','Times New Roman','FontSize',sz)
h1 = gca;

subplot(1,4,2); %LAU2
plot (OMC2(2:size(OMC2,1),1),OMC2(2:size(OMC2,1),2),'o','MarkerSize',5,'Color',[.5 .5 .5],'MarkerFaceColor',[.5 .5 .5]);
hold on;
plot (OSTS2(2:size(OSTS2,1),1),OSTS2(2:size(OSTS2,1),2),'kx','MarkerSize',5);
plot (C2.data(:,1),C2.data(:,2),'b','LineWidth',lwt);
plot (C2.data(:,1),C2.data(:,3),'--b','LineWidth',lwt);
plot (C2.data(:,1),C2.data(:,4),'k','LineWidth',lwt);
plot (N2.data(:,1),N2.data(:,2),'r','LineWidth',lwt);
plot (N2.data(:,1),N2.data(:,3),'--r','LineWidth',lwt);
plot (N2.data(:,1),N2.data(:,4),'m','LineWidth',lwt);
plot (S2.data(:,1),S2.data(:,2),'g','LineWidth',lwt);
plot (S2.data(:,1),S2.data(:,3),'c','LineWidth',lwt);
xlim([0 20])
text(20, 20,'B','VerticalAlignment','Top','HorizontalAlignment','Right',...
    'FontName','Times New Roman', 'FontSize',sz,'EdgeColor','Black',...
    'BackgroundColor','Black','Color','White')
xlabel('Time (hr)','FontName','Times New Roman','FontSize',sz)
set(gca,'YTickLabel',{''});
set(gca,'FontName','Times New Roman','FontSize',sz)
h2 = gca;

subplot(1,2,2); %LAU3
plot (OMC3(2:size(OMC3,1),1),OMC3(2:size(OMC3,1),2),'o','MarkerSize',5,'Color',[.5 .5 .5],'MarkerFaceColor',[.5 .5 .5]);
hold on;
plot (OSTS3(2:size(OSTS3,1),1),OSTS3(2:size(OSTS3,1),2),'kx','MarkerSize',5);
plot (C3.data(:,1),C3.data(:,2),'b','LineWidth',lwt);
plot (C3.data(:,1),C3.data(:,3),'--b','LineWidth',lwt);
plot (C3.data(:,1),C3.data(:,4),'k','LineWidth',lwt);
plot (N3.data(:,1),N3.data(:,2),'r','LineWidth',lwt);
plot (N3.data(:,1),N3.data(:,3),'--r','LineWidth',lwt);
plot (N3.data(:,1),N3.data(:,4),'m','LineWidth',lwt);
plot (S3.data(:,1),S3.data(:,2),'g','LineWidth',lwt);
plot (S3.data(:,1),S3.data(:,3),'c','LineWidth',lwt);
xlim([0 32])
set(gca,'YTickLabel',{''});
text(32, 20,'C','VerticalAlignment','Top','HorizontalAlignment','Right',...
    'FontName','Times New Roman', 'FontSize',sz,'EdgeColor','Black',...
    'BackgroundColor','Black','Color','White')
xlabel('Time (hr)','FontName','Times New Roman','FontSize',sz)
lgd = legend('Observed MC', 'Observed STS', 'C2-SZ MC', 'C2-SZ STS', 'C2-SZ HTS', 'N2-SZ MC', 'N2-SZ STS', 'N2-SZ HTS','1-SZ MC','1-SZ Storage');
set(lgd,'Location','EastOutside','FontSize',sz)
set(gca,'FontName','Times New Roman','FontSize',sz)
h3 = gca;

p = get(h1,'pos');
p(1) = 0.06;
p(2) = 0.2;
p(3) = 0.22;
p(4) = 0.75;
set(h1,'pos',p);

p = get(h2,'pos');
p(1) = 0.3;
p(2) = 0.2;
p(3) = 0.22;
p(4) = 0.75;
set(h2,'pos',p);

p = get(h3,'pos');
p(1) = 0.54;
p(2) = 0.2;
p(3) = 0.22;
p(4) = 0.75;
set(h3,'pos',p);

set(gcf,'PaperType','usLetter','PaperOrientation','portrait',...
        'PaperUnits','Inches','PaperPositionMode','Manual') 
set(gcf,'PaperPosition',[0 0 7 2.5],'Position',[100 100 700 350]) 
print('-dpng','-r400','WRR07.png')
%saveas(gcf,'WRR07.png','png')
print('-depsc2','-r600','Figure4.eps')

%% Plot Fluxes for June
clc;
clear all;
close all;
%
CF = cd;
cd('C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU1-N-2SZ\')
Nest = importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd('C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU1-C-2SZ\')
Comp = importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd('C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU1-1SZ\')
Single = importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd(CF);
sz=10;

figure(11);
subplot(2,3,1)%
plot (Nest.data(:,1),10*Nest.data(:,11),'b','LineWidth',1);
hold on;
plot (Comp.data(:,1),10*Comp.data(:,11),'r','LineWidth',1);
plot (Single.data(:,1),10*Single.data(:,11),'g','LineWidth',1);
%title('Main Channel','FontName','Times New Roman','FontSize',sz)
%xlabel('Time (hr)','FontName','Times New Roman','FontSize',sz)
ylabel('dm/dt (10^-^1 g/s)','FontName','Times New Roman','FontSize',sz)
xlim([ 6 11])
ylim([-1 1])
set(gca,'XTickLabel',{'','','','',''});
set(gca,'GridLineStyle','--');
set(gca,'FontName','Times New Roman','FontSize',sz)
text(11, 1,'A','VerticalAlignment','Top','HorizontalAlignment','Right',...
    'FontName','Times New Roman', 'FontSize',sz,'EdgeColor','Black',...
    'BackgroundColor','Black','Color','White')
p = get(gca,'pos');
p(2) = p(2) - 0.04;
p(4) = p(4) + 0.04;
p(1) = p(1) - 0.04;
set(gca,'pos',p);

subplot(2,3,2)%
plot (Nest.data(:,1),1000*Nest.data(:,12),'b','LineWidth',1);
hold on;
plot (Comp.data(:,1),1000*Comp.data(:,12),'r','LineWidth',1);
plot (Single.data(:,1),1000*Single.data(:,12),'g','LineWidth',1);
%title('STS','FontName','Times New Roman','FontSize',sz)
%xlabel('Time (hr)','FontName','Times New Roman','FontSize',sz)
ylabel('dm/dt (10^-^3 g/s)','FontName','Times New Roman','FontSize',sz)
xlim([ 6 11])
ylim([-1.5 1.5])
set(gca,'FontName','Times New Roman','FontSize',sz)
set(gca,'XTickLabel',{});
set(gca,'GridLineStyle','--');
text(11, 1.5,'B','VerticalAlignment','Top','HorizontalAlignment','Right',...
    'FontName','Times New Roman', 'FontSize',sz,'EdgeColor','Black',...
    'BackgroundColor','Black','Color','White')
p = get(gca,'pos');
p(2) = p(2) - 0.04;
p(4) = p(4) + 0.04;
set(gca,'pos',p)

subplot(2,3,3)%
plot (Nest.data(:,1),10000*Nest.data(:,13),'b','LineWidth',1);
hold on;
plot (Comp.data(:,1),10000*Comp.data(:,13),'r','LineWidth',1);
plot (Single.data(:,1),10000*Single.data(:,12),'g','LineWidth',1);
%title('HTS','FontName','Times New Roman','FontSize',sz)
%xlabel('Time (hr)','FontName','Times New Roman','FontSize',sz)
ylabel('dm/dt (10^-^4 g/s)','FontName','Times New Roman','FontSize',sz)
xlim([ 6 11])
ylim([-2 6])
set(gca,'XTickLabel',{'','','','',''});
set(gca,'GridLineStyle','--');
set(gca,'FontName','Times New Roman','FontSize',sz)
text(11, 6,'C','VerticalAlignment','Top','HorizontalAlignment','Right',...
    'FontName','Times New Roman', 'FontSize',sz,'EdgeColor','Black',...
    'BackgroundColor','Black','Color','White')
p = get(gca,'pos');
p(2) = p(2) - 0.04;
p(4) = p(4) + 0.04;
p(1) = p(1) + 0.04;
set(gca,'pos',p)

subplot(2,3,4)%
plot (Nest.data(:,1),10*Nest.data(:,6),'b','LineWidth',1);
hold on;
plot (Comp.data(:,1),10*Comp.data(:,6),'r','LineWidth',1);
plot (Single.data(:,1),10*Single.data(:,6),'g','LineWidth',1);
%title('Advection','FontName','Times New Roman','FontSize',sz)
xlabel('Time (hr)','FontName','Times New Roman','FontSize',sz)
ylabel('dm/dt (10^-^1 g/s)','FontName','Times New Roman','FontSize',sz)
xlim([ 6 11])
ylim([-1 1])
set(gca,'FontName','Times New Roman','FontSize',sz)
text(11, 1,'D','VerticalAlignment','Top','HorizontalAlignment','Right',...
    'FontName','Times New Roman', 'FontSize',sz,'EdgeColor','Black',...
    'BackgroundColor','Black','Color','White')
p = get(gca,'pos');
p(4) = p(4) + 0.04;
p(1) = p(1) - 0.04;
set(gca,'pos',p);

subplot(2,3,5)%
plot (Nest.data(:,1),1000*Nest.data(:,7),'b','LineWidth',1);
hold on;
plot (Comp.data(:,1),1000*Comp.data(:,7),'r','LineWidth',1);
plot (Single.data(:,1),1000*Single.data(:,7),'g','LineWidth',1);
%title('Dispersion','FontName','Times New Roman','FontSize',sz)
xlabel('Time (hr)','FontName','Times New Roman','FontSize',sz)
ylabel('dm/dt (10^-^3 g/s)','FontName','Times New Roman','FontSize',sz)
xlim([ 6 11])
ylim([-4 4])
set(gca,'FontName','Times New Roman','FontSize',sz)
text(11, 4,'E','VerticalAlignment','Top','HorizontalAlignment','Right',...
    'FontName','Times New Roman', 'FontSize',sz,'EdgeColor','Black',...
    'BackgroundColor','Black','Color','White')
p = get(gca,'pos');
p(4) = p(4) + 0.04;
set(gca,'pos',p);

subplot(2,3,6)%
plot (Nest.data(:,1),1000*Nest.data(:,10),'b','LineWidth',1);
hold on;
plot (Comp.data(:,1),1000*Comp.data(:,10),'r','LineWidth',1);
plot (Single.data(:,1),1000*Single.data(:,10),'g','LineWidth',1);
%title('Storage','FontName','Times New Roman','FontSize',sz)
xlabel('Time (hr)','FontName','Times New Roman','FontSize',sz)
ylabel('dm/dt (10^-^3 g/s)','FontName','Times New Roman','FontSize',sz)
xlim([ 6 11])
ylim([-2 1.5])
set(gca,'FontName','Times New Roman','FontSize',sz)
text(11, 1.5,'F','VerticalAlignment','Top','HorizontalAlignment','Right',...
    'FontName','Times New Roman', 'FontSize',sz,'EdgeColor','Black',...
    'BackgroundColor','Black','Color','White')
p = get(gca,'pos');
p(4) = p(4) + 0.04;
p(1) = p(1) + 0.04;
set(gca,'pos',p);

%xlim([0 0.2])
%legend('N2-SZ','C2-SZ', '1-SZ')
set(gcf,'PaperType','usLetter','PaperOrientation','portrait',...
        'PaperUnits','Inches','PaperPositionMode','Manual') 
set(gcf,'PaperPosition',[0 0 7 3.5],'Position',[0 0 300 300]) 
saveas(gcf,'WRR11.png','png')
print('-depsc2','-r600','Figure6.eps')
%%
clc;
clear all;
close all;

CF = cd;
cd('C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU2-1SZ\')
LAU(1) =  importdata('POPT_.txt','\t' ,1);
cd('C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU2-C-2SZ\')
LAU(2) =  importdata('POPT_.txt','\t' ,1);
cd('C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU2-N-2SZ\')
LAU(3) =  importdata('POPT_.txt','\t' ,1);
cd(CF)

sz=10;
figure(8);
set(gcf,'PaperType','usLetter','PaperOrientation','portrait',...
        'PaperUnits','Inches','PaperPositionMode','Manual') 
set(gcf,'PaperPosition',[0 0 9.5 7],'Position',[0 0 950 700]) 
for j = 1:3    
    %Determine Best Parameters
    n = size(LAU(j).data,1);
    val = sortrows(LAU(j).data,10);
    c = colormap(jet(n));    
    for i=1:6
      if i == 1, m = 6; end;    
      if i == 2, m = 1; end;    
      if i == 3, m = 2; end;    
      if i == 4, m = 3; end;    
      if i == 5, m = 4; end;    
      if i == 6, m = 5; end;    
      if j == 1 && (m == 3 || m == 5)
      else    
          subplot(3,6,6*(j-1)+m)
          for k=1:n
            semilogy(LAU(j).data(k,i+2),LAU(j).data(k,10),'k.','Color',c(k,:),'MarkerSize',10)
            hold on;
          end
      ylim([0.25 10])
      p = get(gca,'pos');
      p(3) = 0.13;
      p(4) = 0.24;
      box on;
      if m == 1; p(1) = 0.06; end;
      if m == 2; p(1) = 0.21; end;
      if m == 3; p(1) = 0.36; end;
      if m == 4; p(1) = 0.51; end;
      if m == 5; p(1) = 0.66; end;
      if m == 6; p(1) = 0.81; end;
      if j == 1; p(2) = 0.63; end;
      if j == 2; p(2) = 0.37; end;
      if j == 3; p(2) = 0.11; end;      
      set(gca,'pos',p);          
      end
      if m == 1
          if j == 1
            ylabel ({'1-SZ RMSE'},'FontName','Times New Roman','FontSize',sz)          
          elseif j == 2
            ylabel ({'C2-SZ RMSE'},'FontName','Times New Roman','FontSize',sz)          
          elseif j == 3
            ylabel ({'N2-SZ RMSE'},'FontName','Times New Roman','FontSize',sz)                      
          end
          xlim([0 1])
          if j == 3
            xlabel ('A (m^2/s)','FontName','Times New Roman','FontSize',12);
          else
            set(gca,'XTickLabel',{''});
          end
      elseif m == 6
          xlim([0 1.5])
          set(gca,'YTickLabel',{''});                      
          if j == 3
            xlabel ('D (m^2/s)','FontName','Times New Roman','FontSize',12);
          else
            set(gca,'XTickLabel',{''});            
          end
      elseif m == 2  
          xlim([0 1])
          set(gca,'YTickLabel',{''});                                
          if j == 3
            xlabel ('A_S_(_T_S_) (m^2)','FontName','Times New Roman','FontSize',12);
          else
            set(gca,'XTickLabel',{''});            
          end
      elseif m == 4
          xlim([0.00001 0.01])
          set(gca,'YTickLabel',{''});                                
          set(gca,'XScale','log')
          set(gca,'XminorTick','on')
          set(gca,'XTick',[0.000001 0.00001 0.0001 0.01])
          if j == 3
            xlabel ('\alpha_S_(_T_S_) (s^-^1)','FontName','Times New Roman','FontSize',12);
          else
            set(gca,'XTickLabel',{''});            
          end
      elseif m == 3 && j >=2
          xlim([0 1])
          set(gca,'YTickLabel',{''});                      
          if j == 3
            xlabel ('A_H_T_S (m^2)','FontName','Times New Roman','FontSize',sz);
          else
            set(gca,'XTickLabel',{''});            
          end
      elseif m == 5  && j >=2
          xlim([0.00001 0.01])
          set(gca,'YTickLabel',{''});                                
          set(gca,'XScale','log')
          set(gca,'XminorTick','on')
          set(gca,'XTick',[0.000001 0.00001 0.0001 0.01])
          if j == 3
            xlabel ('\alpha_H_T_S (s^-^1)','FontName','Times New Roman','FontSize',sz);          
          else
            set(gca,'XTickLabel',{''});            
          end
      end;
      set(gca,'FontName','Times New Roman','FontSize',sz)          
    end
end
set(gcf,'Color','White');
set(gcf, 'InvertHardcopy', 'off');
saveas(gcf,strcat('WRR08.png'),'png')
print('-depsc2','-r600','Figure5.eps')

%% Plot of Residence Time vs Percentage of Total Mass Through SZ
CF = cd;
clc;
clear all;
close all;

CF = cd();
cd('C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU1-1SZ\')
S1 =  importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd('C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU2-1SZ\')
S2 =  importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd('C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU3-1SZ\')
S3 =  importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd('C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU1-C-2SZ\')
OMC1 = load('OBS_MC_NaCl_XS_460.txt');
OSTS1 = load('OBS_STS_NaCl_XS_460.txt');
C1 =  importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd('C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU2-C-2SZ\')
OMC2 = load('OBS_MC_NaCl_XS_460.txt');
OSTS2 = load('OBS_STS_NaCl_XS_460.txt');
C2 =  importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd('C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU3-C-2SZ\')
OMC3 = load('OBS_MC_NaCl_XS_460.txt');
OSTS3 = load('OBS_STS_NaCl_XS_460.txt');
C3 =  importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd('C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU1-N-2SZ\')
N1 =  importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd('C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU2-N-2SZ\')
N2 =  importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd('C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU3-N-2SZ\')
N3 =  importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd(CF)
dt = 0.1;

SMT1 = sum(abs(S1.data(:,11))/2);
SST1 = sum(abs(S1.data(:,12))/2);
CMT1 = sum(abs(C1.data(:,11))/2);
CST1 = sum(abs(C1.data(:,12))/2);
CHT1 = sum(abs(C1.data(:,13))/2);
NMT1 = sum(abs(N1.data(:,11))/2);    
NST1 = sum(abs(N1.data(:,12))/2);
NHT1 = sum(abs(N1.data(:,13))/2);

SMT2 = sum(abs(S2.data(:,11))/2);
SST2 = sum(abs(S2.data(:,12))/2);
CMT2 = sum(abs(C2.data(:,11))/2);    
CST2 = sum(abs(C2.data(:,12))/2);
CHT2 = sum(abs(C2.data(:,13))/2);
NMT2 = sum(abs(N2.data(:,11))/2);    
NST2 = sum(abs(N2.data(:,12))/2);
NHT2 = sum(abs(N2.data(:,13))/2);

SMT3 = sum(abs(S3.data(:,11))/2);
SST3 = sum(abs(S3.data(:,12))/2);
CMT3 = sum(abs(C3.data(:,11))/2);    
CST3 = sum(abs(C3.data(:,12))/2);
CHT3 = sum(abs(C3.data(:,13))/2);
NMT3 = sum(abs(N3.data(:,11))/2);    
NST3 = sum(abs(N3.data(:,12))/2);
NHT3 = sum(abs(N3.data(:,13))/2);

mymark = {('bo')... 
          ('bx')... 
          ('b+')...
          ('bv')...
          ('bs')...
          ('ro')... 
          ('rx')... 
          ('r+')...
          ('rv')...
          ('rs')...          
          ('go')... 
          ('gx')... 
          ('g+')...
          ('gv')...
          ('gs')};
mymark2 = {('ko')... 
          ('kx')... 
          ('k+')...
          ('kv')...
          ('ks')};      
figure(12);

x = [CST1/CMT1/0.411*0.206  ;...
     CHT1/CMT1/0.411*0.589  ;... 
     NST1/NMT1/0.418*0.209  ;... 
     NHT1/NMT1/0.418*0.606  ;... 
     SST1/SMT1/0.618*0.330  ;...
     CST2/CMT2/0.331*0.165  ;... 
     CHT2/CMT2/0.331*0.145  ;...
     NST2/NMT2/0.339*0.170  ;... 
     NHT2/NMT2/0.339*0.129  ;... 
     SST2/SMT2/0.471*0.129  ;... 
     CST3/CMT3/0.134*0.0515 ;...
     CHT3/CMT3/0.134*0.151  ;...
     NST3/NMT3/0.137*0.0529 ;...
     NHT3/NMT3/0.137*0.155  ;...
     SST3/SMT3/0.331*0.125 ];

y = [ 114   ;...
      15594 ;...
      89    ;...      
      16381 ;...
      9870  ;...
      237   ;...
      5297  ;...
      203   ;...
      5093  ;...
      2361  ;...      
      240   ;...
      23575 ; ...
      180   ;...
      15702 ;...
      17921 ];
  
%for i = 1:5
%    plot(x(i),y(i),mymark2{i},'LineWidth',1);
%    hold on;
%end;


%lgnd = legend('STS,C','HTS,C', 'STS,N', 'HTS,N','1-SZ');
%set(lgnd,'color','none','Location','SouthEast');       

for i = 1:15
    plot(x(i),y(i),mymark{i},'LineWidth',1);
    %plot(x(i),y(i),mymark{i},'color',mycol(i,:));
    hold on;
end;
sz=10;
%legend('Jun C2-SZ STS','Jun C2-SZ HTS', 'Jun N2-SZ STS', 'Jun N2-SZ HTS','Jun 1-SZ',...
       %'Jul C2-SZ STS','Jul C2-SZ HTS', 'Jul N2-SZ STS', 'Jul N2-SZ HTS','Jul 1-SZ',...
       %'Aug C2-SZ STS','Aug C2-SZ HTS', 'Aug N2-SZ STS', 'Aug N2-SZ HTS','Aug 1-SZ')
%legend('Location','SouthEast')
set(gca,'XScale','log')
set(gca,'YScale','log')
%title('Comparison of Residence Time and Mass per Model Structure for each Experiment','FontName','Times New Roman','FontSize',sz)
xlabel('Mass Ratio','FontName','Times New Roman','FontSize',sz)
ylabel('Residence Time (s)','FontName','Times New Roman','FontSize',sz)
set(gca,'FontName','Times New Roman','FontSize',sz)
set(gcf,'PaperType','usLetter','PaperOrientation','portrait',...
        'PaperUnits','Inches','PaperPositionMode','Manual') 
set(gcf,'PaperPosition',[0 0 3.5 3.5],'Position',[0 0 300 300]) 
saveas(gcf,strcat('WRR12.png'),'png')        
print('-depsc2','-r600','Figure7.eps')