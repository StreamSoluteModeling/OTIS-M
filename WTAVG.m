%!**********************************************************************
%
%     Function WTAVG            Called by: QAINIT
%
%     compute the weighted average value of QLATIN, QLATOUT, and CLATIN,
%     when a flow location is within a given segment. (Unsteady Flow
%     Conditions only)
%
%***********************************************************************
%
function Wtaverage =  WTAVG(QDIST,USVAL,DSVAL)
    Wtaverage = (0.5 - QDIST) * USVAL + (0.5 + QDIST) * DSVAL;
end