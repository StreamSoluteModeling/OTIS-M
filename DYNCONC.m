%!**********************************************************************
%     
%     Subroutine REACT                Called by: DYNAMIC, DYNAMIC2
%
%     develop the finite difference equation for each segment.  The
%     resulting set of equations is solved to determine the main channel
%     concentrations at time 'N+1'.  The storage zone and streambed
%     sediment concentrations are then determined.
%
%     The solutes undergo first-order decay and/or sorption.
%
%     Local Variable
%     --------------
%     OLDCONC    concentration at time step N
% 
%***********************************************************************
CONCN = CONC;
CONC2N = CONC2;
CONC3N = CONC3;
CSEDN = CSED;
%
%     begin loop for each solute
%
for J = 1:NSOLUTE
%
    I = 1;
    Rdt(I,J) =   TIMEB * CONC(1,J);
    Tau1 = -(0.5 * QN(1) * HDIVF(1) / (AREAN(1)*DELTAX(1)))*CONC(1,J);
    Tau2 = -(0.5 * QN(1) / (AREAN(1) * HPLUSF(1))) * CONC(2,J);
    Tau3 = (0.5*QN(1)/(AREAN(1)*DELTAX(1)))*USCONC(JBOUND-1,J)+(0.5*Q(1)/(AREA(1)*DELTAX(1)))*USCONC(JBOUND,J);
    Radv(I,J) =	Tau1 + Tau2 + Tau3;
    Rdisp(I,J) = - ((ADN(1)/HPLUSF(1) + ADN(1)/DELTAX(1)) / (AREAN(1)*DELTAX(1)))*CONC(1,J)+... %ADN(0) replaced by ADN(1)
              (ADN(1) / (AREAN(1) * HMULTF(1))) * CONC(2,J)+...
              (DELTAX(1)^-2)*(ADN(1)/AREAN(1))*USCONC(JBOUND-1,J)+...%ADN(0) replaced by ADN(1)
              (DELTAX(1)^-2)*(AD(1)/AREA(1))*USCONC(JBOUND,J);
    Rlat(I,J) =  0.5 * (QLATINN(1) * (CLATINN(1,J) - CONC(1,J)) / AREAN(1) + QLATIN(1) * CLATIN(1,J) / AREA(1));
    RSTOR %Call RSTOR m-File
    Rsorp(I,J) = RHO(1,J)*LAMHAT(I,J)*(KD(1,J)*CONC(1,J)+DT*LAMHAT(1,J)*...
            CSED(1,J))/(2+DT*LAMHAT(1,J));
    Rdecay(I,J) = -0.5*LAMBDA(1,J)*CONC(1,J);
    R(I,J) = Rdt(I,J) + Radv(I,J) + Rdisp(I,J) + Rlat(I,J) + Rstor(I,J) + Rsorp(I,J) + Rdecay(I,J);
    for I = 2:IMAX-1
        Rdt(I,J) =   TIMEB * CONC(I,J);
        Tau1 = (0.5 * QN(I)/(AREAN(I) * HPLUSB(I)))*CONC(I-1,J);
        Tau2 = -(HADV(I) * QN(I) / AREAN(I))*CONC(I,J);
        Tau3 = -(0.5 * QN(I) / (AREAN(I) * HPLUSF(I)))*CONC(I+1,J);
        Radv(I,J) =	Tau1 + Tau2 + Tau3;
        Rdisp(I,J) = (ADN(I-1) / (AREAN(I) * HMULTB(I)))*CONC(I-1,J)-...
                ((ADN(I)/HPLUSF(I)+ADN(I-1)/HPLUSB(I))/(AREAN(I)*DELTAX(I)))*CONC(I,J)+...
                (ADN(I) / (AREAN(I) * HMULTF(I)))*CONC(I+1,J);
        Rlat(I,J) =  0.5 * (QLATINN(I) * (CLATINN(I,J) - CONC(I,J)) / AREAN(I) + QLATIN(I) * CLATIN(I,J) / AREA(I));
        RSTOR %Call RSTOR m-File
        Rsorp(I,J) = RHO(I,J)*LAMHAT(I,J)*(KD(I,J)*CONC(I,J)+DT*LAMHAT(I,J)*...
                CSED(I,J))/(2+DT*LAMHAT(I,J));
        Rdecay(I,J) = -0.5*LAMBDA(I,J)*CONC(I,J);
        R(I,J) = Rdt(I,J) + Radv(I,J) + Rdisp(I,J) + Rlat(I,J) + Rstor(I,J) + Rsorp(I,J) + Rdecay(I,J);
    end;                              
    I = IMAX;  
    Rdt(I,J) =   TIMEB * CONC(I,J);
    Tau1 = (0.5 * QN(I)/(AREAN(I) * HPLUSB(I)))*CONC(I-1,J);
    Tau2 = -(0.5 * QN(I)/(AREAN(I) * HPLUSB(I)))*CONC(I,J);
    if DFACE(I) > 0
        Tau3 = -(0.25*DSBOUND/DFACE(I)*(QN(I)/AREAN(I)+Q(I)/AREA(I)));
    else
        Tau3 = 0;
    end;    
    Radv(I,J) =	Tau1 + Tau2 + Tau3;
    Rdisp(I,J) = (ADN(I-1) / (AREAN(I) * HMULTB(I))) * CONC(I-1,J)-...
            (ADN(I-1) / (AREAN(I) * HMULTB(I))) * CONC(I,J)+...
            (0.5*DSBOUND/DELTAX(I))*(AFACEN(I)/AREAN(I)+AFACE(I)/AREA(I));
    Rlat(I,J) =  0.5 * (QLATINN(I) * (CLATINN(I,J) - CONC(I,J)) / AREAN(I) + QLATIN(I) * CLATIN(I,J) / AREA(I));
    RSTOR %Call RSTOR m-File
    Rsorp(I,J) = RHO(I,J)*LAMHAT(I,J)*(KD(I,J)*CONC(I,J)+DT*LAMHAT(I,J)*...
            CSED(I,J))/(2+DT*LAMHAT(I,J));
    Rdecay(I,J) = -0.5*LAMBDA(I,J)*CONC(I,J);
    R(I,J) = Rdt(I,J) + Radv(I,J) + Rdisp(I,J) + Rlat(I,J) + Rstor(I,J) + Rsorp(I,J) + Rdecay(I,J);
