%!**********************************************************************
%
%     Subroutine OUTINIT             Called by: MAININIT, MAINRUN
%
%     write the initial conditions to the echo file and to the output
%     files.
%
%***********************************************************************
%Initial Steady State Solute Concentrations
if IMOVIE == 1 || ITIMEC == 1
    OUTTIMEC
end;
if NPRINT ~= 0 && pcase > 1
    PULLPRTC
end;
if PSTEP == 0
    PSTOP = TFINAL;
else    
    PSTOP = str2double(num2str(PSTOP + PSTEP));
end;    
