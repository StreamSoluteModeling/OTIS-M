%***********************************************************************
%
%     Subroutine SAVEGUI             Called by: 
%
%     Save GUI Data to Input Files
%
%***********************************************************************
%
WF = cd;
CF=get(handles.TXT_CF,'String');
if size(CF,1)~= 0
    %Determine Values
    TITLE = get(handles.TXT_TITLE,'String');
    PSTEP = get(handles.TXT_PSTEP,'String');
    TSTEP = get(handles.TXT_TSTEP,'String');
    TSTART = get(handles.TXT_TSTART,'String');
    TFINAL = get(handles.TXT_TFINAL,'String');
    XSTART = get(handles.TXT_XSTART,'String');
    DSBOUND = get(handles.TXT_DSBOUND,'String');
    QSTART = get(handles.TXT_QSTART,'String');
    QSTEP = get(handles.TXT_QSTEP,'String');
    IBOUND = num2str(get(handles.CMB_IBOUND,'Value'));
    IGRAPH = num2str(get(handles.CHK_IGRAPH,'Value'));    
    IMOVIE = num2str(get(handles.CHK_IMOVIE,'Value'));        
    INEST = num2str(get(handles.CHK_INEST,'Value'));
    IPAR = num2str(get(handles.CHK_IPAR,'Value'));
    ISTEADY = num2str(get(handles.CHK_ISTEADY,'Value'));
    LU = get(handles.TXT_LU,'String');
%
    RPRTLOC = get(handles.LST_RPRTLOC,'String');
    FLOWLOC = get(handles.LST_FLOWLOC,'String');
    LGEOM = get(handles.LST_geometry,'String');
    LFLOW = get(handles.LST_flow,'String');
    LCHEM = get(handles.LST_chemistry,'String');
    LBOUND = get(handles.LST_boundary,'String');
    LSOLUTE = get(handles.LST_SOLUTE,'String');
%    
    NPRINT = size(RPRTLOC,1);
    NREACH = size(LGEOM,1);