%
%     compute the simultaneous solution to a system of linear algebraic
%     equations, where the coefficient matrix is tridiagonal. 
%
%     The algorithm used to solve the tridiagonal system is known
%     as the Thomas algorithm.  The algorithm has been modified to
%     include work vector AWORK.  This vector is included so that the
%     contents of A are preserved.
%
%     (for more information, see 'Numerical Methods for Engineers', 
%      Chapra and Canale, 1988, pages 286-288)
%
    m=zeros(IMAX,1);
    WWW = zeros(IMAX,1);
    AAA = zeros(IMAX,IMAX);
    AAA = sparse(IMAX);
%    FX = F;
    for I = 1:IMAX
        AAA(I,I) = F(I,J);
        if I ~= 1
            AAA(I,I-1) = E(I,J);
        end;
        if I ~= IMAX
            AAA(I,I+1) = G(I,J);
        end;
        WWW(I) = R(I,J);
    end;
    CCC = AAA\WWW;
    for I = 1:IMAX
        CONC(I,J) = CCC(I);
    end;    
%
%     Thomas algorithm
%
%    for I = 2:IMAX
%        m(I) = E(I,J)/FX(I-1,J);
%        FX(I,J) = FX(I,J) - m(I)*G(I-1,J);  
%        R(I,J) = R(I,J) - m(I)*R(I-1,J);
%    end;%
%
%    CONC(IMAX,J) = R(IMAX,J) / FX(IMAX,J);
%    for I = IMAX-1:-1:1
%        CONC(I,J) = (R(I,J) - G(I,J)*CONC(I+1,J))/FX(I,J);
%    end;
%
%        Compute the storage and sorbed concentrations
%
    DYNSTOR
%
%    Compute Fluxes
%
    FLUXCOMP
end;