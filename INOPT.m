%***********************************************************************
%
%     Subroutine INOPT             Called by: INPUT
%
%***********************************************************************
disp('Loading Optimization Data')
cd (CF);
optimize=fopen('OPTIMIZE.txt');
%Load Optimization Variables
I = 1;
while I==1
    J = fgetl(optimize);
    if J == -1
        I = 2;
    elseif size(J,2) < 15
    elseif strcmp(J(1:15),'## OMC ########')==1
        NOMC=str2double(fgetl(optimize));           %Number of MC Data Locations
        NOBSMC=zeros(NOMC,2);                       %1:Location,2:Reach
        JBOUND = 1;
        for K=1:NOMC
            NOBSMC(K,1)=str2double(fgetl(optimize));%Station of MC Data Location
            FID=fgetl(optimize);                    %Observed MC Filename
            TEMP=load(FID);                         %TemporaryDataLoading
            TEMP=[TEMP;99*10^99,0,0];
            KK = 1;
            TIME = TSTART;
            while TFINAL >= TIME
                while TIME >= TEMP(KK+1,1)
                    KK = KK + 1;
                end
                OMC(JBOUND,1) = TEMP(KK,2)+(TIME-TEMP(KK,1))/(TEMP(KK+1,1)-TEMP(KK,1))*(TEMP(KK+1,2)-TEMP(KK,2));
                OMC(JBOUND,2) = TEMP(KK,3)+(TIME-TEMP(KK,1))/(TEMP(KK+1,1)-TEMP(KK,1))*(TEMP(KK+1,3)-TEMP(KK,3));                
                JBOUND = JBOUND + 1;
                TIME = str2double(num2str(TIME + TSTEP));    
            end
            KK=0;
            NOBSMC(K,2)=1;
            for Reach=1:NREACH
                KK=KK+RCHLEN(Reach);
                if KK<=NOBSMC(K,1)
                    NOBSMC(K,2)=Reach+1;
                end
            end
        end
    elseif strcmp(J(1:15),'## OSTS #######')==1     
        NOSTS=str2double(fgetl(optimize));           %Number of STS Data Locations
        NOBSSTS=zeros(NOSTS,2);                       %1:Location,2:Reach
        JBOUND = 1;
        for K=1:NOSTS
            NOBSSTS(K,1)=str2double(fgetl(optimize));%Station of MC Data Location
            FID=fgetl(optimize);                    %Observed MC Filename
            TEMP=load(FID);                         %TemporaryDataLoading
            TEMP=[TEMP;99*10^99,0,0];
            KK = 1;
            TIME = TSTART;
            while TFINAL >= TIME
                while TIME >= TEMP(KK+1,1)
                    KK = KK + 1;
                end
                OSTS(JBOUND,1) = TEMP(KK,2)+(TIME-TEMP(KK,1))/(TEMP(KK+1,1)-TEMP(KK,1))*(TEMP(KK+1,2)-TEMP(KK,2));
                OSTS(JBOUND,2) = TEMP(KK,3)+(TIME-TEMP(KK,1))/(TEMP(KK+1,1)-TEMP(KK,1))*(TEMP(KK+1,3)-TEMP(KK,3));                
                JBOUND = JBOUND + 1;
                TIME = str2double(num2str(TIME + TSTEP));    
            end
            KK=0;
            NOBSSTS(K,2)=1;
            for Reach=1:NREACH
                KK=KK+RCHLEN(Reach);
                if KK<=NOBSSTS(K,1)
                    NOBSSTS(K,2)=Reach+1;
                end
            end
        end
    elseif strcmp(J(1:15),'## OSYSTEM ####')==1
        OSYSTEM=str2double(fgetl(optimize));        %Optimize system instead of individual reaches
    elseif strcmp(J(1:15),'## NGS ########')==1
        ngs = str2double(fgetl(optimize));          %SCEUA: number of complexes (sub-populations)
    elseif strcmp(J(1:15),'## MAXN #######')==1        
        maxn = str2double(fgetl(optimize));         %SCEUA: maximum number of function evaluations allowed during optimization
    elseif strcmp(J(1:15),'## KSTOP ######')==1        
        kstop = str2double(fgetl(optimize));        %SCEUA: maximum number of evolution loops before convergency
    elseif strcmp(J(1:15),'## PCENTO #####')==1        
        pcento = str2double(fgetl(optimize));       %SCEUA: the percentage change allowed in kstop loops before convergency
    elseif strcmp(J(1:15),'## PEPS #######')==1        
        peps = str2double(fgetl(optimize));         %SCEUA:
    elseif strcmp(J(1:15),'## ISEED ######')==1     
        iseed = str2double(fgetl(optimize));        %SCEUA: random seed number
    elseif strcmp(J(1:15),'## INIFLG #####')==1    
        iniflg = str2double(fgetl(optimize));       %SCEUA: flag for initial parameter array
    elseif strcmp(J(1:15),'## ODISP ######')==1
        ODISP(1)=str2double(fgetl(optimize));       %Flag (1-yes, 0=no)
        ODISP(2)=str2double(fgetl(optimize));       %Initial
        ODISP(3)=str2double(fgetl(optimize));       %LowerLimit        
        ODISP(4)=str2double(fgetl(optimize));       %UpperLimit
    elseif strcmp(J(1:15),'## OALPHA #####')==1
        OALPHA(1)=str2double(fgetl(optimize));      %Flag (1-yes, 0=no)
        OALPHA(2)=str2double(fgetl(optimize));      %Initial
        OALPHA(3)=str2double(fgetl(optimize));      %LowerLimit
        OALPHA(4)=str2double(fgetl(optimize));      %UpperLimit
    elseif strcmp(J(1:15),'## OALPHA3 ####')==1
        OALPHA3(1)=str2double(fgetl(optimize));     %Flag (1-yes, 0=no)
        OALPHA3(2)=str2double(fgetl(optimize));     %Initial
        OALPHA3(3)=str2double(fgetl(optimize));     %LowerLimit
        OALPHA3(4)=str2double(fgetl(optimize));     %UpperLimit
    elseif strcmp(J(1:15),'## OAREA ######')==1
        OAREA(1) = str2double(fgetl(optimize));     %Flag (1-yes, 0=no)
        OAREA(2) = str2double(fgetl(optimize));     %Initial
        OAREA(3) = str2double(fgetl(optimize));     %LowerLimit
        OAREA(4) = str2double(fgetl(optimize));     %UpperLimit
    elseif strcmp(J(1:15),'## OAREA2 #####')==1
        OAREA2(1)=str2double(fgetl(optimize));      %Flag (1-yes, 0=no)
        OAREA2(2)=str2double(fgetl(optimize));      %Initial
        OAREA2(3)=str2double(fgetl(optimize));      %LowerLimit
        OAREA2(4)=str2double(fgetl(optimize));      %UpperLimit
    elseif strcmp(J(1:15),'## OAREA3 #####')==1
        OAREA3(1)=str2double(fgetl(optimize));      %Flag (1-yes, 0=no)
        OAREA3(2)=str2double(fgetl(optimize));      %Initial
        OAREA3(3)=str2double(fgetl(optimize));      %LowerLimit
        OAREA3(4)=str2double(fgetl(optimize));      %UpperLimit
    elseif strcmp(J(1:15),'## OQLATIN ####')==1
        OQLATIN(1)=str2double(fgetl(optimize));     %Flag (1-yes, 0=no)
        OQLATIN(2)=str2double(fgetl(optimize));     %Initial
        OQLATIN(3)=str2double(fgetl(optimize));     %LowerLimit
        OQLATIN(4)=str2double(fgetl(optimize));     %Flag (1-yes, 0=no)
    elseif strcmp(J(1:15),'## OAMCSTS ####')==1
        OAMCSTS(1)=str2double(fgetl(optimize));     %Flag (1-yes, 0=no)
        OAMCSTS(2)=str2double(fgetl(optimize));     %Ratio
    end;
