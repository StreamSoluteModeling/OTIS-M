%!**********************************************************************
%
%     Subroutine INPUT              Called by: MAININIT
%
%     input physical and chemical parameters
%
%***********************************************************************
%
%     read the print option, the time parameters, etc.
%
%
ERRORS = 0;
ERRMSG = '';
cd(CF)
if exist('PROJECT.txt') == 2
cd(WF)
    INPROJ
else
    ERRORS = ERRORS + 1;
    ERRMSG = strvcat(ERRMSG,'No PROJECT.txt defined');    
end
%
%     read the time-invariant parameters for each reach
%
cd(CF)
if ERRORS == 0 && exist('GEOMETRY.txt') == 2
cd(WF)
    INGEOM
else
    ERRORS = ERRORS + 1;
    ERRMSG = strvcat(ERRMSG,'No GEOMETRY.txt defined');        
end
%
%     read the number of solutes and the chemistry flags
%     read the first-order decay rates
%     read the sorption parameters
%
cd(CF)
if ERRORS == 0 && exist('CHEMISTRY.txt') == 2
cd(WF)
    INCHEM
else
    ERRORS = ERRORS + 1;
    ERRMSG = strvcat(ERRMSG,'No CHEMISTRY.txt defined');        
end;
%
%     read the print parameters
%
cd(CF)
if ERRORS == 0 && exist('PRINT.txt') == 2
cd(WF)
    INPRINT
else
    ERRORS = ERRORS + 1;
    ERRMSG = strvcat(ERRMSG,'No PRINT.txt defined');        
end;
%
%     read the flow variables at each reach or flow location
%
cd(CF)
if ERRORS == 0 && exist('FLOW.txt') == 2
cd(WF)
    INFLOW
else
    ERRORS = ERRORS + 1;
    ERRMSG = strvcat(ERRMSG,'No FLOW.txt defined');            
end;
%
%     read the upstream boundary conditions
%
cd(CF)
if ERRORS == 0 && exist('BOUNDARY.txt') == 2
cd(WF)
    INBOUND
else
    ERRORS = ERRORS + 1;
    ERRMSG = strvcat(ERRMSG,'No BOUNDARY.txt defined');            
end;
%
%     read the optimization file
%
if IOPT == 1 || IOFUNCTION == 1
    cd(CF)
    if ERRORS == 0 && exist('OPTIMIZE.txt') == 2
        cd(WF)
        INOPT
    else
        ERRORS = ERRORS + 1;
        ERRMSG = strvcat(ERRMSG,'No OPTIMIZE.txt defined');            
    end
end;
cd(WF);   