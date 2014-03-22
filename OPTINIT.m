%!**********************************************************************
%
%     Subroutine OPTINIT              Called by: MAIN
%
%     input the following parameters for each reach:
%
%     *
%
%     Local Variables
%     ---------------
%     *
%
%***********************************************************************
cd (CF);
fidOPT=fopen(strcat('POPT_.txt'),'wt');                                  
fprintf(fidOPT,'%s\t','RUN           ');  %1
fprintf(fidOPT,'%s\t','REACH         ');  %2
fprintf(fidOPT,'%s\t','DISPERSION    ');  %3
fprintf(fidOPT,'%s\t','AREA          ');  %4  
fprintf(fidOPT,'%s\t','AREA2         ');  %5  
fprintf(fidOPT,'%s\t','AREA3         ');  %6               
fprintf(fidOPT,'%s\t','ALPHA         ');  %7                     
fprintf(fidOPT,'%s\t','ALPHA3        ');  %8
fprintf(fidOPT,'%s\t','QLATIN        ');  %9
fprintf(fidOPT,'%s\t','Objective Func');  %10
fprintf(fidOPT,'%s\n','Group Number  ');  %11
cd (WF);

if OSYSTEM==0 %Optimize Reaches individually    
    fopt = zeros(NREACH);
    for OReach = 1:NREACH
        if OReach > 1
            x0 = bestx;
        end
%        [bestx,bestf] = sceua(x0,bl,bu,maxn,kstop,pcento,peps,ngs,iseed,iniflg);
        OSCEUA
        fopt(OReach) = bestf;
    end
else
    OSCEUA
%    [bestx,bestf] = sceua(x0,bl,bu,maxn,kstop,pcento,peps,ngs,iseed,iniflg);
end
fclose(fidOPT);