%!**********************************************************************
%     
%     Subroutine QAINIT            Called by: QCHANGE, MAININIT, SETUP2
%
%     initialize the flow rates, lateral flows and areas for the case of
%     unsteady flow.
% 
%     Flow and area values for each segment are interpolated based on
%     the data that is available at the user-specified flow locations.
%
%     Lateral flow rates and inflow concentrations are set equal to
%     the values at the nearest downstream flow location.  Note that
%     QINDEX(I) denotes the nearest downstream flow location, DSDIST(I)
%     is the distance from the center of the segment to the nearest
%     downstream flow location (FLOWLOC(QINDEX(I))), and USDIST(I) is
%     the distance to the nearest upstream flow location
%     (FLOWLOC(QINDEX(I)-1)).  USDIST and DSDIST are normalized to the
%     segment length.
%
%     Note that the interpolation weights and indices are precomputed
%     in the subroutine QWEIGHTS.
%
%***********************************************************************
%
%     initialize flow rates and areas
%
UQ = zeros(IMAX,NQSTEP);
UAREA = zeros(IMAX,NQSTEP);
UQLATIN = zeros(IMAX,NQSTEP);
UQLATOUT = zeros(IMAX,NQSTEP);
UCLATIN = zeros(IMAX,NQSTEP*NSOLUTE);
for Seg = 1:IMAX %I = Segment
    J = QINDEX(Seg);
    for K = 1:NQSTEP %K = Time
        UQ(Seg,K) = QVALUE(J-1,K) + QWT(Seg) * (QVALUE(J,K) - QVALUE(J-1,K));
        UAREA(Seg,K) = AVALUE(J-1,K) + QWT(Seg) * (AVALUE(J,K) - AVALUE(J-1,K));
    end
end;
%
%     set lateral flows and inflow concentrations equal to the values at
%     the nearest downstream flow location.  If the flow location is w/i
%     the current segment, set the flows and concentrations equal to a
%     weighted average of the closest flow location and the 2nd closest.
%     In this way QLATIN and CLATIN are spatially constant between flow
%     locations.
%
for Seg = 1:IMAX
    J = QINDEX(Seg);
    for K = 1:NQSTEP %K = Time
        if (USDIST(Seg) < 0.5)
    %
    %          a flow location is w/i the upstream half of the segment
    % 
            UQLATIN(Seg,K) = WTAVG(USDIST(Seg),QINVAL(J-1,K),QINVAL(J,K));
            UQLATOUT(Seg,K) = WTAVG(USDIST(Seg),QOUTVAL(J-1,K),QOUTVAL(J,K));
            for Sol = 1:NSOLUTE
                UCLATIN(Seg,K*Sol) = WTAVG(USDIST(Seg),CLVAL(J-1,K*Sol),...
                    CLVAL(J,K*Sol));
            end;
        elseif (DSDIST(I) < 0.5)
    %
    %           a flow location is w/i the downstream half of the segment
    %
            UQLATIN(Seg,K) = WTAVG(DSDIST(Seg),QINVAL(J+1,K),QINVAL(J,K));
            UQLATOUT(Seg,K) = WTAVG(DSDIST(Seg),QOUTVAL(J+1,K),QOUTVAL(J,K));            
            for Sol = 1:NSOLUTE
                UCLATIN(Seg,K*Sol) = WTAVG(DSDIST(Seg),CLVAL(J+1,K*Sol),...
                    CLVAL(J,K*Sol));
            end;
        else
            UQLATIN(Seg,K) = QINVAL(QINDEX(Seg),K);
            UQLATOUT(Seg,K) = QOUTVAL(QINDEX(Seg),K);            
            for Sol = 1:NSOLUTE
               UCLATIN(Seg,K*Sol) = CLVAL(J,K*Sol);
            end;
        end;
    end;
end;