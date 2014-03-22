%!*********************************************************************
%
%     Subroutine PREPROC3         Called by: PREPROC, UPDATE, SETUP3
%
%     compute several parameter groups that are time-invariant given a
%     steady flow regime (note that for unsteady flow regimes, this
%     routine is called multiple times).  The parameter groups are used
%     to develop the A, B, and C vectors that comprise the tridiagonal
%     matrix.  After the vectors are computed, the tridiagonal
%     coefficient matrix is decomposed.  This leaves only the
%     substitution phase of the Thomas algorithm to be completed at
%     each timestep.
%
%***********************************************************************
AFACE=zeros(IMAX,1);
AD=zeros(IMAX,1);
%
GAMMA1 = zeros(IMAX,1);
GAMMA2 = zeros(IMAX,1);
GAMMA3 = zeros(IMAX,1);
%
E = zeros(IMAX,NSOLUTE);
Eadv = zeros(IMAX,NSOLUTE);
Edisp = zeros(IMAX,NSOLUTE);
%
F = zeros(IMAX,NSOLUTE);
Fadv = zeros(IMAX,NSOLUTE);
Fdisp = zeros(IMAX,NSOLUTE);
Flat = zeros(IMAX,NSOLUTE);
Fstor = zeros(IMAX,NSOLUTE);
Fstor1 = zeros(IMAX,NSOLUTE);
Fstor2 = zeros(IMAX,NSOLUTE);
Fdecay = zeros(IMAX,NSOLUTE);
Fsorp = zeros(IMAX,NSOLUTE);
%
G = zeros(IMAX,NSOLUTE);
Gadv = zeros(IMAX,NSOLUTE);
Gdisp = zeros(IMAX,NSOLUTE);
%
R=zeros(IMAX,NSOLUTE);
Rdt = zeros(IMAX,NSOLUTE);
Radv = zeros(IMAX,NSOLUTE);
Rdisp = zeros(IMAX,NSOLUTE);
Rlat = zeros(IMAX,NSOLUTE);
Rstor = zeros(IMAX,NSOLUTE);
Rstor1 = zeros(IMAX,NSOLUTE);
Rstor2 = zeros(IMAX,NSOLUTE);
Rsorp = zeros(IMAX,NSOLUTE);
Rdecay = zeros(IMAX,NSOLUTE);
%
for I = 1:IMAX
    if AREA2(I) == 0
        GAMMA1(I) = 0;
    else
        GAMMA1(I) = AREA(I) * ALPHA(I) * DT / AREA2(I);
    end;
    if AREA3(I) == 0        
        GAMMA2(I) = 0;
        GAMMA3(I) = 0;
    else
        GAMMA2(I) = AREA(I) * ALPHA3(I) * DT / AREA3(I);
        GAMMA3(I) = AREA2(I) * ALPHA3(I) * DT / AREA3(I);
    end;
