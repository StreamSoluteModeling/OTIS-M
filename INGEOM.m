%!**********************************************************************
%
%     Subroutine INGEOM              Called by: INPUT
%
%     input the following parameters for each reach:
%
%     NSEG,RCHLEN,DISP,AREA2,ALPHA,AREA3,ALPHA3
%
%     Local Variables
%     ---------------
%     NSEG    number of segments in reach
%     END     distance at end of reach [L]
%
%***********************************************************************
disp('Loading Geometry Data')
cd (CF);
geometry = load('GEOMETRY.txt'); %NSEG RCHLEN DISP AREA2 ALPHA AREA3 ALPHA3
cd (WF);
NSEG = geometry(:,1);
RCHLEN = geometry(:,2);
IDISP = geometry(:,3);
IAREA2 = geometry(:,4);
IALPHA = geometry(:,5);
IAREA3 = geometry(:,6);
IALPHA3 = geometry(:,7);
%
NREACH = size(geometry,1);
%
%     Read number of segments, reach lengths [L], dispersion coefficient
%     [L^2/sec], area of storage zone [L^2] and storage exchange
%     coefficient [/sec] for each reach.
%
%     Compute the index for the last segment of each reach, LASTSEG,
%     the segment length, DELTAX, and the distance at the end of each
%     reach, END.
%
%     Perform an error test - storage area must be nonzero.
%     Note:  to include a reach that does not have a storage
%            zone, Alpha should be set to zero.  The storage zone
%            area parameter must be nonzero, however, to avoid
%            division by zero.
%
%     Note that the DELTAX, DISP, AREA2, and ALPHA vectors are
%     filled in a subsequent loop.
%
% Check for Errors
for Reach = 1:NREACH
    if NSEG(Reach)<=0
        ERRMSG = strvcat(ERRMSG,strcat('NSEG <= 0 for Reach = ',Reach));
        ERRORS = ERRORS + 1;
    end
    if RCHLEN(Reach)<=0
        ERRMSG = strvcat(ERRMSG,strcat('RCHLEN <= 0 for Reach = ',Reach));
        ERRORS = ERRORS + 1;
    end
    if IDISP(Reach)<=0
        ERRMSG = strvcat(ERRMSG,strcat('DISP <= 0 for Reach = ',Reach));
        ERRORS = ERRORS + 1;
    end
    if IAREA2(Reach) < 0
        ERRMSG = strvcat(ERRMSG,strcat('AREA2 <= 0 for Reach = ',Reach));
        ERRORS = ERRORS + 1;
    end
    if IALPHA(Reach) < 0
        ERRMSG = strvcat(ERRMSG,strcat('ALPHA <= 0 for Reach = ',Reach));
        ERRORS = ERRORS + 1;
    end
    if IAREA3(Reach) < 0
        ERRMSG = strvcat(ERRMSG,strcat('AREA3 <= 0 for Reach = ',Reach));
        ERRORS = ERRORS + 1;
    end
    if IALPHA3(Reach) < 0
        ERRMSG = strvcat(ERRMSG,strcat('ALPHA3 <= 0 for Reach = ',Reach));
        ERRORS = ERRORS + 1;
    end
end
%
LASTSEG = NSEG(1);
END = XSTART+RCHLEN(1);
%END(0) = XSTART;
%LASTSEG(0)=0
IDELTAX=RCHLEN;
for Reach = 1:NREACH
    if Reach ~=1
        LASTSEG = [LASTSEG;LASTSEG(Reach-1) + NSEG(Reach)];
        END(Reach) = END(Reach-1) + RCHLEN(Reach);
    end;
    IDELTAX(Reach) = RCHLEN(Reach) / NSEG(Reach);
end;
%
%     Compute the number of segments
%
IMAX = LASTSEG(NREACH);
%
%     Fill vectors with reach values, echo storage parameters
%
DELTAX = zeros(IMAX,1);
DISP = zeros(IMAX,1);
AREA2 = zeros(IMAX,1);
ALPHA = zeros(IMAX,1);
AREA3 = zeros(IMAX,1);
ALPHA3 = zeros(IMAX,1);
I = 1;
for Reach = 1:NREACH
    for Segment = I:LASTSEG(Reach);
        DELTAX(Segment) = IDELTAX(Reach);
        DISP(Segment) = IDISP(Reach);
        AREA2(Segment) = IAREA2(Reach);
        ALPHA(Segment) = IALPHA(Reach);
        AREA3(Segment) = IAREA3(Reach);
        ALPHA3(Segment) = IALPHA3(Reach);
    end;
    I = LASTSEG(Reach) + 1;
end;
%
%     compute the distances at the center of each segment
%
DIST(1) = XSTART + 0.5 * DELTAX(1);
for I = 2:IMAX
	DIST(I) = DIST(I-1) + 0.5 * (DELTAX(I-1) + DELTAX(I));
end;




