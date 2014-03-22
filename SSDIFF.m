%!**********************************************************************
%
%     Subroutine SSDIFF               Called by: MAININIT
%
%     Develop the finite difference equation for each segment.  The
%     resulting equation set is solved to determine the steady-state
%     concentrations.
%
%***********************************************************************
%
AD=zeros(IMAX,1);
AFACE = zeros(IMAX,1);
%
%     arguments passed to MATRIX
%
W = zeros(IMAX,NSOLUTE);
Wadv = zeros(IMAX,NSOLUTE);
Wdisp = zeros(IMAX,NSOLUTE);
%
X = zeros(IMAX,NSOLUTE);
Xadv = zeros(IMAX,NSOLUTE);
Xdisp = zeros(IMAX,NSOLUTE);
Xlat = zeros(IMAX,NSOLUTE);
Xstor = zeros(IMAX,NSOLUTE);
Xstor1 = zeros(IMAX,NSOLUTE);
Xstor2 = zeros(IMAX,NSOLUTE);
Xdecay = zeros(IMAX,NSOLUTE);
%
Y = zeros(IMAX,NSOLUTE);
Yadv = zeros(IMAX,NSOLUTE);
Ydisp = zeros(IMAX,NSOLUTE);
%
Z = zeros(IMAX,NSOLUTE);
Zadv = zeros(IMAX,NSOLUTE);
Zdisp = zeros(IMAX,NSOLUTE);
Zlat = zeros(IMAX,NSOLUTE);
Zstor = zeros(IMAX,NSOLUTE);
Zstor1 = zeros(IMAX,NSOLUTE);
Zstor2 = zeros(IMAX,NSOLUTE);
%
CONC =zeros(IMAX,NSOLUTE);
CONC2 = zeros(IMAX,NSOLUTE);
CONC3 = zeros(IMAX,NSOLUTE);
CSED = zeros(IMAX,NSOLUTE);
FADV = zeros(IMAX,NSOLUTE);
FDIS = zeros(IMAX,NSOLUTE);
FDEC = zeros(IMAX,NSOLUTE);
FLAT = zeros(IMAX,NSOLUTE);
FSOR = zeros(IMAX,NSOLUTE);
FMC = zeros(IMAX,NSOLUTE);
FSTO = zeros(IMAX,NSOLUTE);
FSTS = zeros(IMAX,NSOLUTE);
FHTS = zeros(IMAX,NSOLUTE);
%
%     begin loop for each solute
%
for J = 1:NSOLUTE
%
    I = 1;
%
%        Compute the cross sectional area at the interface between
%        segments one and two.
%
    AFACE(1) = HDIV(1) * AREA(2) + HDIVF(1) * AREA(1);
%
%        set coefficients for segment 1.  The coefficients are developed
%        on a term by term basis, so that changes to an individual term
%        of the differential equation can be easily made.
%
%
%        contributions from the advection term,
%
%                    Q   dC
%                -  --- ----
%                    A   dx
%
%
    Wadv(I,J) = 0;
    Xadv(I,J) = Q(1) * HDIVF(1) / (AREA(1) * DELTAX(1));
    Yadv(I,J) = Q(1) / (AREA(1) * HPLUSF(1));
    Zadv(I,J) = Q(1) * USCONC(JBOUND,J) / (AREA(1) * DELTAX(1));
%
%        contributions from the dispersion term,
%
%                    1   d        dc
%                +  --- ---- (AD ----)
%                    A   dx       dx
%
%
    AD(1) = AFACE(1) * DFACE(1);    
%   AD0 = AD(1);
    Wdisp(I,J) = 0;
	Xdisp(I,J) = 2*(AD(1)/HPLUSF(1)+AD(1)/DELTAX(1))/(AREA(1)*DELTAX(1)); %AD(0) replaced with AD(1)
    Ydisp(I,J) = - 2 * AD(1) / (AREA(1) * HMULTF(1));
	Zdisp(I,J) = 2 * AD(1) * USCONC(JBOUND,J)/(AREA(1) * DELTAX(1) * DELTAX(1)); %AD(0) replaced with AD(1)
%
%        contributions from the lateral inflow term,
%
%                    q
%                +  --- (Cl - C)
%                    A
%
%
     Xlat(I,J) = QLATIN(1) / AREA(1);
     Zlat(I,J) = QLATIN(1) * CLATIN(1,J) / AREA(1);
%
%        contributions from the transient storage term,
%
%                 +  alpha (Cs - C)
%         
%        note that if alpha equals zero, there is no contribution
%
    XZSTOR
%
%        contributions from the decay term,
%
%                 -  lambda C
%
    Xdecay(I,J) = LAMBDA(1,J);
%
%           Combine contributions
%       
    W(I,J) = Wadv(I,J) + Wdisp(I,J);
    X(I,J) = Xadv(I,J) + Xdisp(I,J) + Xlat(I,J) + Xstor(I,J) + Xdecay(I,J);
    Y(I,J) = Yadv(I,J) + Ydisp(I,J);
    Z(I,J) = Zadv(I,J) + Zdisp(I,J) + Zlat(I,J) + Zstor(I,J);
%
%        set coefficients for segments 2 through IMAX-1.  The coefficients
%        are developed on a term by term basis, so that changes to an
%        individual term of the differential equation can be easily made.
%
     for I = 2:IMAX-1
