%!**********************************************************************
%
%     Subroutine FLUXCOMP            Called by: DYNCONC,SSDIFF
%
%     --
%
%***********************************************************************
%
%FADV(1,J) = - Q(1) / AREA(1)*(CONC(2,J)-CONC(1,J)/(DELTAX(1)))*AREA(1);
FADV(1,J) = - Q(1) * (CONC(2,J)-CONC(1,J)); %12/14/2011
FDIS(1,J) = 0;
for I = 2:IMAX-1
%    FADV(I,J) = - Q(I) / AREA(I)*(CONC(I+1,J)-CONC(I-1,J)/(2*DELTAX(I)))*AREA(I); 
    FADV(I,J) = - Q(I) * (CONC(I+1,J)-CONC(I-1,J));    %12/14/2011
%    FDIS(I,J) = (AD(I)*(CONC(I+1,J)-CONC(I,J))-AD(I-1)*(CONC(I,J)-CONC(I-1,J)))/(AREA(I)*DELTAX(I)^2)*AREA(I);
    FDIS(I,J) = (CONC(I+1,J)+CONC(I-1,J)-2*CONC(I,J))*AD(I)/DELTAX(I); %12/14/2011
end;
%FADV(IMAX,J) = - Q(IMAX) / AREA(IMAX)*(CONC(IMAX,J)-CONC(IMAX-1,J))/DELTAX(IMAX)*AREA(IMAX);
FADV(IMAX,J) = - Q(IMAX) * (CONC(IMAX,J)-CONC(IMAX-1,J)); %12/14/2011
FDIS(IMAX,J) = 0;
for I = 1:IMAX
    FDEC(I,J) = -LAMBDA(I,J)*CONC(I,J)*AREA(I);
    FSOR(I,J) = RHO(I,J)*LAMHAT(I,J)*(CSED(I,J) - KD(I,J)*CONC(I,J))*AREA(I);
    if INEST == 1
        FSTO(I,J) = ALPHA(I,J)*(CONC2(I,J)-CONC(I,J))*AREA(I);
        FSTS(I,J) = (ALPHA(I,J)*AREA(I)/AREA2(I)*(CONC(I,J)-CONC2(I,J))+ALPHA3(I,J)*(CONC3(I,J)-CONC2(I,J))+LAMHAT2(I,J)*(CSBACK(I,J)-CONC2(I,J))-LAMBDA2(I,J)*CONC2(I,J))*AREA2(I);
        FHTS(I,J) = (ALPHA3(I,J)*AREA2(I)/AREA3(I)*(CONC2(I,J)-CONC3(I,J))+LAMHAT3(I,J)*(CSBACK3(I,J)-CONC3(I,J))-LAMBDA3(I,J)*CONC3(I,J))*AREA3(I);
    else
        FSTO(I,J) = (ALPHA(I,J)*(CONC2(I,J)-CONC(I,J)) + ALPHA3(I,J)*(CONC3(I,J)-CONC(I,J)))*AREA(I);
        FSTS(I,J) = (ALPHA(I,J)*AREA(I)/AREA2(I)*(CONC(I,J)-CONC2(I,J))+LAMHAT2(I,J)*(CSBACK(I,J)-CONC2(I,J))-LAMBDA2(I,J)*CONC2(I,J))*AREA2(I);
        FHTS(I,J) = (ALPHA3(I,J)*AREA(I)/AREA3(I)*(CONC(I,J)-CONC3(I,J))+LAMHAT3(I,J)*(CSBACK3(I,J)-CONC3(I,J))-LAMBDA3(I,J)*CONC3(I,J))*AREA3(I);
    end;    
    FMC(I,J) = FADV(I,J) + FDIS(I,J) + FSTO(I,J) + FSOR(I,J) + FDEC(I,J) + FLAT(I,J) ;
end;