end;
fclose(optimize);
cd (WF);
OVAR = 0;
if ODISP(1) == 1
    OVAR = OVAR + 1;
    ODISP(1) = OVAR;
end
if OALPHA(1) == 1
    OVAR = OVAR + 1;
    OALPHA(1) = OVAR;
end
if OALPHA3(1) == 1
    OVAR = OVAR + 1;
    OALPHA3(1) = OVAR;
end
if OAREA(1) == 1
    OVAR = OVAR + 1;
    OAREA(1) = OVAR;
end
if OAREA2(1) == 1
    OVAR = OVAR + 1;
    OAREA2(1) = OVAR;
end
if OAREA3(1) == 1
    OVAR = OVAR + 1;
    OAREA3(1) = OVAR;
end
if OQLATIN(1) == 1
    OVAR = OVAR + 1;
    OQLATIN(1) = OVAR;
end
x0 = zeros(1,OVAR);
bl = zeros(1,OVAR);
bu = zeros(1,OVAR);
if ODISP(1)>0;
    x0(ODISP(1))=ODISP(2);
    bl(ODISP(1))=ODISP(3);
    bu(ODISP(1))=ODISP(4);   
end
if OALPHA(1)>0;
    x0(OALPHA(1))=OALPHA(2);
    bl(OALPHA(1))=OALPHA(3);
    bu(OALPHA(1))=OALPHA(4);   
end
if OALPHA3(1)>0;
    x0(OALPHA3(1))=OALPHA3(2);
    bl(OALPHA3(1))=OALPHA3(3);
    bu(OALPHA3(1))=OALPHA3(4);   
end
if OAREA(1)>0;
    x0(OAREA(1))=OAREA(2);
    bl(OAREA(1))=OAREA(3);
    bu(OAREA(1))=OAREA(4);   
end
if OAREA2(1)>0;
    x0(OAREA2(1))=OAREA2(2);
    bl(OAREA2(1))=OAREA2(3);
    bu(OAREA2(1))=OAREA2(4);   
end
if OAREA3(1)>0;
    x0(OAREA3(1))=OAREA3(2);
    bl(OAREA3(1))=OAREA3(3);
    bu(OAREA3(1))=OAREA3(4);   
end
if OQLATIN(1)>0;
    x0(OQLATIN(1))=OQLATIN(2);
    bl(OQLATIN(1))=OQLATIN(3);
    bu(OQLATIN(1))=OQLATIN(4);   
end
cd (CF);

OPRTLOC = [NOBSMC(:,1);NOBSSTS(:,1)];
NOPRINT = size(OPRTLOC,1);

for I = 1:NOPRINT
    J = 1;
    if OPRTLOC(I) > DIST(IMAX)
        OPRTLOC(I) = DIST(IMAX);
        OPINDEX(I)=IMAX-1;
        OWT(I)= 1;        
    elseif OPRTLOC(I) < DIST(1)
        OPRTLOC(I) = DIST(1);
        OPINDEX = 1;
        OWT(I) = 0;
    else
        while OPRTLOC(I) > DIST(J)
            J = J + 1;
        end
        J = J - 1;
        OPINDEX(I) = J;
        OWT(I) = (OPRTLOC(I) - DIST(J)) / (DIST(J+1) - DIST(J));        
    end
end
TIME = TSTART;
JBOUND = 1;