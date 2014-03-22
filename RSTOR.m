%!**********************************************************************
%
%     Subroutine RSTOR             Called by: DYNCONC
%
%     Computes R Storage Coefficients for zones 1 and 2
%
%***********************************************************************
%
Rstor(I,J) = 0;
Rstor1(I,J) = 0;
Rstor2(I,J) = 0;
if INEST == 0
    if (ALPHA(I) ~= 0) && (AREA2(I) ~= 0)    
        BETA1 = 2 + GAMMA1(I) + DT*(LAMBDA2(I,J) + LAMHAT2(I,J));
        Rstor1(I,J) = 0.5*ALPHA(I)*((1+(2-GAMMA1N(I)-DT*(LAMBDA2(I,J)+LAMHAT2(I,J)))/BETA1)*CONC2N(I,J)+...
                (GAMMA1N(I)/BETA1-1)*CONCN(I,J))+...
                (ALPHA(I)*DT*LAMHAT2(I,J)*CSBACK(I,J)/BETA1);
    end
    if (ALPHA3(I) ~= 0) && (AREA3(I) ~= 0)    
        BETA2 = 2 + GAMMA2(I) + DT*(LAMBDA3(I,J) + LAMHAT3(I,J));

        Rstor2(I,J) = 0.5*ALPHA3(I)*((1+(2-GAMMA2N(I)-DT*(LAMBDA3(I,J)+LAMHAT3(I,J)))/BETA2)*CONC3N(I,J)+...
                (GAMMA2N(I)/BETA2-1)*CONCN(I,J))+...
                (ALPHA3(I)*DT*LAMHAT3(I,J)*CSBACK3(I,J)/BETA2);
    end
    Rstor(I,J) = Rstor1(I,J) + Rstor2(I,J);
else
    if (ALPHA3(I) == 0) || (AREA3(I) == 0)    
        BETA2 = 2 + GAMMA2(I) + DT*(LAMBDA3(I,J) + LAMHAT3(I,J));

        Rstor(I,J) = Rstor(I,J) + 0.5*ALPHA3(I)*((1+(2-GAMMA2N(I)-DT*(LAMBDA3(I,J)+LAMHAT3(I,J)))/BETA2)*CONC3N(I,J)+...
                (GAMMA2N(I)/BETA2-1)*CONCN(I,J))+...
                (ALPHA3(I)*DT*LAMHAT3(I,J)*CSBACK3(I,J)/BETA2);
    elseif (ALPHA3(I) ~= 0) && (AREA3(I) ~= 0) && (ALPHA(I) ~= 0) && (AREA2(I) ~= 0)  
        BETA4(I,J) = 2-GAMMA1(I)-DT*(LAMBDA2(I,J)+LAMHAT2(I,J)+ALPHA3(I));
        BETA5(I,J) = 2-GAMMA3(I)-DT*(LAMBDA3(I,J)+LAMHAT3(I,J));
        BETA6(I,J) = DT*ALPHA3(I)/(2+GAMMA3(I)+DT*(LAMHAT3(I,J)+LAMBDA3(I,J)));
        BETA7(I,J) = 2+GAMMA1(I)+DT*(LAMHAT2(I,J)+LAMBDA2(I,J)+ALPHA3(I));
        Rstor(I,J) = 0.5*ALPHA(I)*(CONC2N(I,J)-CONCN(I,J)+...
               (BETA4(I,J)*CONC2N(I,J)+GAMMA1(I)*CONCN(I,J)+2*DT*LAMHAT2(I,J)*CSBACK(I,J)+...
               BETA6(I,J)*(BETA5(I,J)*CONC3N(I,J)+GAMMA3(I)*CONC2N(I,J)+2*DT*LAMHAT3(I,J)*CSBACK3(I,J))+...
               DT*ALPHA3(I)*CONC3N(I,J))/(BETA7(I,J)*(1-BETA6(I,J)*GAMMA3(I)/BETA7(I,J))));
    end;
end;

