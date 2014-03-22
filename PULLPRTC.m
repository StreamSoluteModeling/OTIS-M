%!**********************************************************************
%
%     Subroutine PULLPRTC            Called by: OUTINIT,MAINRUN
%
%     Prints Concentration Data to File
%
%***********************************************************************
%
cd (CF);
for Sol = 1:NSOLUTE;
    for I = 1:NPRINT;
        if TIME == TSTART
            if pcase == 2 %Print Transient Storage Solution
                fidPRT=fopen(strcat('PTS_',NAMESOL(Sol,:),'_XS_',num2str(RPRTLOC(I)),'.txt'),'wt');
            elseif pcase == 3 %Print NO Transient Storage Solution
                fidPRT=fopen(strcat('PNTS_',NAMESOL(Sol,:),'_XS_',num2str(RPRTLOC(I)),'.txt'),'wt');
            elseif pcase == 4 %Print NO Hyporheic Transient Storage Solution
                fidPRT=fopen(strcat('PNHTS_',NAMESOL(Sol,:),'_XS_',num2str(RPRTLOC(I)),'.txt'),'wt');
            end
            %
            %   Write Line 1 Headings  ...
            %          
            fprintf(fidPRT,'%s\t','TIME          ');  %1    
            fprintf(fidPRT,'%s\t','MC CONC       ');  %2
            fprintf(fidPRT,'%s\t','STS CONC      ');  %3  
            fprintf(fidPRT,'%s\t','HTS CONC      ');  %4  
            fprintf(fidPRT,'%s\t','SED CONC      ');  %5               
            fprintf(fidPRT,'%s\t','ADV dm/dt     ');  %6                     
            fprintf(fidPRT,'%s\t','DISP dm/dt    ');  %7
            fprintf(fidPRT,'%s\t','DECAY dm/dt   ');  %8
            fprintf(fidPRT,'%s\t','SORPTION dm/dt');  %9        
            fprintf(fidPRT,'%s\t','STORAGE dm/dt ');  %10
            fprintf(fidPRT,'%s\t','MC dm/dt      ');  %11
            fprintf(fidPRT,'%s\t','STS dm/dt     ');  %12
            fprintf(fidPRT,'%s\n','HTS dm/dt     ');  %13   
            %
            %   Write Line 2 Headings  ...
            %          
            fprintf(fidPRT,'%s\t','(hr)          ');     %1    
            fprintf(fidPRT,'%s\t',[CU() '          ']);  %2         
            fprintf(fidPRT,'%s\t',[CU() '          ']);  %3
            fprintf(fidPRT,'%s\t',[CU() '          ']);  %4
            fprintf(fidPRT,'%s\t',[CU() '          ']);  %5
            fprintf(fidPRT,'%s\t',['(' CU() ')·(' LU() '²/s)  ']);  %6
            fprintf(fidPRT,'%s\t',['(' CU() ')·(' LU() '²/s)  ']);  %7
            fprintf(fidPRT,'%s\t',['(' CU() ')·(' LU() '²/s)  ']);  %8
            fprintf(fidPRT,'%s\t',['(' CU() ')·(' LU() '²/s)  ']);  %9
            fprintf(fidPRT,'%s\t',['(' CU() ')·(' LU() '²/s)  ']);  %10
            fprintf(fidPRT,'%s\t',['(' CU() ')·(' LU() '²/s)  ']);  %11
            fprintf(fidPRT,'%s\t',['(' CU() ')·(' LU() '²/s)  ']);  %12
            fprintf(fidPRT,'%s\n',['(' CU() ')·(' LU() '²/s)  ']);  %13
        %
        MC = CONC(PINDEX(I),Sol) + WT(I) * (CONC(PINDEX(I)+1,Sol) - CONC(PINDEX(I),Sol));
        STS = CONC2(PINDEX(I),Sol) + WT(I) * (CONC2(PINDEX(I)+1,Sol) - CONC2(PINDEX(I),Sol));
        HTS = CONC3(PINDEX(I),Sol) + WT(I) * (CONC3(PINDEX(I)+1,Sol) - CONC3(PINDEX(I),Sol));
        %
        else
            if pcase == 2
                fidPRT=fopen(strcat('PTS_',NAMESOL(Sol,:),'_XS_',num2str(RPRTLOC(I)),'.txt'),'a');
            elseif pcase == 3
                fidPRT=fopen(strcat('PNTS_',NAMESOL(Sol,:),'_XS_',num2str(RPRTLOC(I)),'.txt'),'a');
            elseif pcase == 4
                fidPRT=fopen(strcat('PNHTS_',NAMESOL(Sol,:),'_XS_',num2str(RPRTLOC(I)),'.txt'),'a');
            end            
        end;
        %
        MC = CONC(PINDEX(I),Sol) + WT(I) * (CONC(PINDEX(I)+1,Sol) - CONC(PINDEX(I),Sol));
        STS = CONC2(PINDEX(I),Sol) + WT(I) * (CONC2(PINDEX(I)+1,Sol) - CONC2(PINDEX(I),Sol));
        HTS = CONC3(PINDEX(I),Sol) + WT(I) * (CONC3(PINDEX(I)+1,Sol) - CONC3(PINDEX(I),Sol));
        SORP = CSED(PINDEX(I),Sol) + WT(I) * (CSED(PINDEX(I)+1,Sol) - CSED(PINDEX(I),Sol));
        ADVECTIONFLUX = FADV(PINDEX(I),Sol) + WT(I) * (FADV(PINDEX(I)+1,Sol) - FADV(PINDEX(I),Sol));
        DISPERSIONFLUX = FDIS(PINDEX(I),Sol) + WT(I) * (FDIS(PINDEX(I)+1,Sol) - FDIS(PINDEX(I),Sol));
        DECAYFLUX = FDEC(PINDEX(I),Sol) + WT(I) * (FDEC(PINDEX(I)+1,Sol) - FDEC(PINDEX(I),Sol));
        SORPTIONFLUX = FSOR(PINDEX(I),Sol) + WT(I) * (FSOR(PINDEX(I)+1,Sol) - FSOR(PINDEX(I),Sol));
        STORAGEFLUX = FSTO(PINDEX(I),Sol) + WT(I) * (FSTO(PINDEX(I)+1,Sol) - FSTO(PINDEX(I),Sol));
        MCFLUX = FMC(PINDEX(I),Sol) + WT(I) * (FMC(PINDEX(I)+1,Sol) - FMC(PINDEX(I),Sol));
        STSFLUX = FSTS(PINDEX(I),Sol) + WT(I) * (FSTS(PINDEX(I)+1,Sol) - FSTS(PINDEX(I),Sol));
        HTSFLUX = FHTS(PINDEX(I),Sol) + WT(I) * (FHTS(PINDEX(I)+1,Sol) - FHTS(PINDEX(I),Sol));
        %
        fprintf(fidPRT,'%10.6e\t',TIME);
        fprintf(fidPRT,'%10.6e\t',MC);            
        fprintf(fidPRT,'%10.6e\t',STS);                    
        fprintf(fidPRT,'%10.6e\t',HTS);            
        fprintf(fidPRT,'%10.6e\t',SORP);
        fprintf(fidPRT,'%10.6e\t',ADVECTIONFLUX);
        fprintf(fidPRT,'%10.6e\t',DISPERSIONFLUX);
        fprintf(fidPRT,'%10.6e\t',DECAYFLUX);
        fprintf(fidPRT,'%10.6e\t',SORPTIONFLUX);
        fprintf(fidPRT,'%10.6e\t',STORAGEFLUX);
        fprintf(fidPRT,'%10.6e\t',MCFLUX);
        fprintf(fidPRT,'%10.6e\t',STSFLUX);
        fprintf(fidPRT,'%10.6e\n',HTSFLUX);
        %
        fclose(fidPRT);
        %
    end;
end;
cd(WF)