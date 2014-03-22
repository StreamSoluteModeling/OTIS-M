%***********************************************************************
%
%     Subroutine METRICS            Called by: 
%
%     ...
%
%***********************************************************************
%
%% Simulate System with no Hyporheic Storage
%Fill Parameters
I = 1;
for Reach = 1:NREACH
    for Segment = I:LASTSEG(Reach);
        AREA3(Segment) = 0;
    end;
    I = LASTSEG(Reach) + 1;
end;
%Run the model
pcase = 4;
MAININIT            % Compute Initial Concentration
if strcmp(CHEM,'Steady-State')==0
    MAINRUN         % Perform Dynamic Simulation
end;
%% Simulate System with No Storage
%Fill Parameters
I = 1;
for Reach = 1:NREACH
    for Segment = I:LASTSEG(Reach);
        AREA2(Segment) = 0;
    end;
    I = LASTSEG(Reach) + 1;
end;
%Run the model
pcase = 3;
if INEST == 1
    TNEST = 1;
    INEST = 0;
end;
MAININIT            % Compute Initial Concentration
if strcmp(CHEM,'Steady-State')==0
    MAINRUN         % Perform Dynamic Simulation
end;

%%
cd(CF);
I = 1;
MTSMC = load(strcat('PTS_MC_',NAMESOL(Sol,:),'_XS_',num2str(RPRTLOC(I)),'.txt'));
MTSSTS = load(strcat('PTS_STS_',NAMESOL(Sol,:),'_XS_',num2str(RPRTLOC(I)),'.txt'));
MTSHTS = load(strcat('PTS_HTS_',NAMESOL(Sol,:),'_XS_',num2str(RPRTLOC(I)),'.txt'));
MNTSMC = load(strcat('PNTS_MC_',NAMESOL(Sol,:),'_XS_',num2str(RPRTLOC(I)),'.txt'));
MNHTSMC = load(strcat('PNHTS_MC_',NAMESOL(Sol,:),'_XS_',num2str(RPRTLOC(I)),'.txt'));
MNHTSSTS = load(strcat('PNHTS_STS_',NAMESOL(Sol,:),'_XS_',num2str(RPRTLOC(I)),'.txt'));
cd(WF);
figure(4);
plot(MTSMC(:,1),MTSMC(:,2),'r')
hold on;
plot(MNTSMC(:,1),MNTSMC(:,2),'b')
plot(MNHTSMC(:,1),MNHTSMC(:,2),'g')
figure(3);

MTSMC(1,3)    = MTSMC(1,2);
MTSSTS(1,3)   = MTSSTS(1,2);
MTSHTS(1,3)   = MTSHTS(1,2);
MNTSMC(1,3)   = MNTSMC(1,2);
MNHTSMC(1,3)  = MNHTSMC(1,2);
MNHTSSTS(1,3) = MNHTSSTS(1,2);
J = size(MTSMC,1);
for K = 2:J
    MTSMC(K,3)    = MTSMC(K,2)   + MTSMC(K-1,3);
    MTSSTS(K,3)   = MTSSTS(K,2)  + MTSSTS(K-1,3);
    MTSHTS(K,3)   = MTSHTS(K,2)  + MTSHTS(K-1,3);
    MNTSMC(K,3)   = MNTSMC(K,2)  + MNTSMC(K-1,3);
    MNHTSMC(K,3)  = MNHTSMC(K,2) + MNHTSMC(K-1,3);
    MNHTSSTS(K,3) = MNHTSSTS(K,2)+ MNHTSSTS(K-1,3);
end
%
MTSMC(:,3)    = PSTEP*MTSMC(:,3);
MTSSTS(:,3)   = PSTEP*MTSSTS(:,3);
MTSHTS(:,3)   = PSTEP*MTSHTS(:,3);
MNTSMC(:,3)   = PSTEP*MNTSMC(:,3);
MNHTSMC(:,3)  = PSTEP*MNHTSMC(:,3);
MNHTSSTS(:,3) = PSTEP*MNHTSSTS(:,3);

for K = 2:J
    MTSMC(K,4)    = MTSMC(K,1)   * MTSMC(K,2);
    MTSSTS(K,4)   = MTSSTS(K,1)  * MTSSTS(K,2);
    MTSHTS(K,4)   = MTSHTS(K,1)  * MTSHTS(K,2);
    MNTSMC(K,4)   = MNTSMC(K,1)  * MNTSMC(K,2);
    MNHTSMC(K,4)  = MNHTSMC(K,1) * MNHTSMC(K,2);
    MNHTSSTS(K,4) = MNHTSSTS(K,1)* MNHTSSTS(K,2);

end        
%
TmeanMTSMC = sum(MTSMC(:,4))/MTSMC(J,3)*PSTEP;
TmeanMTSSTS = sum(MTSSTS(:,4))/MTSSTS(J,3)*PSTEP;
TmeanMTSHTS = sum(MTSHTS(:,4))/MTSHTS(J,3)*PSTEP;
TmeanMNTSMC = sum(MNTSMC(:,4))/MNTSMC(J,3)*PSTEP;
TmeanMNHTSMC = sum(MNHTSMC(:,4))/MNHTSMC(J,3)*PSTEP;
TmeanMNHTSSTS = sum(MNHTSSTS(:,4))/MNHTSSTS(J,3)*PSTEP;        
%
for K = 1:J
    if MTSMC(K,3)<= 0.5*MTSMC(J,3)            
        TmedMTSMC = MTSMC(K,1);
    end
    if MTSSTS(K,3)<= 0.5*MTSSTS(J,3)                
        TmedMTSSTS = MTSSTS(K,1);
    end
    if MTSHTS(K,3)<= 0.5*MTSHTS(J,3)                
        TmedMTSHTS = MTSHTS(K,1);
    end
    if MNTSMC(K,3)<= 0.5*MNTSMC(J,3)                
        TmedMNTSMC = MNTSMC(K,1);
    end
    if MNHTSMC(K,3)<= 0.5*MNHTSMC(J,3)                
        TmedMNHTSMC = MNHTSMC(K,1);
    end
    if MNHTSSTS(K,3)<= 0.5*MNHTSSTS(J,3)                
        TmedMNHTSSTS = MNHTSSTS(K,1);      
    end
end
     
%        save('MC_NTS.txt','NTS','-ASCII')
%        save('MC_STS.txt','STS','-ASCII')
figure (5)
subplot(2,1,1)
plot(MTSMC(:,1),MTSMC(:,2),'r')
hold on;
plot(MTSSTS(:,1),MTSSTS(:,2),'b')
plot(MTSHTS(:,1),MTSHTS(:,2),'g')
plot(MNTSMC(:,1),MNTSMC(:,2),'c')
plot(MNHTSMC(:,1),MNHTSMC(:,2),'m')
plot(MNHTSSTS(:,1),MNHTSSTS(:,2),'k')
subplot(2,1,2)
plot(MTSMC(:,1),MTSMC(:,3),'r')
hold on;
plot(MTSSTS(:,1),MTSSTS(:,3),'b')
plot(MTSHTS(:,1),MTSHTS(:,3),'g')
plot(MNTSMC(:,1),MNTSMC(:,3),'c')
plot(MNHTSMC(:,1),MNHTSMC(:,3),'m')
plot(MNHTSSTS(:,1),MNHTSSTS(:,3),'k')
