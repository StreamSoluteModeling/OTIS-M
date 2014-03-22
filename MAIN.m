%***********************************************************************
%
%     OTIS: One-dimensional Transport with Inflow and Storage
%     -------------------------------------------------------
%     
%     OTIS is a mathematical simulation model used to characterize the
%     fate and transport of water-borne solutes in streams and rivers.
%     The governing equation underlying the model is the advection-
%     dispersion equation with additional terms to account for transient
%     storage, lateral inflow, first-order decay and sorption. This
%     equation and the associated equations describing transient
%     storage and sorption are solved using a Crank-Nicolson finite
%     difference solution.
%
%     The OTIS solute transport model, data, and documentation are made
%     available by the U.S. Geological Survey (USGS) to be used in the
%     public interest and the advancement of science. You may, without
%     any fee or cost, use, copy, modify, or distribute this software,
%     and any derivative works thereof, and its supporting
%     documentation, SUBJECT TO the USGS software User's Rights Notice
%     (http://h20.usgs.gov/software/software_notice.html)
%
%
%***********************************************************************
%
%     Version: OTIS-m10       December 2010
%
%***********************************************************************
%
%     Reference
%     ---------
%     Runkel, R.L., 199x, One dimensional transport with inflow and
%       storage (OTIS): A solute transport model for streams and rivers:
%       U.S. Geological Survey Water-Resources Investigation Report
%       9x-xxxx. xx p.
%
%     Homepage:  http://webserver.cr.usgs.gov/otis/home.html
%     ---------
%
%     Original Author
%     ---------------
%     R.L. Runkel
%
%     Matlab 2-SZ Author
%     ------------------
%     Patrick C. Kerr
%     University of Notre Dame
%     Internet: www.nd.edu/~pkerr
%
%***********************************************************************
%
%                            SEGMENTATION
%
%***********************************************************************
%
%
%
%     |<--- Hi-1 --->|<---- Hi ---->|<--- Hi+1 --->|
%     ______________________________________________
%     |              |              |              |
%     |     Ci-1     |      Ci      |     Ci+1     |
%     |     Qi-1     |      Qi      |     Qi+1     | 
%     |     Ai-1     |      Ai      |     Ai+1     |
%     |              |              |              |              
%     ----------------------------------------------
%                  DFACEi         DFACEi+1
%                  AFACEi         AFACEi+1
%
%     where:
%
%           A = AREA
%           C = CONC, CONC2, or SORB
%           H = DELTAX
%
%     as defined below.
%
%
%***********************************************************************
%
%                      DICTIONARY - INPUT VARIABLES
%
%***********************************************************************

%   Program Variables
%   -------------------
%   I
%   J
%   K
%   Reach
%   Seg
%   Sol
%
%   MAIN.m
%   -------------------
%   CF*                     Folder location of Project Files
%   WF*                     Folder location of OTIS M
%
%   MAININIT.m
%   -------------------
%   CHEM*                   type of chemistry considered (reactive or conservative)
%
%   INPROJ.m
%   -------------------
%   TITLE*                  simulation title
%   PSTEP*                  print step interval [hr]
%   TSTEP*                  time step interval [hr]
%   TSTART*                 starting time [hr]
%   TFINAL*                 final time [hr]
%   XSTART*                 starting distance at upstream boundary [L]
%   DSBOUND*                downstream boundary condition (flux) [mass/L^2-s]
%   QSTART                  volumetric flowrate at upstream boundary [L^3/s]
%   QSTEP                   time interval between changes in flow (0=steady flow)
%   IBOUND                  boundary condition option
%   IGRAPH                  graph output flag
%   IMETRIC                 metric output flag
%   IMOVIE                  movie output flag
%   INEST*                  nested model structure option
%   IOPT                    optimization flag
%   ISTEADY*                steady flow flag
%   ITIMEC*                 time series flag
%   LU*                     length unit
%   NSOLUTE*                number of solutes to simulate
%   NAMESOL(NSOLUTE)        solute names
%   CU(NSOLUTE)             solute concentration unit
%   TIME                    time [hr]
%   IPRINT                  number of iterations between printing of results
%
%   INGEOM.m
%   ----------------------------------------------------
%   NREACH*                 number of reaches
%   NSEG(NREACH)            number of segments
%   RCHLEN(NREACH)          length of reach [L]
%   IDISP(NREACH)           dispersion coefficient [L^2/s]
%   IAREA2(NREACH)          storage zone #1 cross-sectional area [L^2]
%   IALPHA(NREACH)          SZ#1 exchange coefficient [/s]
%   IAREA3(NREACH)          storage zone #2 cross-sectional area [L^2]
%   IALPHA3(NREACH)         SZ#2 exchange coefficient [/s]
%   IDELTA(NREACH)
%   IMAX*                   number of segments
%   DELTAX(IMAX)            segment length [L]
%   LASTSEG(NREACH)         last segment in each reach
%   END(NREACH)
%   DISP(IMAX)              dispersion coefficient [L^2/s]
%   AREA2(IMAX)             storage zone #1 cross-sectional area [L^2]
%   ALPHA(IMAX)             SZ#1 exchange coefficient [/s]
%   AREA3(IMAX)             storage zone #2 cross-sectional area [L^2]
%   ALPHA3(IMAX)            SZ#2 exchange coefficient [/s]
%   DIST                    distance corresponding to segment centroid

%
%   INPRINT.m
%   --------------------------
%   NPRINT*                 number of print locations
%   RPRTLOC(NPRINT)         requested distance at which results are printed [L]
%
%   INCHEM.m
%   ----------------------------------------------------------
%   ILAMBDA(NREACH*NSOLUTE)     decay coefficient for the main channel [/s]
%   ILAMBDA2(NREACH*NSOLUTE)    decay coefficient for the storage zone #1 [/s]
%   ILAMBDA3(NREACH*NSOLUTE)    decay coefficient for the storage zone #2 [/s]
%   ILAMHAT(NREACH*NSOLUTE)     sorption rate coefficient for the main channel [/sec]
%   ILAMHAT2(NREACH*NSOLUTE)    sorption rate coefficient for the storage zone #2 [/sec]
%   ILAMHAT3(NREACH*NSOLUTE)    sorption rate coefficient for the storage zone #3 [/sec]
%   IRHO(NREACH*NSOLUTE)        mass of accessibile sediment/volume water in MC [mass/L^3]
%   IKD(NREACH*NSOLUTE)         distribution coefficient  in MC [L^3/mass]
%   ICSBACK((NREACH*NSOLUTE)    background storage zone solute concentration [mass/L^3]
%   ICSBACK3(NREACH*NSOLUTE)    background storage zone #3 solute concentration [mass/L^3]
%   LAMBDA(IMAX,NSOLUTE)        decay coefficient for the main channel [/s]
%   LAMBDA2(IMAX,NSOLUTE)       decay coefficient for the storage zone #1 [/s]
%   LAMBDA3(IMAX,NSOLUTE)       decay coefficient for the storage zone #2 [/s]
%   LAMHAT(IMAX,NSOLUTE)        sorption rate coefficient for the main channel [/sec]
%   LAMHAT2(IMAX,NSOLUTE)       sorption rate coefficient for the storage zone #2 [/sec]
%   LAMHAT3(IMAX,NSOLUTE)       sorption rate coefficient for the storage zone #3 [/sec]
%   RHO(IMAX,NSOLUTE)           mass of accessibile sediment/volume water in MC [mass/L^3]
%   RHOLAM(IMAX,NSOLUTE)        mass of access. sediment times the m.c. sorption rate
%   KD(IMAX,NSOLUTE)            distribution coefficient  in MC [L^3/mass]
%   CSBACK((IMAX,NSOLUTE)       background storage zone solute concentration [mass/L^3]
%   CSBACK3(IMAX,NSOLUTE)       background storage zone #3 solute concentration [mass/L^3]
%
%   INBOUND.m
%   -------------------------------------------------------------
%   NBOUND*                     number of different upstream boundary conditions
%   USTIME(NBOUND)              time at which upstream boundary condition goes into effect [hr]
%   USBC(NBOUND,NSOLUTE)        upstream boundary condition
%   USCONC(NBOUND,NSOLUTE)      concentration at the upstream
%   USCONCN*
%
%   QSTEADY.m
%   ----------------------------------
%   IQLATIN(NREACH)             lateral inflow rate [L^3/s-L]
%   IQLATOUT(NREACH)            lateral outflow rate [L^3/s-L]
%   IAREA(NREACH)               main channel cross-sectional area [L^2]
%   ICLATIN(NREACH*NSOLUTE)     concentration of lateral inflow [mass/L^3]
%   QLATIN(IMAX)                lateral inflow rate [L^3/s-L]
%   QLATOUT(IMAX)               lateral outflow rate [L^3/s-L]
%   AREA(IMAX)                  main channel cross-sectional area [L^2]
%   CLATIN(IMAX,NSOLUTE)        concentration of lateral inflow [mass/L^3]
%
%   QUNSTEAD.m
%   -------------------------------------------------
%   NNFLOW*                     number of unsteady flow lines
%   NFLOW*                      number of locations at which Q and AREA are specified
%   FLOWLOC(NFLOW)              distance at which Q and AREA are specified [L]
%   QVALUE(NFLOW,NSTEP)         flowrates at specified distances
%   QINVAL(NFLOW,NSTEP)         lateral inflow rate at specified distances
%   QOUTVAL(NFLOW,NSTEP)        lateral outflow rate at specified distances
%   AVALUE(NFLOW,NSTEP)         areas at specified distances
%   CLVAL(NFLOW,NSTEP*NSOLUTE)  concentration of lateral inflows at specified distances
%   QNSTEP*                     number of unsteady flow steps
%
%   SETTYPE.m
%   -------------------------------------------------


%   FLOWINIT.m
%   -------------------------------------------------
%   Q(IMAX)                     volumetric flowrate [L^3/s]
%
%   QWEIGHTS.m
%   -------------------------------------------------
%   QWT(IMAX)                   weight used to interpolate between QINDEX and QINDEX+1
%   QINDEX(IMAX)                flow location used for interpolation (when QSTEP > 0)
%   DSDIST(IMAX)                distance to the nearest downstream flow location/DELTAX
%   USDIST(IMAX)                distance to the nearest upstream flow location / DELTAX 
%
%   QAINIT.m
%   -------------------------------------------------
%   UQ(IMAX,NQSTEP)
%   UAREA(IMAX,NQSTEP)
%   UQLATIN(IMAX,NQSTEP)
%   UQLATOUT(IMAX,NQSTEP)
%   UCLATIN(IMAX,NQSTEP*NSOLUTE)
%
%   PREPROC.m
%   -------------------------------------------------
%   TIMEB*                      inverse of the time step [/sec]
%   JBOUND*                     index of the current boundary condition
%   BCSTOP*                     time at which the boundary conditions change
%   QSTOP*                      time at which the flow variables change
%
%   PREPROC1.m - Time invariant (H = DELTAX)
%   -------------------------------------------------
%   DFACE(IMAX)                 dispersion coefficient @ interface of segments I,I+1
%   HPLUSF(IMAX)                H(i) + H(i+1)
%   HPLUSB(IMAX)                H(i) + H(i-1)
%   HMULTF(IMAX)                H(i) [ H(i) + H(i+1) ]
%   HMULTB(IMAX)                H(i) [ H(i) + H(i-1) ]
%   HDIV(IMAX)                  H(i) / [ H(i) + H(i+1) ]
%   HDIVF(IMAX)                 H(i+1) / [ H(i) + H(i+1) ]
%   HADV(IMAX)                  0.5/H(i) { H(i+1)/[H(i+1)+H(i)] - H(i-1)/[H(i-1)+H(i)]}
%
%   PREPROC3.m
%   -------------------------------------------------
%   AFACE(IMAX)                 cross sectional area @ interface of segments I,I+1
%   AD(IMAX)
%   E(IMAX,NSOLUTE)
%   F(IMAX,NSOLUTE)
%   G(IMAX,NSOLUTE)
%   GAMMA1(IMAX)                
%   GAMMA2(IMAX)
%   GAMMA3(IMAX)
%   Fdt*
%   Eadv*
%   Fadv*
%   Gadv*
%   Edisp*
%   Fdisp*
%   Gdisp*
%   Flat*
%   Fdecay*
%   Fsorp*
%   Fstor*
%   AREAN(IMAX)
%   QN(IMAX)
%   AFACEN(IMAX)
%   GAMMA1N(IMAX)
%   GAMMA2N(IMAX)
%   GAMMA3N(IMAX)
%   QLATINN(IMAX)
%   CLATINN(IMAX)
%   ADN(IMAX)
%
%   FSTOR.m
%   -------------------------------------------------
%   BETA1*
%   BETA2*
%   BETA3*
%   BETA6*
%
%   SETSTOP.m
%   -------------------------------------------------
%   STOPTYPE   indicates whether the next TSTOP is due to a change
%              in the boundary conditions or the flow variables.
%   TSTOP      time at which the boundary condition or flow variables change  
%
%   SSDIFF.m
%   -------------------------------------------------
%   W(IMAX)             upper diagonal of the tridiagonal matrix
%   X(IMAX)             main diagonal of the tridiagonal matrix
%   Y(IMAX)             lower diagonal of the tridiagonal matrix
%   Z(IMAX)             constant vector
%   Wadv*
%   Xadv*
%   Yadv*
%   Zadv*
%   Wdisp*
%   Xdisp*
%   Ydisp*
%   Zdisp*
%   Xlat*
%   Zlat*
%   Xdecay*
%   m(IMAX)
%   CONC(IMAX,NSOLUTE)      concentration in main channel [mass/L^3]
%
%   XZSTOR.m
%   -------------------------------------------------
%   Xstor*
%   Zstor*
%
%   SSCONC.m
%   -------------------------------------------------
%   CONC2(IMAX,NSOLUTE)     concentration in storage zone #1 [mass/L^3]
%   CONC3(IMAX,NSOLUTE)     concentration in storage zone #2 [mass/L^3]
%   CSED(IMAX,NSOLUTE)      streambed sediment concentration [mass/mass]
%
%   OUTINIT.m
%   -------------------------------------------------
%   QQ(NPRINT)      interpolated initial flows
%
%   MAINRUN.m
%   -------------------------------------------------
%
%***********************************************************************
    
 
clc; clear all;             % Clear Workspace
WF = cd;                    % Identify Working Folder (Folder Containing Program Files)
SPath = 'C:\Users\Patrick\Desktop\PSU2\Model\PCK-2SZ\Files\TEST\Nest';              % Hardwire Starting Path
CF = uigetdir(SPath);       % Call Project Folder
INPUT                       % Read Input Files
ECHO                        % Summarize Input Data & Errors Found
pcase = 0;
IPROGRESS = 0;
if ERRORS == 0
    if IOPT == 1
        IOFUNCTION = 1;
        pcase = 1;
        OPTINIT             % Initialize Optimization
    end
    pcase = 2;    
    MAININIT            % Compute Initial Concentration
    if strcmp(CHEM,'Steady-State')==0
    	MAINRUN         % Perform Dynamic Simulation
    end;
    OUTPUT
end;