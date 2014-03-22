%!**********************************************************************
%
%     Subroutine FSTOR             Called by: PREPROC3
%
%     Computes F Storage Coefficients for zones 1 and 2
%
%***********************************************************************
%
Fstor(I,J) = 0;
Fstor1(I,J) = 0;
Fstor2(I,J) = 0;
%
if INEST == 0
    if (ALPHA(I) ~= 0) && (AREA2(I) ~= 0)
        BETA1(I,J) = 2 + GAMMA1(I) + DT*(LAMBDA2(I,J) + LAMHAT2(I,J));
        Fstor1(I,J) = 0.5 * ALPHA(I) * (1 - GAMMA1(I) / BETA1(I,J));
    end;    
    if (ALPHA3(I) ~= 0) && (AREA3(I) ~= 0)
        BETA2(I,J) = 2 + GAMMA2(I) + DT*(LAMBDA3(I,J) + LAMHAT3(I,J));
        Fstor2(I,J) = 0.5 * ALPHA3(I) * (1 - GAMMA2(I) / BETA2(I,J));
    end;
    Fstor(I,J) = Fstor1(I,J)+Fstor2(I,J);
else
    if (ALPHA(I) ~= 0) && (ALPHA3(I) ~= 0) && (AREA2(I) ~= 0) && (AREA3(I) ~= 0)
        BETA6(I,J) = DT*ALPHA3(I)/(2+GAMMA3(I)+DT*(LAMHAT3(I,J)+LAMBDA3(I,J)));
        BETA7(I,J) = 2+GAMMA1(I)+DT*(LAMHAT2(I,J)+LAMBDA2(I,J)+ALPHA3(I));
        Fstor(I,J) = 0.5*ALPHA(I)*(1-GAMMA1(I)/...
                (BETA7(I,J)*(1-BETA6(I,J)*GAMMA3(I)/BETA7(I,J))));
    elseif (ALPHA(I) ~= 0) && (AREA2(I)~=0)
        BETA1(I,J) = 2 + GAMMA1(I) + DT*(LAMBDA2(I,J) + LAMHAT2(I,J));
        Fstor(I,J) = 0.5 * ALPHA(I) * (1 - GAMMA1(I) / BETA1(I,J));
    end
end;

