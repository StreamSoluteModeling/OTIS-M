%!**********************************************************************
%
%     Subroutine SSCONC               Called by: SSDIFF
%
%     compute steady-state storage zone and streambed sediment
%     concentrations
%
%***********************************************************************

%
%     compute the steady-state storage zone and sorbate concentrations.
%     If the exchange coefficient is zero, the storage zone
%     concentration is zero.
%                      
for I = 1:IMAX
    if INEST == 0
        if (ALPHA(I) ~= 0) || (LAMHAT2(I,J) ~= 0)
            CONC2(I,J) = ...
            (ALPHA(I)*AREA(I)*CONC(I,J)+AREA2(I)*LAMHAT2(I,J)*CSBACK(I,J))/...
            (ALPHA(I)*AREA(I)+AREA2(I)*(LAMBDA2(I,J)+LAMHAT2(I,J)));
        else
            CONC2(I,J) = 0;
        end;
        if (ALPHA3(I) ~= 0) || (LAMHAT3(I,J) ~= 0)
            CONC3(I,J) = ...
            (ALPHA3(I)*AREA(I)*CONC(I,J)+AREA3(I)*LAMHAT3(I,J)*CSBACK3(I,J))/...
            (ALPHA3(I)*AREA(I)+AREA3(I)*(LAMBDA3(I,J)+LAMHAT3(I,J)));
        else
            CONC3(I,J) = 0;
        end;
    else
        if (ALPHA(I) ~= 0) || (LAMHAT2(I,J) ~= 0)
            CONC2(I,J) = ...
            ((ALPHA(I)*AREA(I)*CONC(I,J)+ AREA2(I)*LAMHAT2(I,J)*CSBACK(I,J))*...
            (ALPHA3(I)*AREA2(I)+AREA3(I)*(LAMHAT3(I,J)+LAMBDA(I,J)))+...
            (ALPHA3(I)*AREA2(I)*AREA3(I)*LAMHAT3(I,J)*CSBACK3(I,J)))/...
            ((ALPHA(I)*AREA(I)+AREA2(I)*(LAMHAT2(I,J)+LAMBDA2(I,J)+ALPHA3(I,J)))*...
            (ALPHA3(I)*AREA2(I)+AREA3(I)*(LAMHAT3(I,J)+LAMBDA3(I,J)))-...
            ((ALPHA3(I)*AREA2(I))^2));
            if (ALPHA3(I) ~= 0) || (LAMHAT3(I,J) ~= 0)
                CONC3(I,J) = ... 
                (ALPHA3(I)*AREA2(I)*CONC2(I,J)+AREA3(I)*LAMHAT3(I,J)*CSBACK3(I,J))/...
                (ALPHA3(I)*AREA2(I)+AREA3(I)*(LAMHAT3(I,J)+LAMBDA3(I,J)));
            else
                CONC3(I,J) = 0;
            end;        
        else
            CONC2(I,J) = 0;
            CONC3(I,J) = 0;
        end;


    end;   
    CSED(I,J) = KD(I,J)*CONC(I,J); 
end;

