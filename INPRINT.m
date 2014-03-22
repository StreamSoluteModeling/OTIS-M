%!*********************************************************************
%
%     Subroutine INPUT6               Called by: INPUT
%
%     read the print parameters
%
%***********************************************************************
%
%     Read the number of print locations and the interpolation option.
%     Test to see if the number of locations exceeds the maximum and for
%     a valid interpolation option.
%
disp('Loading Print Data')
cd (CF);
print=load('PRINT.txt'); %LAMBDA LAMBDA2 LAMBDA3 LAMHAT LAMHAT2 LAMHAT3 RHO...
                   %RHO2 RHO3 KD KD2 KD3 CSBACK CSBACK2 CSBACK3
cd (WF);
%
if size(print,1)>0
    RPRTLOC = print(:,1);
    NPRINT = size(print,1);
else
    NPRINT = 0;
end;
PINDEX = zeros(NPRINT,1);
WT = zeros(NPRINT,1);

for I = 1:NPRINT
    J = 1;
    if RPRTLOC(I) > DIST(IMAX)
        RPRTLOC(I) = DIST(IMAX);
        PINDEX(I)=IMAX-1;
        WT(I)= 1;        
    elseif RPRTLOC(I) < DIST(1)
        RPRTLOC(I) = DIST(1);
        PINDEX = 1;
        WT(I) = 0;
    else
        while RPRTLOC(I) > DIST(J)
            J = J + 1;
        end
        J = J - 1;
        PINDEX(I) = J;
        WT(I) = (RPRTLOC(I) - DIST(J)) / (DIST(J+1) - DIST(J));        
    end
end
PSTOP = TSTART;