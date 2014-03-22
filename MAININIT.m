%!**********************************************************************
%
%     Subroutine MAININIT            Called by: MAIN program
%
%     Obtain input parameters, initialize variables, and preprocess.
%     If the steady-state option has been invoked, output results
%
%***********************************************************************
%
%     determine the type of simulation to conduct so that the proper
%     preprocessing and finite difference routines are called.
%
TIME = TSTART;
PSTOP = TSTART;
if TSTEP == 0
    CHEM = 'Steady-State';
else
    CHEM = 'Reactive';
end;
%
%     pre-process parameter groups and initialize variables
%
PREPROC
%
%     compute main channel concentrations using finite differences
%     compute steady-state storage zone and streambed sediment
%     concentrations
%
SSDIFF
%
%     Output Initial conditions
%
if IREPEAT == 0
    OUTINIT
end;
