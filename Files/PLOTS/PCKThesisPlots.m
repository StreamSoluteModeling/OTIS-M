%% Plot Field Results
clc;
close all;
clear all;

CF = cd();
cd('C:\Users\pkerr\Desktop\Model\OTIS-M\Files\LAU1-1SZ\')
LAU1B = load('BOUNDARY.txt');
LAU1M = load('OBS_MC_NaCl_XS_460.txt');
cd('C:\Users\pkerr\Desktop\Model\OTIS-M\Files\LAU2-1SZ\')
LAU2B = load('BOUNDARY.txt');
LAU2M = load('OBS_MC_NaCl_XS_460.txt');
cd('C:\Users\pkerr\Desktop\Model\OTIS-M\Files\LAU3-1SZ\')
LAU3B = load('BOUNDARY.txt');
LAU3M = load('OBS_MC_NaCl_XS_460.txt');
cd(CF)

figure(9);
subplot(3,1,1)
plot(LAU1M(2:end,1)-5.5,LAU1M(2:end,2),'b','Linewidth',2)
hold on;
plot(LAU1B(2:end,1)-5.5,LAU1B(2:end,2),'r','Linewidth',2)
xlim([0 15])
ylabel('C (mg/L)','FontName','Times New Roman','FontSize',12)
legend('460m','5m')
set(gca,'FontName','Times New Roman','FontSize',12)

subplot(3,1,2)
plot(LAU2M(2:end,1)-1.1,LAU2M(2:end,2),'b','Linewidth',2)
hold on;
plot(LAU2B(2:end,1)-1.1,LAU2B(2:end,2),'r','Linewidth',2)
xlim([0 15])
ylabel('C (mg/L)','FontName','Times New Roman','FontSize',12)
set(gca,'FontName','Times New Roman','FontSize',12)

subplot(3,1,3)
plot(LAU3M(2:end,1)-7.4,LAU3M(2:end,2),'b','Linewidth',2)
hold on;
plot(LAU3B(2:end,1)-7.4,LAU3B(2:end,2),'r','Linewidth',2)
xlim([0 15])
xlabel('Time since Injection (hr)','FontName','Times New Roman','FontSize',12)
ylabel('C (mg/L)','FontName','Times New Roman','FontSize',12)
set(gca,'FontName','Times New Roman','FontSize',12)
set(gcf,'PaperType','usLetter','PaperOrientation','portrait','PaperUnits','Centimeters','PaperPositionMode','Manual') 
set(gcf,'PaperPosition',[10 10 15 12],'Position',[0 0 600 500]) 
saveas(gcf,'Figure9.png','png')

%% Plot Conceptual Figure 2
clc;
clear all;
close all;

CF = cd();
cd('C:\Users\pkerr\Desktop\Model\OTIS-M\Files\Figure2AD\')
OBS = load('OBS_MC_NaCl_XS_75.txt');
AD =  importdata('PTS_NaCl_XS_75.txt','\t' ,2);
cd('C:\Users\pkerr\Desktop\Model\OTIS-M\Files\Figure2\')
TS =  importdata('PTS_NaCl_XS_75.txt','\t' ,2);
cd(CF)

figure(2);
plot(OBS(2:end,1),OBS(2:end,2),'bo','Linewidth',2)
hold on;
plot(AD.data(:,1),AD.data(:,2),'r','Linewidth',2)
plot(TS.data(:,1),TS.data(:,2),'g','Linewidth',2)
xlim([0.07 0.12])
xlabel('Time since Injection (hr)','FontName','Times New Roman','FontSize',12)
ylabel('C (mg/L)','FontName','Times New Roman','FontSize',12)
legend('Experimental Points','Dead Zone Model','Dispersion Model')
set(gca,'FontName','Times New Roman','FontSize',12)
set(gcf,'PaperType','usLetter','PaperOrientation','portrait','PaperUnits','Centimeters','PaperPositionMode','Manual') 
set(gcf,'PaperPosition',[10 10 15 12],'Position',[0 0 600 500]) 
saveas(gcf,'Figure2.png','png')

%% Plot June,July,August Simulations
CF = cd;
clear all;
close all;

CF = cd();
cd('C:\Users\pkerr\Desktop\Model\OTIS-M\Files\LAU1-1SZ\')
S1 =  importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd('C:\Users\pkerr\Desktop\Model\OTIS-M\Files\LAU2-1SZ\')
S2 =  importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd('C:\Users\pkerr\Desktop\Model\OTIS-M\Files\LAU3-1SZ\')
S3 =  importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd('C:\Users\pkerr\Desktop\Model\OTIS-M\Files\LAU1-C-2SZ\')
OMC1 = load('OBS_MC_NaCl_XS_460.txt');
OSTS1 = load('OBS_STS_NaCl_XS_460.txt');
C1 =  importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd('C:\Users\pkerr\Desktop\Model\OTIS-M\Files\LAU2-C-2SZ\')
OMC2 = load('OBS_MC_NaCl_XS_460.txt');
OSTS2 = load('OBS_STS_NaCl_XS_460.txt');
C2 =  importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd('C:\Users\pkerr\Desktop\Model\OTIS-M\Files\LAU3-C-2SZ\')
OMC3 = load('OBS_MC_NaCl_XS_460.txt');
OSTS3 = load('OBS_STS_NaCl_XS_460.txt');
C3 =  importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd('C:\Users\pkerr\Desktop\Model\OTIS-M\Files\LAU1-N-2SZ\')
N1 =  importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd('C:\Users\pkerr\Desktop\Model\OTIS-M\Files\LAU2-N-2SZ\')
N2 =  importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd('C:\Users\pkerr\Desktop\Model\OTIS-M\Files\LAU3-N-2SZ\')
N3 =  importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd(CF)

figure(11); %LAU1
plot (OMC1(2:size(OMC1,1),1),OMC1(2:size(OMC1,1),2),'ko');
hold on;
plot (OSTS1(2:size(OSTS1,1),1),OSTS1(2:size(OSTS1,1),2),'kx');
plot (C1.data(:,1),C1.data(:,2),'b');
plot (C1.data(:,1),C1.data(:,3),'--b');
plot (C1.data(:,1),C1.data(:,4),':b');
plot (N1.data(:,1),N1.data(:,2),'r');
plot (N1.data(:,1),N1.data(:,3),'--r');
plot (N1.data(:,1),N1.data(:,4),':r');
plot (S1.data(:,1),S1.data(:,2),'g');
plot (S1.data(:,1),S1.data(:,3),'--g');
xlim([5 20])
legend('Observed MC', 'Observed STS', 'Competing MC', 'Competing STS', 'Competing HTS', 'Nested MC', 'Nested STS', 'Nested HTS','1-SZ MC','1-SZ Storage Zone')
xlabel('Time (hr)','FontName','Times New Roman','FontSize',12)
ylabel('C (mg/L)','FontName','Times New Roman','FontSize',12)
set(gca,'FontName','Times New Roman','FontSize',12)
set(gcf,'PaperType','usLetter','PaperOrientation','portrait','PaperUnits','Centimeters','PaperPositionMode','Manual') 
set(gcf,'PaperPosition',[10 10 15 12],'Position',[0 0 600 500]) 
saveas(gcf,'Figure11.png','png')

figure(12); %LAU2
plot (OMC2(2:size(OMC2,1),1),OMC2(2:size(OMC2,1),2),'ko');
hold on;
plot (OSTS2(2:size(OSTS2,1),1),OSTS2(2:size(OSTS2,1),2),'kx');
plot (C2.data(:,1),C2.data(:,2),'b');
plot (C2.data(:,1),C2.data(:,3),'--b');
plot (C2.data(:,1),C2.data(:,4),':b');
plot (N2.data(:,1),N2.data(:,2),'r');
plot (N2.data(:,1),N2.data(:,3),'--r');
plot (N2.data(:,1),N2.data(:,4),':r');
plot (S2.data(:,1),S2.data(:,2),'g');
plot (S2.data(:,1),S2.data(:,3),'--g');
xlim([0 20])
legend('Observed MC', 'Observed STS', 'Competing MC', 'Competing STS', 'Competing HTS', 'Nested MC', 'Nested STS', 'Nested HTS','1-SZ MC','1-SZ Storage Zone')
xlabel('Time (hr)','FontName','Times New Roman','FontSize',12)
ylabel('C (mg/L)','FontName','Times New Roman','FontSize',12)
set(gca,'FontName','Times New Roman','FontSize',12)
set(gcf,'PaperType','usLetter','PaperOrientation','portrait','PaperUnits','Centimeters','PaperPositionMode','Manual') 
set(gcf,'PaperPosition',[10 10 15 12],'Position',[0 0 600 500]) 
saveas(gcf,'Figure12.png','png')

figure(13); %LAU3
plot (OMC3(2:size(OMC3,1),1),OMC3(2:size(OMC3,1),2),'ko');
hold on;
plot (OSTS3(2:size(OSTS3,1),1),OSTS3(2:size(OSTS3,1),2),'kx');
plot (C3.data(:,1),C3.data(:,2),'b');
plot (C3.data(:,1),C3.data(:,3),'--b');
plot (C3.data(:,1),C3.data(:,4),':b');
plot (N3.data(:,1),N3.data(:,2),'r');
plot (N3.data(:,1),N3.data(:,3),'--r');
plot (N3.data(:,1),N3.data(:,4),':r');
plot (S3.data(:,1),S3.data(:,2),'g');
plot (S3.data(:,1),S3.data(:,3),'--g');
xlim([5 32])
legend('Observed MC', 'Observed STS', 'Competing MC', 'Competing STS', 'Competing HTS', 'Nested MC', 'Nested STS', 'Nested HTS','1-SZ MC','1-SZ Storage Zone')
xlabel('Time (hr)','FontName','Times New Roman','FontSize',12)
ylabel('C (mg/L)','FontName','Times New Roman','FontSize',12)
set(gca,'FontName','Times New Roman','FontSize',12)
set(gcf,'PaperType','usLetter','PaperOrientation','portrait','PaperUnits','Centimeters','PaperPositionMode','Manual') 
set(gcf,'PaperPosition',[10 10 15 12],'Position',[0 0 600 500]) 
saveas(gcf,'Figure13.png','png')

%% Plot June Slug Results
clc;
clear all;
close all;

CF = cd;
cd('C:\Users\pkerr\Desktop\Model\OTIS-M\Files\Slug-1SZ\')
OMC = load('OBS_MC_NaCl_XS_75.txt');
OSTS = load('OBS_STS_NaCl_XS_75.txt');
S1 =  importdata('PTS_NaCl_XS_75.txt','\t' ,2);
cd('C:\Users\pkerr\Desktop\Model\OTIS-M\Files\Slug-C-2SZ\')
%C1 =  importdata('PTS_NaCl_XS_75.txt','\t' ,2);
cd('C:\Users\pkerr\Desktop\Model\OTIS-M\Files\Slug-N-2SZ\')
%N1 =  importdata('PTS_NaCl_XS_75.txt','\t' ,2);
cd(CF);
%
%
figure(14); %LAU1
plot (OMC(2:size(OMC,1),1),OMC(2:size(OMC,1),2),'ko');
hold on;
plot (OSTS(2:size(OSTS,1),1),OSTS(2:size(OSTS,1),2),'kx');
plot (S1.data(:,1),S1.data(:,2),'b');
plot (S1.data(:,1),S1.data(:,3),'--r');
xlim([0 0.2])
legend('Observed MC', 'Observed STS', '1-SZ MC', '1-SZ STS')
xlabel('Time (hr)','FontName','Times New Roman','FontSize',12)
ylabel('C (mg/L)','FontName','Times New Roman','FontSize',12)
set(gca,'FontName','Times New Roman','FontSize',12)
set(gcf,'PaperType','usLetter','PaperOrientation','portrait','PaperUnits','Centimeters','PaperPositionMode','Manual') 
set(gcf,'PaperPosition',[10 10 15 12],'Position',[0 0 600 500]) 
saveas(gcf,'Figure14.png','png')
%% Plot Fluxes for June
clc;
clear all;
close all;
%
CF = cd;
cd('C:\Users\pkerr\Desktop\Model\OTIS-M\Files\LAU1-N-2SZ\')
Nest = importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd('C:\Users\pkerr\Desktop\Model\OTIS-M\Files\LAU1-C-2SZ\')
Comp = importdata('PTS_NaCl_XS_460.txt','\t' ,2);
cd(CF);

figure(24);
subplot(2,2,1)%
plot (Nest.data(:,1),Nest.data(:,11),'b');
hold on;
plot (Comp.data(:,1),Comp.data(:,11),'r');
title('MC')
xlabel('Time (hr)','FontName','Times New Roman','FontSize',12)
ylabel('Flux (dm/dt)','FontName','Times New Roman','FontSize',12)
set(gca,'FontName','Times New Roman','FontSize',12)

subplot(2,2,2)%
plot (Nest.data(:,1),Nest.data(:,12),'b');
hold on;
plot (Comp.data(:,1),Comp.data(:,12),'r');
title('STS')
xlabel('Time (hr)','FontName','Times New Roman','FontSize',12)
ylabel('Flux (dm/dt)','FontName','Times New Roman','FontSize',12)
set(gca,'FontName','Times New Roman','FontSize',12)

subplot(2,2,3)%
plot (Nest.data(:,1),Nest.data(:,13),'b');
hold on;
plot (Comp.data(:,1),Comp.data(:,13),'r');
title('HTS')
xlabel('Time (hr)','FontName','Times New Roman','FontSize',12)
ylabel('Flux (dm/dt)','FontName','Times New Roman','FontSize',12)
set(gca,'FontName','Times New Roman','FontSize',12)

subplot(2,2,4)%
plot (Nest.data(:,1),Nest.data(:,10),'b');
hold on;
plot (Comp.data(:,1),Comp.data(:,10),'r');
title('Storage')
xlabel('Time (hr)','FontName','Times New Roman','FontSize',12)
ylabel('Flux (dm/dt)','FontName','Times New Roman','FontSize',12)
set(gca,'FontName','Times New Roman','FontSize',12)

%xlim([0 0.2])
legend('Nested','Competing')
set(gcf,'PaperType','usLetter','PaperOrientation','portrait','PaperUnits','Centimeters','PaperPositionMode','Manual') 
set(gcf,'PaperPosition',[10 10 15 12],'Position',[0 0 600 500]) 
saveas(gcf,'Figure24.png','png')
%%
clc;
clear all;
close all;

CF = cd;
cd('C:\Users\pkerr\Desktop\Model\OTIS-M\Files\LAU1-1SZ\')
LAU(1) = importdata('POPT_.txt','\t' ,1);
cd('C:\Users\pkerr\Desktop\Model\OTIS-M\Files\LAU2-1SZ\')
LAU(2) =  importdata('POPT_.txt','\t' ,1);
cd('C:\Users\pkerr\Desktop\Model\OTIS-M\Files\LAU3-1SZ\')
LAU(3) =  importdata('POPT_.txt','\t' ,1);
cd('C:\Users\pkerr\Desktop\Model\OTIS-M\Files\LAU1-C-2SZ\')
LAU(4) =  importdata('POPT_.txt','\t' ,1);
cd('C:\Users\pkerr\Desktop\Model\OTIS-M\Files\LAU2-C-2SZ\')
LAU(5) =  importdata('POPT_.txt','\t' ,1);
cd('C:\Users\pkerr\Desktop\Model\OTIS-M\Files\LAU3-C-2SZ\')
LAU(6) =  importdata('POPT_.txt','\t' ,1);
cd('C:\Users\pkerr\Desktop\Model\OTIS-M\Files\LAU1-N-2SZ\')
LAU(7) =  importdata('POPT_.txt','\t' ,1);
cd('C:\Users\pkerr\Desktop\Model\OTIS-M\Files\LAU2-N-2SZ\')
LAU(8) =  importdata('POPT_.txt','\t' ,1);
cd('C:\Users\pkerr\Desktop\Model\OTIS-M\Files\LAU3-N-2SZ\')
LAU(9) =  importdata('POPT_.txt','\t' ,1);
cd(CF)


iplot = 1;
for j = 1:9    
    %Determine Best Parameters
    n = size(LAU(j).data,1);
    val = sortrows(LAU(j).data,10);
    disp(j)
    disp(val(1,3))
    disp(val(1,4))
    disp(val(1,5))
    disp(val(1,6))
    disp(val(1,7))
    disp(val(1,8))
    disp(val(1,10))
    if iplot==1
        %Plot Sensitivity
        c = colormap(jet(n));
        figure(14+j);
        for i=1:6
          if i == 1, m = 2; end;
          if i == 2, m = 1; end;
          if i == 3, m = 3; end;
          if i == 4, m = 5; end;
          if i == 5, m = 4; end;
          if i == 6, m = 6; end;
          if m > 4 && j <= 3
          else    
              subplot(3,2,m)
              for k=1:n
                semilogy(LAU(j).data(k,i+2),LAU(j).data(k,10),'k.','Color',c(k,:),'MarkerSize',10)
                hold on;
              end
          end
          if m == 1 
              xlabel ('A (m^2/s)','FontName','Times New Roman','FontSize',12);
              xlim([0 1])
          elseif m == 2
              xlabel ('D (m^2/s)','FontName','Times New Roman','FontSize',12);
              xlim([0 1.5])
          elseif m == 3 && j <= 3              
              xlabel ('A_S (m^2)','FontName','Times New Roman','FontSize',12);
              xlim([0 1])
          elseif m == 3 && j > 3              
              xlabel ('A_S_T_S (m^2)','FontName','Times New Roman','FontSize',12);
              xlim([0 1])              
          elseif m == 4 && j <= 3
              xlabel ('\alpha_S (s^-^1)','FontName','Times New Roman','FontSize',12);
              xlim([0.00001 0.01])
              set(gca,'XScale','log')
              set(gca,'XminorTick','on')
              set(gca,'XTick',[0.000001 0.00001 0.0001 0.01])
          elseif m == 4 && j > 3
              xlabel ('\alpha_S_T_S (s^-^1)','FontName','Times New Roman','FontSize',12);
              xlim([0.00001 0.01])              
              set(gca,'XScale','log')              
              set(gca,'XminorTick','on')
              set(gca,'XTick',[0.000001 0.00001 0.0001 0.01])
          elseif m == 5 && j > 3
              xlabel ('A_H_T_S (m^2)','FontName','Times New Roman','FontSize',12);
              xlim([0 1])
          elseif m == 6 && j > 3
              xlabel ('\alpha_H_T_S (s^-^1)','FontName','Times New Roman','FontSize',12);
              xlim([0.00001 0.01])
              set(gca,'XScale','log')
              set(gca,'XminorTick','on')
              set(gca,'XTick',[0.000001 0.00001 0.0001 0.01])
          end;      
          ylabel ('RMSE','FontName','Times New Roman','FontSize',12)
          ylim([0.25 10])
          set(gca,'FontName','Times New Roman','FontSize',12)          
        end
        set(gcf,'PaperType','usLetter','PaperOrientation','portrait',...
                'PaperUnits','Centimeters','PaperPositionMode','Manual') 
        set(gcf,'PaperPosition',[10 10 15 20],'Position',[0 0 600 800]) 
        saveas(gcf,strcat('Figure',num2str(j+14),'.png'),'png')        
    end
end
%%
clc;
clear all;
close all;

CF = cd;
cd('C:\Users\pkerr\Desktop\Model\OTIS-M\Files\Conceptual1-C-2SZ\')
COMP =  importdata('PTS_Solute_XS_200.txt','\t' ,2);
cd('C:\Users\pkerr\Desktop\Model\OTIS-M\Files\Conceptual1-N-2SZ\')
NEST =  importdata('PTS_Solute_XS_200.txt','\t' ,2);
cd(CF);

figure(10)
plot(COMP.data(:,1),COMP.data(:,2),'b','LineWidth', 2)
hold on;
plot(COMP.data(:,1),COMP.data(:,3),'--b','LineWidth', 2)
plot(COMP.data(:,1),COMP.data(:,4),':b','LineWidth', 2)
plot(NEST.data(:,1),NEST.data(:,2),'r','LineWidth', 2)
plot(NEST.data(:,1),NEST.data(:,3),'--r','LineWidth', 2)
plot(NEST.data(:,1),NEST.data(:,4),':r','LineWidth', 2)
legend ('MC Competing','STS Competing','HTS Competing','MC Nested', 'STS Nested', 'HTS Nested')
xlabel ('Time (hr)','FontName','Times New Roman','FontSize',12)
ylabel ('Concentration (g/m³)','FontName','Times New Roman','FontSize',12)
set(gca,'FontName','Times New Roman','FontSize',12)
TITLE = strvcat('Conceptual Comparison of Competing versus Nested Transient', 'Storage Model Structure using Identical Parameters');
set(gcf,'PaperType','usLetter','PaperOrientation','portrait','PaperUnits','Centimeters','PaperPositionMode','Manual') 
set(gcf,'PaperPosition',[10 10 15 12],'Position',[0 0 600 500]) 
saveas(gcf,'Figure10.png','png')

close all;