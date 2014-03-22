%Fill Parameters

if OSYSTEM == 1
    if ODISP(1)>0;
        IDISP(:) = Ox(ODISP(1));
    end
    if OALPHA(1)>0;
        IALPHA(:) = Ox(OALPHA(1)); 
    end
    if OALPHA3(1)>0;
        IALPHA3(:) = Ox(OALPHA3(1)); 
    end
    if OAREA(1)>0;
        IAREA(:) = Ox(OAREA(1));  
    end
    if OAREA2(1)>0;
        IAREA2(:) = Ox(OAREA2(1));  
    end
    if OAREA3(1)>0;
        IAREA3(:) = Ox(OAREA3(1));   
    end
    if OQLATIN(1)>0;
        IQLATIN(:) = Ox(OQLATIN(1));  
    end
    if OAMCSTS(1)>0;
        IAREA2(:) = Ox(OAREA(1))*OAMCSTS(2);          
    end
else
    if ODISP(1)>0;
        IDISP(Reach) = Ox(ODISP(1));
    end
    if OALPHA(1)>0;
        IALPHA(Reach) = Ox(OALPHA(1)); 
    end
    if OALPHA3(1)>0;
        IALPHA3(Reach) = Ox(OALPHA3(1)); 
    end
    if OAREA(1)>0;
        IAREA(Reach) = Ox(OAREA(1));  
    end
    if OAREA2(1)>0;
        IAREA2(Reach) = Ox(OAREA2(1));  
    end
    if OAREA3(1)>0;
        IAREA3(Reach) = Ox(OAREA3(1));   
    end
    if OQLATIN(1)>0;
        IQLATIN(Reach) = Ox(OQLATIN(1));  
    end
    if OAMCSTS(1)>0;
        IAREA2(Reach) = Ox(OAREA(1))*OAMCSTS(2);          
    end    
end;
ISEG = 1;
for IReach = 1:NREACH
    for ISegment = ISEG:LASTSEG(IReach);
        DISP(ISegment) = IDISP(IReach);
        ALPHA(ISegment) = IALPHA(IReach);
        ALPHA3(ISegment) = IALPHA3(IReach);
        AREA(ISegment) = IAREA(IReach);
        AREA2(ISegment) = IAREA2(IReach);
        AREA3(ISegment) = IAREA3(IReach);
        QLATIN(ISegment) = IQLATIN(IReach);     
    end;
    ISEG = LASTSEG(IReach) + 1;
end;

%Run the model
TIME = TSTART;
JBOUND = 1;
MAININIT            % Compute Initial Concentration
if strcmp(CHEM,'Steady-State')==0
    MAINRUN         % Perform Dynamic Simulation
end;
cd (CF);
for IReach = 1:NREACH
    fprintf(fidOPT,'%10.6e\t',icall);  %1
    fprintf(fidOPT,'%10.6e\t',IReach);  %2
    fprintf(fidOPT,'%10.6e\t',DISP(IReach));  %3
    fprintf(fidOPT,'%10.6e\t',AREA(IReach));  %4  
    fprintf(fidOPT,'%10.6e\t',AREA2(IReach));  %5  
    fprintf(fidOPT,'%10.6e\t',AREA3(IReach));  %6               
    fprintf(fidOPT,'%10.6e\t',ALPHA(IReach));  %7                     
    fprintf(fidOPT,'%10.6e\t',ALPHA3(IReach));  %8
    fprintf(fidOPT,'%10.6e\t',QLATIN(IReach));  %9
    fprintf(fidOPT,'%10.6e\n',OFV);  %10          
end
cd (WF);