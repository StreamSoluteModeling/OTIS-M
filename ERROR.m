%***********************************************************************
%
%     Subroutine ERROR               Called by: INPUT...
%
%     print input error messages
%
%***********************************************************************
function ERROR(NUMBER,PARAM1,PARAM2)

if (NUMBER == 5)  %%Called by INGEOM
    %(IAREA2(I)< 0) ERROR(5,IAREA2(I),'Area2')
    
elseif (NUMBER == 6)  %%Called by INGEOM
    %(IAREA3(I)<0) ERROR(6,IAREA3(I),'Area3')        
 
elseif (NUMBER == 13) %%Called by INBOUND   
    %(IBOUND ~= 1 )&&( IBOUND ~= 2)&&(IBOUND~=3) ERROR(13,IBOUND,0)
%     for IBOUND=3, test to make sure that the time of the last b.c.
%     is at or after the simulation end time.  This is required for
%     determining a boundary concentration via interpolation.    
elseif (NUMBER == 14) %%Called by INBOUND   
    %((IBOUND == 3)&&(USTIME(NBOUND) < TFINAL)) ERROR(14,USTIME(NBOUND),TFINAL)
    
elseif (NUMBER == 15) %%Called by QWEIGHTS   
    %(FLOWLOC(1) ~= XSTART) ERROR(15,FLOWLOC(1),XSTART)
    
elseif (NUMBER == 16) %%Called by QWEIGHTS   
    %(FLOWLOC(NFLOW) < DIST(IMAX)) ERROR(16,FLOWLOC(NFLOW),DIST(IMAX))
elseif (NUMBER == 18) %%Called by QUNSTEAD
    %(FLOC(I) < FLOC(I-1)) ERROR(18,FLOWLOC(I-1),FLOWLOC(I))
    
end;