%!**********************************************************************
%
%     Subroutine QSTEADY              Called by: INPUTQ
%
%     A subroutine to input the following parameters:
%
%     QSTART, QLATIN, QLATOUT, AREA, CLATIN
%
%***********************************************************************
%
%     Read lateral inflow, lateral outflow, area, and lateral
%     inflow concentrations for each reach.
%
%     Fill vectors with reach values, and echo flow values
%
cd (CF);
flow = load('FLOW.txt');
cd (WF);
IQLATIN = flow(:,1);
IQLATOUT = flow(:,2);
IAREA = flow(:,3);
ICLATIN = flow(:,3+NSOLUTE);   
%
I = 1;
AREA = zeros(IMAX,1);
QLATIN = zeros(IMAX,1);
QLATOUT = zeros(IMAX,1);
CLATIN = zeros(IMAX,NSOLUTE);

for Reach = 1:NREACH
    for Seg = I:LASTSEG(Reach)
        AREA(Seg) = IAREA(Reach);
        QLATIN(Seg) = IQLATIN(Reach);
        QLATOUT(Seg) = IQLATOUT(Reach);
        CLATIN(Seg) = ICLATIN(Reach,1:NSOLUTE);
    end;
    I = LASTSEG(Reach) + 1;
end;
%
%     initialize flow rates
%
Q = zeros(IMAX,1);
Q(1) = QSTART + 0.5 * DELTAX(1) * (QLATIN(1) - QLATOUT(1));
%
for I = 2:IMAX
	Q(I) = Q(I-1) + 0.5 * ( (QLATIN(I-1) - QLATOUT(I-1))*DELTAX(I-1)...
         + (QLATIN(I) - QLATOUT(I))*DELTAX(I) );
end;
