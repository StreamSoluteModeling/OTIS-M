%!**********************************************************************
%
%     Subroutine INPUTQ              Called by: INPUT
%
%     input the following parameters:
%
%     QSTEP, QSTART, QLATIN, QLATOUT, AREA, CLATIN
%
%***********************************************************************
%
%     If the interval between changes in flow is zero, the steady flow
%     option has been selected.  Otherwise the flow is unsteady.  Call
%     the appropriate routine to read the flowrate at upstream boundary,
%     lateral inflows, lateral outflows, cross sectional areas, and 
%     inflow concentrations.  Also set QSTART equal to QVALUE(1) for use
%     in INPUT5.
%
disp('Loading Flow Data')
if (ISTEADY==1)
	QSTEADY %(CFLOW,QLATIN,QLATOUT,CLATIN,AREA,NREACH,LASTSEG,NSOLUTE)
else
    QUNSTEADY %(CFLOW,QINVAL,CLVAL,NSOLUTE,NFLOW,FLOWLOC,QVALUE,AVALUE,...
%        QSTEPS)
	QSTART = QVALUE(1);
end;
