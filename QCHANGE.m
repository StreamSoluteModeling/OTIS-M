%!**********************************************************************
%
%     Subroutine QCHANGE             Called by: MAINRUN
%
%     Read in the new flow variables, initialize the vectors, determine
%     the next time the flow changes, and set the concentration at the
%     upstream boundary.
%
%***********************************************************************
%
%     Read in the new flow variables and initialize the vectors.
%
    QAINIT
%
%     determine the next time the flow changes
%
      QSTOP = TSTOP + QSTEP;
%
%     if a flux boundary condition is in effect, update the
%     concentration at the upstream boundary based on the new flowrate
%
if (IBOUND == 2)
    for Sol = 1:NSOLUTE
        for I = JBOUND:NBOUND
            USCONC(I,Sol) = USBC(I,Sol) / QVALUE(1);
        end;
    end;
end;
%
end
