%!**********************************************************************
%
%     Subroutine OUTTIMEC           Called by: MAINRUN,OUTINIT
%
%     Prints Concentration Data to Files
%
%***********************************************************************
%
cd (CF);
for Sol = 1:NSOLUTE;
    if TIME == TSTART
        %
        %   Open MC, STS, HTS, & Sorption Files
        %    
        fidMC=fopen(strcat('PRINT_MC_',NAMESOL(Sol,:)),'wt');
        fidSTS=fopen(strcat('PRINT_STS_',NAMESOL(Sol,:)),'wt');
        fidHTS=fopen(strcat('PRINT_HTS_',NAMESOL(Sol,:)),'wt');    
        fidSORP=fopen(strcat('PRINT_SED_',NAMESOL(Sol,:)),'wt');        
        %
        %   Write Headings 0 ... DIST (1:IMAX)
        %
        fprintf(fidMC,'%10.6e\t',0);
        fprintf(fidSTS,'%10.6e\t',0);
        fprintf(fidHTS,'%10.6e\t',0);
        fprintf(fidSORP,'%10.6e\t',0); 
        for I = 1:IMAX-1
            fprintf(fidMC,'%10.6e\t',DIST(I));
            fprintf(fidSTS,'%10.6e\t',DIST(I));
            fprintf(fidHTS,'%10.6e\t',DIST(I));
            fprintf(fidSORP,'%10.6e\t',DIST(I));
        end;
        fprintf(fidMC,'%10.6e\n',DIST(IMAX));
        fprintf(fidSTS,'%10.6e\n',DIST(IMAX));
        fprintf(fidHTS,'%10.6e\n',DIST(IMAX));
        fprintf(fidSORP,'%10.6e\n',DIST(IMAX));
    else
        %
        %   Open MC, STS, HTS, & Sorption Files
        %
        fidMC=fopen(strcat('PRINT_MC_',NAMESOL(Sol,:)),'a');
        fidSTS=fopen(strcat('PRINT_STS_',NAMESOL(Sol,:)),'a');
        fidHTS=fopen(strcat('PRINT_HTS_',NAMESOL(Sol,:)),'a');    
        fidSORP=fopen(strcat('PRINT_SED_',NAMESOL(Sol,:)),'a');     
    end;
    %
    %   Write Time ... Concentrations (1:IMAX)
    %
    fprintf(fidMC,'%10.6e\t',TIME,CONC(1:IMAX-1,Sol));    
    fprintf(fidMC,'%10.6e\n',CONC(IMAX,Sol));    
    fprintf(fidSTS,'%10.6e\t',TIME,CONC2(1:IMAX-1,Sol));    
    fprintf(fidSTS,'%10.6e\n',CONC2(IMAX,Sol));        
    fprintf(fidHTS,'%10.6e\t',TIME,CONC3(1:IMAX-1,Sol));    
    fprintf(fidHTS,'%10.6e\n',CONC3(IMAX,Sol));
    fprintf(fidSORP,'%10.6e\t',TIME,CSED(1:IMAX-1,Sol));    
    fprintf(fidSORP,'%10.6e\n',CSED(IMAX,Sol));                    
    %
    %   Close MC, STS, HTS, & Sorption Files
    %
    fclose(fidMC);
    fclose(fidSTS);    
    fclose(fidHTS);
    fclose(fidSORP);     
end;
cd(WF)