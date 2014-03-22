%!**********************************************************************
%     
%     Subroutine PREPROC1            Called by: PREPROC
%
%     compute the time invariant parameter groups used within the finite
%     difference subroutines (PREPROC3, CONSER/REACT).  As these groups 
%     are constant in time, they may be computed here on a one-time 
%     basis, rather than at each timestep.
%
%***********************************************************************
DFACE=zeros(IMAX,1);
HPLUSF=zeros(IMAX,1);
HPLUSB=zeros(IMAX,1);
HMULTF=zeros(IMAX,1);
HMULTB=zeros(IMAX,1);
HDIV=zeros(IMAX,1);
HDIVF=zeros(IMAX,1);
HADV=zeros(IMAX,1);
%
%     compute the interfacial dispersion coefficient
%
for Seg = 1:IMAX-1
     DFACE(Seg) =  DELTAX(Seg)/(DELTAX(Seg+1)+DELTAX(Seg)) * DISP(Seg+1)... 
              + DELTAX(Seg+1)/(DELTAX(Seg+1)+DELTAX(Seg)) * DISP(Seg); 
end;

DFACE(IMAX) = DISP(IMAX);
%
%     compute the H-groups
%
HPLUSF(1) = DELTAX(1) + DELTAX(2);
HMULTF(1) = DELTAX(1) * HPLUSF(1);
HDIV(1) = DELTAX(1) / HPLUSF(1);
HDIVF(1) = DELTAX(2) / HPLUSF(1);

for Seg = 2:IMAX-1
    HPLUSF(Seg) = DELTAX(Seg) + DELTAX(Seg+1);
    HPLUSB(Seg) = DELTAX(Seg) + DELTAX(Seg-1); 
    HMULTF(Seg) = DELTAX(Seg) * HPLUSF(Seg);
    HMULTB(Seg) = DELTAX(Seg) * HPLUSB(Seg);
    HDIV(Seg) = DELTAX(Seg) / HPLUSF(Seg);
    HDIVF(Seg) = DELTAX(Seg+1) / HPLUSF(Seg);         
    HADV(Seg) = 0.5 * (HDIVF(Seg)-DELTAX(Seg-1)/HPLUSB(Seg)) / DELTAX(Seg);
end;
HPLUSB(IMAX) = DELTAX(IMAX) + DELTAX(IMAX-1);
HMULTB(IMAX) = DELTAX(IMAX) * HPLUSB(IMAX);