%
    %Update LST_SOLUTE
    L1 = get(handles.CMB_SOLUTE,'Value');        
    K = L1;
    L1 = strcat(num2str(L1,'%11.4g'),',');
    L2 = strcat(get(handles.TXT_NAMESOL,'String'),',');
    L3 = get(handles.TXT_CU,'String');
    while size(L1,2)<11 
        L1 = strcat(L1,':');
    end;    
    while size(L2,2)<10
        L2 = strcat(L2,':');
    end;
    while size(L3,2)<10
        L3 = strcat(L3,':');
    end;
    str = strcat(L1,L2,L3);
    str = strrep(str,':',' ');
    if K == 1
        if size(LSOLUTE,1)<2
            LSOLUTE = str;
        else
            LSOLUTE = strvcat(str,LSOLUTE(2:size(LSOLUTE,1),:));
        end
    elseif K == size(LSOLUTE,1)    
        LSOLUTE = strvcat(LSOLUTE(1:K-1,:),str);
        set(handles.CMB_SOLUTE,'String',1:K+1);   
        set(handles.CMB_CSOLUTE,'String',1:K);
    else
        LSOLUTE = strvcat(LSOLUTE(1:K-1,:),str,LSOLUTE(K+1:size(LSOLUTE,1),:));
    end
    set(handles.LST_SOLUTE,'String',LSOLUTE);
    %
    NSOLUTE = size(LSOLUTE,1);
    %
    for K = 1:NSOLUTE
        I = findstr(LSOLUTE(K,:),',');
        if K == 1
            NAMESOL = strrep(LSOLUTE(K,I(1)+1:I(2)-1),' ','');
            CU = strrep(LSOLUTE(K,I(2)+1:size(LSOLUTE,2)),' ','');
        else            
            L1 = strrep(LSOLUTE(K,I(1)+1:I(2)-1),' ','');
            L2 = strrep(LSOLUTE(K,I(2)+1:size(LSOLUTE,2)),' ','');
            NAMESOL = strvcat(NAMESOL,L1);
            CU = strvcat(CU,L2);
        end;
    end;

    %Save PROJECT.txt
    cd (CF);
    project=fopen('PROJECT.txt','wt');
        fprintf(project, '%s\n', '## TITLE ######');
        fprintf(project, '%s\n', TITLE);
        fprintf(project, '%s\n', '## PSTEP ######');
        fprintf(project, '%s\n', PSTEP);
        fprintf(project, '%s\n', '## TSTEP ######');
        fprintf(project, '%s\n', TSTEP);
        fprintf(project, '%s\n', '## TSTART #####');
        fprintf(project, '%s\n', TSTART);
        fprintf(project, '%s\n', '## TFINAL #####');
        fprintf(project, '%s\n', TFINAL);
        fprintf(project, '%s\n', '## XSTART #####');
        fprintf(project, '%s\n', XSTART);
        fprintf(project, '%s\n', '## DSBOUND ####');
        fprintf(project, '%s\n', DSBOUND);
        fprintf(project, '%s\n', '## ISTEADY ####');
        fprintf(project, '%s\n', QSTEP);
        fprintf(project, '%s\n', '## QSTART #####');
        fprintf(project, '%s\n', QSTART);
        fprintf(project, '%s\n', '## IBOUND #####');
        fprintf(project, '%s\n', IBOUND);
        fprintf(project, '%s\n', '## IGRAPH #####');
        fprintf(project, '%s\n', IGRAPH);
        fprintf(project, '%s\n', '## IMOVIE #####');
        fprintf(project, '%s\n', IMOVIE);
        fprintf(project, '%s\n', '## INEST ######');
        fprintf(project, '%s\n', INEST);
        fprintf(project, '%s\n', '## IPAR #######');
        fprintf(project, '%s\n', IPAR);
        fprintf(project, '%s\n', '## ISTEADY ####');
        fprintf(project, '%s\n', ISTEADY);
        fprintf(project, '%s\n', '## LU #########');
        fprintf(project, '%s\n', LU);
        fprintf(project, '%s\n', '## NAMESOL ####');
        for I = 1:NSOLUTE
            fprintf(project, '%s\n', NAMESOL(I,:));
        end;
        fprintf(project, '%s\n', '## CU #########');
        for I = 1:NSOLUTE
            fprintf(project, '%s\n', CU(I,:));
        end;
    fclose(project);
    cd (WF);

    %Save GEOMETRY.txt
        L1 = get(handles.CMB_GREACH,'Value');
        K = L1;
        L1 = strcat(num2str(L1,'%11.4g'),',');
        L2 = strcat(get(handles.TXT_NSEG,'String'),',');
        L3 = strcat(get(handles.TXT_RCHLEN,'String'),',');
        L4 = strcat(get(handles.TXT_DISP,'String'),',');
        L5 = strcat(get(handles.TXT_AREA2,'String'),',');
        L6 = strcat(get(handles.TXT_ALPHA,'String'),',');
        L7 = strcat(get(handles.TXT_AREA3,'String'),',');
        L8 = get(handles.TXT_ALPHA3,'String');
        while size(L1,2)<11 
            L1 = strcat(L1,':');
        end;    
        while size(L2,2)<10
            L2 = strcat(L2,':');
        end;
        while size(L3,2)<10
            L3 = strcat(L3,':');
        end;
        while size(L4,2)<10 
            L4 = strcat(L4,':');
        end;
        while size(L5,2)<10 
            L5 = strcat(L5,':');
        end;
        while size(L6,2)<10
            L6 = strcat(L6,':');
        end;
        while size(L7,2)<10
            L7 = strcat(L7,':');
        end;
        while size(L8,2)<10
            L8 = strcat(L8,':');
        end;
        str = strcat(L1,L2,L3,L4,L5,L6,L7,L8);
        str = strrep(str,':',' ');
        if K == 1
            if size(LGEOM,1)<2
                LGEOM = str;
            else
                LGEOM = strvcat(str,LGEOM(2:size(LGEOM,1),:));
            end
        elseif K == size(LGEOM,1)    
            LGEOM = strvcat(LGEOM(1:K-1,:),str);
            set(handles.CMB_CREACH,'String',1:K);   
            set(handles.CMB_GREACH,'String',1:K+1);
        else
            LGEOM = strvcat(LGEOM(1:K-1,:),str,LGEOM(K+1:size(LGEOM,1),:));
        end
        cd (CF);
        geometry=fopen('GEOMETRY.txt','wt');
        for I = 1:size(LGEOM,1)
            fprintf(geometry,'%s\n',LGEOM(I,:));
        end;
        fclose(geometry);
        cd (WF);        
        set(handles.LST_geometry,'String',LGEOM);

    %Save Flow.txt

    if str2num(ISTEADY)==1
        L1 = get(handles.CMB_FLINE,'Value');
        K = L1;
        L1 = strcat(num2str(L1,'%11.4g'),',');
        L2 = strcat(get(handles.TXT_QLATIN,'String'),',');    
        L3 = strcat(get(handles.TXT_QLATOUT,'String'),',');
        L4 = strcat(get(handles.TXT_AREA,'String'),',');
        L5 = get(handles.TXT_CLATIN,'String');
        while size(L1,2)<33 
            L1 = strcat(L1,':');
        end;    
        while size(L2,2)<10
            L2 = strcat(L2,':');
        end;
        while size(L3,2)<10
            L3 = strcat(L3,':');
        end;
        while size(L4,2)<10 
            L4 = strcat(L4,':');
        end;
        I = findstr(L5,',');
        if size(I,1) == 0
            while size(L5,2)<10 
                L5 = strcat(L5,':');
            end;
            L7 = L5;
        else
            for J = 1:size(I)
                if J == 1;
                    L6 = L5(1:I(J));
                elseif J == size(I);
                    L6 = L5(I(J-1)+1:size(L5,2));
                else    
                    L6 = L5(I(J-1)+1:I(J));
                end    
                while size(L6,2)<10 
                    L6 = strcat(L6,':');
                end;
                if J > 1
                    L7 = strcat(L7,L6);
                else
                    L7 = L6;
                end;
            end;   
        end;
        str = strcat(L1,L2,L3,L4,L7);
        str = strrep(str,':',' ');
        if K == 1
            if size(LFLOW,1)<2
                LFLOW = str;
            else
                LFLOW = strvcat(str,LFLOW(2:size(LFLOW,1),:));
            end
        elseif K == size(LFLOW,1)    
            LFLOW = strvcat(LFLOW(1:K-1,:),str);
            set(handles.CMB_FLINE,'String',1:K);               
        else
            LFLOW = strvcat(LFLOW(1:K-1,:),str,LFLOW(K+1:size(LFLOW,1),:));
        end
    else    
        L1 = get(handles.CMB_FLINE,'Value');
        L2 = get(handles.CMB_FFLOWLOC,'Value');
        K = L1;
        L1 = strcat(num2str(L1,'%11.4g'),',');
        L2 = strcat(FLOWLOC(L2,:),',');
        L3 = strcat(get(handles.TXT_Q,'String'),',');
        L4 = strcat(get(handles.TXT_QLATIN,'String'),',');
        L5 = strcat(get(handles.TXT_QLATOUT,'String'),',');
        L6 = strcat(get(handles.TXT_AREA,'String'),',');    
        L7 = get(handles.TXT_CLATIN,'String');
        while size(L1,2)<11 
            L1 = strcat(L1,':');
        end;    
        while size(L2,2)<12
            L2 = strcat(L2,':');
        end;
        while size(L3,2)<10
            L3 = strcat(L3,':');
        end;
        while size(L4,2)<10 
            L4 = strcat(L4,':');
        end;
        while size(L5,2)<10 
            L5 = strcat(L5,':');
        end;
        while size(L6,2)<10 
            L6 = strcat(L6,':');
        end; 
        I = findstr(L7,',');
        if size(I,1) == 0
            while size(L7,2)<10 
                L7 = strcat(L7,':');
            end;
            L9 = L7;
        else
            for J = 1:size(I)
                if J == 1;
                    L8 = L7(1:I(J));
                elseif J == size(I);
                    L8 = L7(I(J-1)+1:size(L7,2));
                else    
                    L8 = L7(I(J-1)+1:I(J));
                end    
                while size(L8,2)<10 
                    L8 = strcat(L8,':');
                end;
                if J > 1
                    L9 = strcat(L9,L8);
                else
                    L9 = L8;
                end;
            end;   
        end;
        str = strcat(L1,L2,L3,L4,L5,L6,L9);
        str = strrep(str,':',' ');
        if K == 1
            if size(LFLOW,1)<2
                LFLOW = str;
            else
                LFLOW = strvcat(str,LFLOW(2:size(LFLOW,1),:));
            end
        elseif K == size(LFLOW,1)    
            LFLOW = strvcat(LFLOW(1:K-1,:),str);
            set(handles.CMB_FLINE,'String',1:K+1);            
        else
            LFLOW = strvcat(LFLOW(1:K-1,:),str,LFLOW(K+1:size(LFLOW,1),:));
        end
    end;    
        cd (CF);
        flow=fopen('FLOW.txt','wt');
            for I = 1:size(LFLOW,1)
                fprintf(flow,'%s\n',LFLOW(I,:));
            end;
        fclose(flow);
        cd (WF);    
        set(handles.LST_flow,'String',LFLOW);


    %Save Chemistry.txt
        L1 = get(handles.CMB_CREACH,'Value');    
        L2 = get(handles.CMB_CSOLUTE,'Value');
        K = L1*L2;
        L1 = strcat(num2str(L1,'%11.4g'),',');
        L2 = strcat(num2str(L2,'%11.4g'),',');
        L3 = strcat(get(handles.TXT_LAMBDA,'String'),',');
        L4 = strcat(get(handles.TXT_LAMBDA2,'String'),',');
        L5 = strcat(get(handles.TXT_LAMBDA3,'String'),',');
        L6 = strcat(get(handles.TXT_LAMHAT,'String'),',');
        L7 = strcat(get(handles.TXT_LAMHAT2,'String'),',');
        L8 = strcat(get(handles.TXT_LAMHAT3,'String'),',');
        L9 = strcat(get(handles.TXT_RHO,'String'),',');
        L10 = strcat(get(handles.TXT_KD,'String'),',');
        L11 = strcat(get(handles.TXT_CSBACK,'String'),',');
        L12 = get(handles.TXT_CSBACK3,'String');
        while size(L1,2)<11 
            L1 = strcat(L1,':');
        end;    
        while size(L2,2)<12 
            L2 = strcat(L2,':');
        end;    
        while size(L3,2)<10
            L3 = strcat(L3,':');
        end;
        while size(L4,2)<10
            L4 = strcat(L4,':');
        end;
        while size(L5,2)<10 
            L5 = strcat(L5,':');
        end;
        while size(L6,2)<10 
            L6 = strcat(L6,':');
        end;
        while size(L7,2)<10
            L7 = strcat(L7,':');
        end;
        while size(L8,2)<10
            L8 = strcat(L8,':');
        end;
        while size(L9,2)<10
            L9 = strcat(L9,':');
        end;
        while size(L10,2)<10
            L10 = strcat(L10,':');
        end;
        while size(L11,2)<10
            L11 = strcat(L11,':');
        end;    
        while size(L12,2)<10
            L12 = strcat(L12,':');
        end;
        str = strcat(L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12);
        str = strrep(str,':',' ');
        if K == 1
            if size(LCHEM,1)<2
                LCHEM = str;
            else
                LCHEM = strvcat(str,LCHEM(2:size(LCHEM,1),:));
            end
        elseif K == size(LCHEM,1)    
            LCHEM = strvcat(LCHEM(1:K-1,:),str);
        else
            LCHEM = strvcat(LCHEM(1:K-1,:),str,LCHEM(K+1:size(LCHEM,1),:));
        end
        cd (CF);
        chemistry=fopen('CHEMISTRY.txt','wt');
            for I = 1:size(LCHEM)
                fprintf(chemistry,'%s\n',LCHEM(I,:));
            end;
        fclose(chemistry);
        cd (WF);
        set(handles.LST_chemistry,'String',LCHEM);
       
    %Save Boundary.txt
        L1 = get(handles.CMB_BLINE,'Value');    
        K = L1;
        L1 = strcat(num2str(L1,'%11.4g'),',');
        L2 = strcat(get(handles.TXT_USTIME,'String'),',');
        L3 = get(handles.TXT_USBC,'String');
        while size(L1,2)<11 
            L1 = strcat(L1,':');
        end;
        while size(L2,2)<10 
            L2 = strcat(L2,':');
        end;
        I = findstr(L3,',');
        if size(I,1) == 0
            while size(L3,2)<10 
                L3 = strcat(L3,':');
            end;
            L5 = L3;
        else        
            for J = 1:size(I)
                if J == 1;
                    L4 = L3(1:I(J));
                elseif J == size(I);
                    L4 = L3(I(J-1)+1:size(L3,2));
                else    
                    L4 = L3(I(J-1)+1:I(J));
                end  
                while size(L4,2)<10 
                    L4 = strcat(L4,':');
                end;
                if J > 1
                    L5 = strcat(L5,L4);
                else
                    L5 = L4;
                end;
            end;    
        end;
        str = strcat(L1,L2,L5);
        str = strrep(str,':',' ');
        if K == 1
            if size(LBOUND,1)<2
                LBOUND = str;
            else
                LBOUND = strvcat(str,LBOUND(2:size(LBOUND,1),:));
            end
        elseif K == size(LBOUND,1)    
            LBOUND = strvcat(LBOUND(1:K-1,:),str);
            set(handles.CMB_BLINE,'String',1:K+1);                        
        else
            LBOUND = strvcat(LBOUND(1:K-1,:),str,LBOUND(K+1:size(LBOUND,1),:));
        end    
        cd (CF);
        boundary=fopen('BOUNDARY.txt','wt');
            for I = 1:size(LBOUND)
                fprintf(boundary,'%s\n',LBOUND(I,:));
            end;
        fclose(boundary);
        cd (WF);
        set(handles.LST_boundary,'String',LBOUND);        

    %Save PRINT.txt
        cd (CF);
        print=fopen('PRINT.txt','wt');
            for I = 1:size(RPRTLOC,1)
                fprintf(print, '%s\n', RPRTLOC(I,:));   
            end;
        fclose(print);
        cd (WF);
end;