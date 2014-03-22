%***********************************************************************
%
%     Subroutine QUNSTEADY              Called by: INPUTQ
%
%     input the following parameters:
%
%     QINVAL, CLVAL, NFLOW, FLOWLOC, QVALUE, AVALUE
%
%***********************************************************************
%
cd (CF);
flow = load('FLOW.txt');
cd (WF);

NNFLOW = size(flow,1);
NFLOW=1;
FLOWLOC(1)=flow(1,1);
%     Read the flow locations [L].  Note that the flow locations must be
%     specified in ascending order.
J = 1; % Flow Time
QVALUE(1,1)=flow(1,2);
QINVAL(1,1)=flow(1,3);
QOUTVAL(1,1)=flow(1,4);
AVALUE(1,1)=flow(1,5);
for Sol = 1:NSOLUTE    
    CLVAL(1,J*Sol)=flow(1,5+Sol);
end;    
for I = 2:NNFLOW
    if flow(I,1)~=flow(I-1,1)
        NFLOW = NFLOW + 1;
        FLOWLOC(NFLOW)=flow(I,1);
%        if(FLOC(I) < FLOC(I-1))
%            ERROR(18,FLOC(I-1),FLOC(I))
%        end;
    else
        J = J +1;
    end;
    QVALUE(NFLOW,J)=flow(I,2);
    QINVAL(NFLOW,J)=flow(I,3);
    QOUTVAL(NFLOW,J)=flow(I,4);
    AVALUE(NFLOW,J)=flow(I,5);
    for Sol = 1:NSOLUTE    
        CLVAL(NFLOW,J*Sol)=flow(I,5+Sol);
    end;
end;
NQSTEP=NNFLOW/NFLOW; %Number of Flow Steps