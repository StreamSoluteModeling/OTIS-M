%!**********************************************************************
%
%     Subroutine INPROJ             Called by: INPUT
%
%***********************************************************************
disp('Loading Project Data')
cd (CF);
project=fopen('PROJECT.txt');
%Initialize Default Variables
I = 1;
TITLE = '';
PSTEP = 0; %Check
TSTEP = 0; %Check
TSTART = 0; %Check
TFINAL = 0; %Check
XSTART = 0; %Check
DSBOUND = 0; %Check
QSTART = 0; %Check
QSTEP = 0; %Check
IBOUND = 1;
IGRAPH = 0;
IMETRIC = 0;
IMOVIE = 0;
INEST = 0;
IOPT = 0;
IPROGRESS = 1;
IREPEAT = 0;
ITIMEC = 0;
ISTEADY = 1;
IOFUNCTION = 0;
LU = '';
NAMESOL = '';
CU = '';
%
while I==1
    J = fgetl(project);
    if J == -1
        I = 2;
    elseif size(J,2) < 15
    elseif strcmp(J(1:15),'## TITLE ######')==1
        TITLE=fgetl(project);
    elseif strcmp(J(1:15),'## PSTEP ######')==1
        PSTEP=str2double(fgetl(project));
    elseif strcmp(J(1:15),'## TSTEP ######')==1
        TSTEP=str2double(fgetl(project));
    elseif strcmp(J(1:15),'## TSTART #####')==1
        TSTART=str2double(fgetl(project));
    elseif strcmp(J(1:15),'## TFINAL #####')==1
        TFINAL=str2double(fgetl(project));
    elseif strcmp(J(1:15),'## XSTART #####')==1
        XSTART=str2double(fgetl(project));
    elseif strcmp(J(1:15),'## DSBOUND ####')==1
        DSBOUND=str2double(fgetl(project));
    elseif strcmp(J(1:15),'## ISTEADY ####')==1
        ISTEADY=str2double(fgetl(project));
    elseif strcmp(J(1:15),'## IBOUND #####')==1
        IBOUND=str2double(fgetl(project));
    elseif strcmp(J(1:15),'## QSTEP ######')==1
        QSTEP=str2double(fgetl(project));
    elseif strcmp(J(1:15),'## QSTART #####')==1
        QSTART=str2double(fgetl(project));
    elseif strcmp(J(1:15),'## INEST ######')==1
        INEST=str2double(fgetl(project));
    elseif strcmp(J(1:15),'## IOPT #######')==1
        IOPT=str2double(fgetl(project));
    elseif strcmp(J(1:15),'## IMOVIE #####')==1
        IMOVIE=str2double(fgetl(project));    
    elseif strcmp(J(1:15),'## IMETRIC ####')==1
        IMETRIC=str2double(fgetl(project));  
    elseif strcmp(J(1:15),'## IGRAPH #####')==1
        IGRAPH=str2double(fgetl(project));          
    elseif strcmp(J(1:15),'## IPROGRESS ##')==1
        IPROGRESS=str2double(fgetl(project));
    elseif strcmp(J(1:15),'## ITIMEC #####')==1
        ITIMEC=str2double(fgetl(project));                  
    elseif strcmp(J(1:15),'## LU #########')==1
        LU=fgetl(project);
    elseif strcmp(J(1:15),'## IOFUNCTION #')==1
        IOFUNCTION=str2double(fgetl(project));        
    elseif strcmp(J(1:15),'## NAMESOL ####')==1
        J = fgetl(project);                                  
        NAMESOL = J;
        K = 1;
        while K==1 && strcmp(J(1),'#')~=1
            J = fgetl(project);
            if J == -1
                K = 2;
            elseif strcmp(J(1),'#')~=1
                NAMESOL = strvcat(NAMESOL,J);
            end;
        end;
    end;
    if J == -1
        I = 2;
    elseif size(J,2) < 15
    elseif strcmp(J(1:15),'## CU #########')==1
        J = fgetl(project);                                  
        CU = J;
        K = 1;
        while K==1 && strcmp(J(1),'#')~=1
            J = fgetl(project);
            if J == -1
                K = 2;
            elseif strcmp(J(1),'#')~=1
                CU = strvcat(CU,J);
            end;
        end;
    end;
end;    
fclose(project);
cd (WF);
%Check for Errors
ERRORS = 0;
ERRMSG = '';
if TSTART > TFINAL
    ERRMSG = strvcat(ERRMSG,'TSTART > TFINAL');
    ERRORS = ERRORS + 1;
end
if TSTEP > TFINAL-TSTART
    ERRMSG = strvcat(ERRMSG,'TSTEP > TFINAL-TSTART');
    ERRORS = ERRORS + 1;
end
if TSTEP <= 0
    ERRMSG = strvcat(ERRMSG,'TSTEP <= 0');    
    ERRORS = ERRORS + 1;
end
if PSTEP < TSTEP
    ERRMSG = strvcat(ERRMSG,'PSTEP < TSTEP');    
    ERRORS = ERRORS + 1;
end
if PSTEP < 0
    ERRMSG = strvcat(ERRMSG,'PSTEP < 0');    
    ERRORS = ERRORS + 1;
end
if QSTART <= 0
    ERRMSG = strvcat(ERRMSG,'QSTART <= 0');    
    ERRORS = ERRORS + 1;
end
if DSBOUND < 0
    ERRMSG = strvcat(ERRMSG,'DSBOUND < 0');    
    ERRORS = ERRORS + 1;
end
if QSTEP < 0
    ERRMSG = strvcat(ERRMSG,'QSTEP < 0');    
    ERRORS = ERRORS + 1;
end
if XSTART < 0
    ERRMSG = strvcat(ERRMSG,'XSTART < 0');
    ERRORS = ERRORS + 1;
end

TIME = TSTART;