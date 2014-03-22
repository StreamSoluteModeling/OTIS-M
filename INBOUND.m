%!**********************************************************************
%
%     Subroutine INPUT7               Called by: INPUT
%
%     read the upstream boundary conditions
%
%***********************************************************************
disp('Loading Boundary Data')
cd (CF)
boundary=load ('BOUNDARY.txt');
cd (WF)
%
USTIME = boundary(:,1);
USBC=boundary(:,2:1+NSOLUTE);
% 
BOUND = size(boundary,1);
%     set the upstream boundary concentration (USCONC) based on the
%     specified boundary condition (USBC).  If the boundary condition
%     is specified as a flux (IBOUND=2) divide the boundary condition
%     by the flow at the upstream boundary to obtain the concentration.

if (IBOUND == 2)
    for I = 1:BOUND
        USBC(I,1:NSOLUTE) = USBC(I,1:NSOLUTE) / QSTART;
    end;
end;
USBC = [USBC;0];
USTIME = [USTIME;99*10^99];

NBOUND = round((TFINAL-TSTART)/TSTEP);
USCONC = zeros(NBOUND,NSOLUTE);
%
%     initialize the upstream boundary condition variables.  For a step
%     boundary condition (IBOUND = 1 or 2), the boundary condition will
%     change at user-specified times indicated by USTIME.  For a
%     continuous boundary condition (IBOUND =3), the b.c. will change
%     every time step.
%
J = 1;
JBOUND = 1;
TIME = TSTART;
while TFINAL >= TIME
    while TIME >= USTIME(J+1)
        J = J + 1;
    end
    if (IBOUND == 1) || (IBOUND == 2)
        USCONC(JBOUND,1:NSOLUTE) = USBC(J,1:NSOLUTE);
    else
        for Sol = 1:NSOLUTE
            USCONC(JBOUND,Sol) = USBC(J,Sol)+(TIME-USTIME(J))/(USTIME(J+1)-USTIME(J))*(USBC(J+1,Sol)-USBC(J,Sol));
        end
    end;
    JBOUND = JBOUND + 1;
    TIME = str2double(num2str(TIME + TSTEP));    
end
NBOUND = JBOUND-1;
JBOUND = 1;
%USTIME=[USTIME;999*10^99];
%USCONC=[USCONC;0];
%
%     initialize the boundary conditions for time step 'N', USCONCN.
%
TIME = TSTART;