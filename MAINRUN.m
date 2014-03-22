%***********************************************************************
%
%     Subroutine MAINRUN        Called by: MAIN Program 
%
%     call the dynamic simulation routine and output results.
%
%***********************************************************************
%
if IPROGRESS == 1
    tic    
end
%
if IOFUNCTION == 1 || IOPT == 1
    MODMC=zeros(NOMC*NBOUND,1);
    MODSTS=zeros(NOSTS*NBOUND,1);
end
%
%
%     begin the time loop
%
for JBOUND = 2:NBOUND;
%
%   increment TIME, and check to see if the flow variables need
%
    TIMEN = TIME;
    TIME = str2double(num2str(TIME + TSTEP));
%
%   If the change occurs w/i the integration inverval (i.e.TIME-TSTEP < 
%   QSTOP < TIME), the change will be effective immediatly at QSTOP). 
%   Note that the user can avoid this problem by making the time step
%   compatible with the boundary conditions and the flow routing.
%
    while (TIME >= QSTOP)
    	QCHANGE
        PREPROC3           
    end;
%
%        compute concentrations
%
    DYNCONC
%

    if IOFUNCTION == 1 || IOPT == 1
        OCOUNT = str2double(num2str(TIME/TSTEP+1));
        for I=1:NOMC
            MODMC((I-1)*NBOUND+OCOUNT) = CONC(OPINDEX(I),1) + OWT(I) * (CONC(OPINDEX(I)+1,1) - CONC(OPINDEX(I),1));            
        end
        for I=1:NOSTS
            MODSTS((I-1)*NBOUND+OCOUNT) = CONC2(OPINDEX(I),1) + OWT(I) * (CONC2(OPINDEX(I)+1,1) - CONC2(OPINDEX(I),1));            
        end
    end

    if TIME >= PSTOP
        PSTOP = str2double(num2str(PSTOP + PSTEP));
    %
    %   Output BTCs vs TIME 
    %
        if IMOVIE == 1 && pcase == 2
            OUTTIMEC
        end
    %	
    %   Output BTCs at requested print locations
    %
        if NPRINT ~= 0 && pcase > 1
            PULLPRTC
        end;
    %    
    %       Output Current Progress
    %  
        if IPROGRESS == 1
            clc;
            TNOW = toc;
            TRCNT = (1/(TIME/(TFINAL-TSTART))-1)*TNOW;
            if IOPT == 1
                                            % Simulation Count
                                            % Previous Metric Value
                                            % Current Metric Value
                                            % Number of Simulations Left
                                            % Projected Optimization Time Remaining
            end;
            disp(strrep(strcat(num2str(TNOW),':seconds have elapsed'),':',' '))
            disp(strrep(strcat('Currently at:', num2str(TIME), ':hours of:',num2str(TFINAL),':hours.'),':',' '))
            disp(strrep(strcat('Estimated Time Remaining:', num2str(TRCNT(1)), ':seconds'),':',' '))
        end
    end
end;
if IOFUNCTION == 1 || IOPT == 1
    %Calc the Root Mean Squared Error
    if OSYSTEM == 1
        if NOSTS == 1
            OBSERVED = [OMC(:,1);OSTS(:,1)];
            WEIGHT = [OMC(:,2);OSTS(:,2)];
            MODEL = [MODMC(:,1);MODSTS(:,1)];
        else
            OBSERVED = OMC(:,1);
            WEIGHT = OMC(:,2);
            MODEL = MODMC(:,1);
        end
    else
        OBSERVED = zeros(0,1);
        WEIGHT = zeros(0,1);
        MODEL = zeros(0,1);    
        for KZ=1:NOMC
            if NOBSMC(KZ,2) == Reach
                OBSERVED = [OBSERVED;OMC(KZ*(NBOUND-1)+1:KZ*NBOUND,1)];
                WEIGHT = [WEIGHT;OMC(KZ*(NBOUND-1)+1:KZ*NBOUND,2)];
                MODEL = [MODEL;MODMC(KZ*(NBOUND-1)+1:KZ*NBOUND,1)];
            end;
        end
        if NOSTS == 1
            for KZ=1:NOSTS
                if NOBSSTS(KZ,2)== Reach
                    OBSERVED = [OBSERVED;OSTS(KZ*(NBOUND-1)+1:KZ*NBOUND,1)];
                    WEIGHT = [WEIGHT;OSTS(KZ*(NBOUND-1)+1:KZ*NBOUND,2)];
                    MODEL = [MODEL;MODSTS(KZ*(NBOUND-1)+1:KZ*NBOUND,1)];
                end;        
            end;
        end;
    end; 
    OFV = WRMSE(OBSERVED,MODEL,WEIGHT);
    disp(strcat('WSRMSE:', num2str(OFV)));    
end