end;
%
for J = 1:NSOLUTE
    %
    %     Compute the cross sectional area at the interface 
    %     between segments one and two.
    %
    AFACE(1) = HDIV(1) * AREA(2) +  HDIVF(1) * AREA(1); 
    %
    Fdt = 1/DT;
    %
    Eadv(1,J) = 0;
    Fadv(1,J) = 0.5 * Q(1) * HDIVF(1) / (AREA(1)*DELTAX(1));
    Gadv(1,J) = 0.5 * Q(1) / (AREA(1) * HPLUSF(1));
    %
    AD(1) = AFACE(1) * DFACE(1);
    %AD(0) = AD(1);
    Edisp(1,J) = 0;
    Fdisp(1,J) = (AD(1)/HPLUSF(1) + AD(1)/DELTAX(1)) / (AREA(1)*DELTAX(1)); %AD(0) replaced by AD(1)
    Gdisp(1,J) = - AD(1) / (AREA(1) * HMULTF(1));
    %
    Flat(1,J) = 0.5* QLATIN(1) / AREA(1);
    %
    FSTOR
    %
    Fdecay(1,J) = 0.5 * LAMBDA(I,J);
    Fsorp(1,J) = RHO(I,J) * LAMHAT(I,J) *KD(I,J) / (2 + DT*LAMHAT(I,J));
    %
    %     combine terms to create matrix coefficients
    %
    E(1,J) = Eadv(1,J) + Edisp(1,J);
    F(1,J) = Fdt + Fadv(1,J) + Fdisp(1,J) + Flat(1,J)+ Fstor(1,J) + Fsorp(1,J) + Fdecay(1,J);
    G(1,J) = Gadv(1,J) + Gdisp(1,J);
    %
    %     set coefficients for segments 2 through IMAX-1.  The coefficients
    %     are developed on a term by term basis, so that changes to an 
    %     individual term of the differential equation can be easily made.
    %
    for I = 2:IMAX-1
    %
    %        compute the cross-sectional area at the interface
    %        between segments I and I+1.
    %
        AFACE(I) = HDIV(I) * AREA(I+1) + HDIVF(I) * AREA(I);
    %
        Eadv(I,J) = - 0.5 * Q(I)/(AREA(I) * HPLUSB(I));
        Fadv(I,J) = HADV(I) * Q(I) / AREA(I);
        Gadv(I,J) = 0.5 * Q(I) / (AREA(I) * HPLUSF(I));
    %
        AD(I) = AFACE(I) * DFACE(I);
        Edisp(I,J) = - AD(I-1) / (AREA(I) * HMULTB(I));
        Fdisp(I,J) = (AD(I)/HPLUSF(I)+AD(I-1)/HPLUSB(I))/(AREA(I)*DELTAX(I));
        Gdisp(I,J) = - AD(I) / (AREA(I) * HMULTF(I));
    %
        Flat(I,J) = 0.5* QLATIN(1) / AREA(1);
    %
        FSTOR
    %
        Fdecay(I,J) = 0.5 * LAMBDA(I,J);
        Fsorp(I,J) = RHO(I,J) * LAMHAT(I,J) *KD(I,J) / (2 + DT*LAMHAT(I,J));    
    %
    %        combine terms to create matrix coefficients
    %
        E(I,J) = Eadv(I,J) + Edisp(I,J);
        F(I,J) = Fdt + Fadv(I,J) + Fdisp(I,J) + Flat(I,J) + Fstor(I,J) + Fsorp(I,J) + Fdecay(I,J);
        G(I,J) = Gadv(I,J) + Gdisp(I,J);
    %
    end;
    %
    %     Set coefficients for the last segment 
    %
    I = IMAX;
    %
    AFACE(I) =  AREA(I);
    %
    Eadv(I,J) = - 0.5 * Q(I) / (AREA(I)*HPLUSB(I));
    Fadv(I,J) = -Eadv(I,J);
    Gadv(I,J) = 0;
    %
    Edisp(I,J) = - AD(I-1) / (AREA(I) * HMULTB(I));
    Fdisp(I,J) = AD(I-1)/(AREA(I)*HMULTB(I));
    Gdisp(I,J) = 0;
    %
    Flat(I,J) = 0.5* QLATIN(1) / AREA(1);
    %
    FSTOR
    %
    Fdecay(I,J) = 0.5 * LAMBDA(I,J);
    Fsorp(I,J) = RHO(I,J) * LAMHAT(I,J) *KD(I,J) / (2 + DT*LAMHAT(I,J));
    %
    %     combine terms and set matrix coefficients
    %
    E(I,J) = Eadv(I,J) + Edisp(I,J);
    F(I,J) = Fdt + Fadv(I,J) + Fdisp(I,J) + Flat(I,J) + Fstor(I,J) + Fsorp(I,J) + Fdecay(I,J);
    G(I,J) = Gadv(I,J) + Gdisp(I,J);
end;
%
%     save variables for previous time step 'N'
%
AREAN = AREA;
QN = Q;
AFACEN = AFACE;
GAMMA1N = GAMMA1;
GAMMA2N = GAMMA2;
GAMMA3N = GAMMA3;
QLATINN = QLATIN;
CLATINN = CLATIN;
ADN = AD;