%***********************************************************************
%
%     Subroutine GRAPHS             Called by: OUTPUT 
%
%     Creates Graphs
%
%***********************************************************************
%
% For Each Print Location (4 Graphs)
% 1) MC (OBS) & MC
% 2) STS (OBS) & STS
% 3) HTS 
% 4) ALL 5

cd(CF)
for Sol = 1:NSOLUTE
    for I = 1:NPRINT
        Aex = exist(strcat('OBS_MC_',NAMESOL(Sol,:),'_XS_',num2str(RPRTLOC(I)),'.txt'));
        Bex = exist(strcat('OBS_STS_',NAMESOL(Sol,:),'_XS_',num2str(RPRTLOC(I)),'.txt'));
        Cex = exist(strcat('OBS_',NAMESOL(Sol,:),'_XS_',num2str(RPRTLOC(I)),'.txt'));
        Dex = exist(strcat('OBS_HTS_',NAMESOL(Sol,:),'_XS_',num2str(RPRTLOC(I)),'.txt'));        
        if Aex == 2
            OBSMC = load(strcat('OBS_MC_',NAMESOL(Sol,:),'_XS_',num2str(RPRTLOC(I)),'.txt'));
        end;
        if Bex == 2
            OBSSTS = load(strcat('OBS_STS_',NAMESOL(Sol,:),'_XS_',num2str(RPRTLOC(I)),'.txt'));        
        end;
        if Dex == 2
            OBSHTS = load(strcat('OBS_HTS_',NAMESOL(Sol,:),'_XS_',num2str(RPRTLOC(I)),'.txt'));        
        end;
        if Cex == 2
            OBSALL =  importdata(strcat('OBS_',NAMESOL(Sol,:),'_XS_',num2str(RPRTLOC(I)),'.txt'),'\t' ,2);
            Aex = 2;
            Bex = 2;
            Dex = 2;
            OBSMC = [OBSALL.data(:,1),OBSALL.data(:,2)];
            OBSSTS = [OBSALL.data(:,1),OBSALL.data(:,3)];
            OBSHTS = [OBSALL.data(:,1),OBSALL.data(:,4)];
        end;
        RESULTS = importdata(strcat('PTS_',NAMESOL(Sol,:),'_XS_',num2str(RPRTLOC(I)),'.txt'),'\t',2);
        PRINTMC = [ RESULTS.data(:,1) RESULTS.data(:,2) ];
        PRINTSTS = [ RESULTS.data(:,1) RESULTS.data(:,3) ];
        PRINTHTS = [ RESULTS.data(:,1) RESULTS.data(:,4) ];
        PRINTSED = [ RESULTS.data(:,1) RESULTS.data(:,5) ];
%        scrsz = get(0,'ScreenSize');
%        h = figure('Position',[scrsz(3)/2-600 scrsz(4)/2-450 1200 900]);
        subplot(2,2,1)
           plot(PRINTMC(:,1),PRINTMC(:,2),'g')
           axis([PRINTMC(1,1) PRINTMC(end,1) 0 max(PRINTMC(:,2))])
           hold on;
           if Aex == 2
               plot(OBSMC(:,1),OBSMC(:,2),'b')
               legend('Simulated MC','Observed MC')
           else
               legend('Simulated MC')
           end
           xlabel('t (s)')
        subplot(2,2,2)
           plot(PRINTSTS(:,1),PRINTSTS(:,2),'r')
           axis([PRINTMC(1,1) PRINTMC(end,1) 0 max(PRINTMC(:,2))])   
           hold on;
           if Bex == 2
               plot(OBSSTS(:,1),OBSSTS(:,2),'c')
               legend('Simulated STS','Observed STS')
           else
               legend('Simulated STS')
           end
           xlabel('t (s)')
        subplot(2,2,3)
           plot(PRINTHTS(:,1),PRINTHTS(:,2),'m')
           axis([PRINTMC(1,1) PRINTMC(end,1) 0 max(PRINTMC(:,2))])
           hold on;
           if Dex == 2
               plot(OBSHTS(:,1),OBSHTS(:,2),'k')
               legend('Simulated HTS','Observed HTS')
           else
               legend('Simulated HTS')
           end
           xlabel('t (s)')           
        subplot(2,2,4)
           plot(PRINTMC(:,1),PRINTMC(:,2),'g')
           hold on;
           plot(PRINTSTS(:,1),PRINTSTS(:,2),'r')
           plot(PRINTHTS(:,1),PRINTHTS(:,2),'m')
           axis([PRINTMC(1,1) PRINTMC(end,1) 0 max(PRINTMC(:,2))])   
          
           LEG1 = ['Simulated MC ';...
                   'Simulated STS';...
                   'Simulated HTS';];                   
           if Aex == 2
               plot(OBSMC(:,1),OBSMC(:,2),'b')
               LEG1 = [LEG1; 'Observed MC  '];                       
           end
           if Bex == 2               
               plot(OBSSTS(:,1),OBSSTS(:,2),'c')         
               LEG1 = [LEG1; 'Observed STS '];               
           end
           if Dex == 2               
               plot(OBSHTS(:,1),OBSHTS(:,2),'k')         
               LEG1 = [LEG1; 'Observed HTS '];
           end           
           legend(LEG1)
    end;
end;
cd (WF);
