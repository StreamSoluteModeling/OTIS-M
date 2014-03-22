%!**********************************************************************
%     
%     Subroutine PREPROC                Called by: MAININIT
%
%     preprocess parameter groups and initialize variables.  Most of the
%     preprocessing is completed in the following three routines:
%
%     PREPROC1 - develop parameter groups that are a function of the
%                segment length, and the interfacial dispersion coeff.
%
%     PREPROC3 - develop parameter groups that are functions of the flow
%                variables and decompose the tridiagonal matrix.
%  
%***********************************************************************
%
%     compute the inverse of the time step [/sec]
%
if strcmp(CHEM,'Steady-State')==0
	TIMEB = 1 / (TSTEP * 3600);
    DT = TSTEP * 3600;
end;
%
%     initialize the time at which a change in flow occurs.  if the flow
%     is steady, set QSTOP to an arbitrarily large number. QSTOP is the
%     time at which the upstream boundary condition
%     or flow variables change.
%
if QSTEP == 0
	QSTOP = 999*10^99;
else
	QSTOP = str2double(num2str(TSTART + QSTEP));
end;
%
%     compute parameter groups used within CONSER/REACT/SSDIFF.  If the
%     run is 'Steady-State' call only PREPROC1.  Note that in the call
%     to PREPROC3, GAMMA, BTERMS, QLATIN, CLATIN and AREA are passed in
%     twice as GAMMAN, BTERMSN, QLATINN, CLATINN and AREAN are
%     undefined.
%
PREPROC1 
%
if strcmp(CHEM,'Steady-State')==0
    PREPROC3
end;