%
%           compute the cross-sectional area at the interface
%           between segments I and I+1.
%
        AFACE(I) = HDIV(I) * AREA(I+1) + HDIVF(I) * AREA(I);
%
%           contributions from the advection term,
%
%                       Q   dC
%                   -  --- ----
%                       A   dx
%
%
        Wadv(I,J) = - Q(I) / (AREA(I) * HPLUSB(I));
        Xadv(I,J) = Q(I) * 2 * HADV(I) / AREA(I);
        Yadv(I,J) = Q(I) / (AREA(I) * HPLUSF(I));
        Zadv(I,J) = 0;
%
%           contributions from the dispersion term,
%
%                       1   d        dc
%                   +  --- ---- (AD ----)
%                       A   dx       dx
%
%
        AD(I) = AFACE(I) * DFACE(I);
        Wdisp(I,J) = - 2 * AD(I-1) / (AREA(I) * HMULTB(I));
        Xdisp(I,J) = 2*(AD(I)/HPLUSF(I)+AD(I-1)/HPLUSB(I))/(AREA(I)*DELTAX(I));
        Ydisp(I,J) = - 2 * AD(I) / (AREA(I) * HMULTF(I));
        Zdisp(I,J) = 0;
%
%           contributions from the lateral inflow term,
%
%                       q
%                   +  --- (Cl - C)
%                       A
%
%
        Xlat(I,J) = QLATIN(I) / AREA(I);
        Zlat(I,J) = QLATIN(I) * CLATIN(I,J) / AREA(I);
%
%           contributions from the transient storage term,
%
%                    +  alpha (Cs - C)
%         
%           note that if alpha equals zero, there is no contribution
%
    XZSTOR
%
%           contributions from the decay term,
%
%                    -  lambda C
%
    Xdecay(I,J) = LAMBDA(I,J);
%
%           Combine contributions
%       
    W(I,J) = Wadv(I,J) + Wdisp(I,J);
    X(I,J) = Xadv(I,J) + Xdisp(I,J) + Xlat(I,J) + Xstor(I,J) + Xdecay(I,J);
    Y(I,J) = Yadv(I,J) + Ydisp(I,J);
    Z(I,J) = Zadv(I,J) + Zdisp(I,J) + Zlat(I,J) + Zstor(I,J);
     end;
%
%        Set coefficients for the last segment
%
     I = IMAX;
%
%        compute the cross-sectional area at the last interface
%
     AFACE(I) =   AREA(I);
%
%        contributions from the advection term,
%
%                    Q   dC
%                -  --- ----
%                    A   dx
%
%
     Wadv(I,J) = - Q(I) / (AREA(I) * HPLUSB(I));
     Xadv(I,J) =   Q(I) * (1 - DELTAX(I-1)/HPLUSB(I))/...
              (AREA(I)*DELTAX(I));
     Yadv(I,J) = 0;     
     if DFACE(I)>0
         Zadv(I,J) = - Q(I) * DSBOUND / (2 * AREA(I) * DFACE(I));
     else
         Zadv(I,J) = 0;
     end;
%
%        contributions from the dispersion term,
%
%                    1   d        dc
%                +  --- ---- (AD ----)
%                    A   dx       dx
%
%
     Wdisp(I,J) = - 2 * AD(I-1) / (AREA(I) * HMULTB(I));
     Xdisp(I,J) = 2 * AD(I-1) / (AREA(I) * HMULTB(I));
     Ydisp(I,J) = 0;
     Zdisp(I,J) = AFACE(I) * DSBOUND / (AREA(I) * DELTAX(I));
%
%        contributions from the lateral inflow term,
%
%                    q
%                +  --- (Cl - C)
%                    A
%
%
     Xlat(I,J) = QLATIN(I) / AREA(I);
     Zlat(I,J) = QLATIN(I) * CLATIN(I,J) / AREA(I);
%
%        contributions from the transient storage term,
%
%                 +  alpha (Cs - C)
%
%        note that if alpha equals zero, there is no contribution
%
    XZSTOR
%
%        contributions from the decay term,
%
%                 -  lambda C
%
    Xdecay(I,J) = LAMBDA(I,J);
%
%           Combine contributions
% 
    W(I,J) = Wadv(I,J) + Wdisp(I,J);
    X(I,J) = Xadv(I,J) + Xdisp(I,J) + Xlat(I,J) + Xstor(I,J) + Xdecay(I,J);
    Y(I,J) = Yadv(I,J) + Ydisp(I,J);
    Z(I,J) = Zadv(I,J) + Zdisp(I,J) + Zlat(I,J) + Zstor(I,J);
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
    %
    %     Thomas algorithm
    %
    for I = 2:IMAX
        m(I) = W(I)/X(I-1);
        X(I) = X(I) - m(I)*Y(I-1);
        Z(I) = Z(I) - m(I)*Z(I-1);
    end;

    CONC(IMAX,J) = Z(IMAX) / X(IMAX);
    for I = IMAX-1:-1:1
        CONC(I,J) = (Z(I) - Y(I)*CONC(I+1,J))/X(I);
    end;
    %
    SSCONC
    %
    FLUXCOMP
    %
end;
CONCN = CONC;
CONC2N = CONC2;
CONC3N = CONC3;
CSEDN = CSED;