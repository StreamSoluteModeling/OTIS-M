%***********************************************************************
%
%     Subroutine LOADGUI             Called by: 
%
%     Load GUI Data from Input Files
%
%***********************************************************************
%
set(handles.TXT_TITLE,'String',TITLE);
set(handles.TXT_PSTEP,'String',PSTEP);
set(handles.TXT_TSTEP,'String',TSTEP);
set(handles.TXT_TSTART,'String',TSTART);
set(handles.TXT_TFINAL,'String',TFINAL);
set(handles.TXT_XSTART,'String',XSTART);
set(handles.TXT_DSBOUND,'String',DSBOUND);
set(handles.TXT_QSTART,'String',QSTART);
set(handles.TXT_QSTEP,'String',QSTEP);
set(handles.CMB_IBOUND,'Value',IBOUND);
set(handles.CHK_IGRAPH,'Value',IGRAPH);
set(handles.CHK_IMOVIE,'Value',IMOVIE);
set(handles.CHK_INEST,'Value',INEST);
set(handles.CHK_IPAR,'Value',IPAR);
set(handles.CHK_ISTEADY,'Value',ISTEADY);
set(handles.TXT_LU,'String',LU);
set(handles.LST_RPRTLOC,'String',RPRTLOC);

%% Load LST_SOLUTE
LSOLUTE=0;
set(handles.CMB_SOLUTE,'String',1:NSOLUTE+1);
set(handles.TXT_NAMESOL,'String',NAMESOL(1,:));
set(handles.TXT_CU,'String',CU(1,:));
for i = 1:NSOLUTE
    L1 = strcat(num2str(i,'%11.4g'),',');
    while size(L1,2)<11 
        L1 = strcat(L1,':');
    end;    
    L2 = strcat(num2str(NAMESOL(i,:),'%11.4g'),',');
    while size(L2,2)<10
        L2 = strcat(L2,':');
    end;
    L3 = num2str(CU(i,:),'%11.4g');
    while size(L3,2)<10
        L3 = strcat(L3,':');
    end;
    if LSOLUTE == 0 
        str = strcat(L1,L2,L3);
        str = strrep(str,':',' ');
        LSOLUTE = str;
    else
        str = strcat(L1,L2,L3);
        str = strrep(str,':',' ');
        LSOLUTE = strvcat(LSOLUTE,str);
    end;
end;
set(handles.LST_SOLUTE,'String',LSOLUTE);
%% Load LST_geometry
LGEOM=0;
set(handles.CMB_GREACH,'String',1:NREACH+1);
set(handles.TXT_NSEG,'String',NSEG(1));
set(handles.TXT_RCHLEN,'String',RCHLEN(1));
set(handles.TXT_DISP,'String',DISP(1));
set(handles.TXT_AREA2,'String',AREA2(1));
set(handles.TXT_ALPHA,'String',ALPHA(1));
set(handles.TXT_AREA3,'String',AREA3(1));
set(handles.TXT_ALPHA3,'String',ALPHA3(1));
for i = 1:NREACH
    L1 = strcat(num2str(i,'%11.4g'),',');
    while size(L1,2)<11 
        L1 = strcat(L1,':');
    end;    
    L2 = strcat(num2str(NSEG(i),'%11.4g'),',');
    while size(L2,2)<10
        L2 = strcat(L2,':');
    end;
    L3 = strcat(num2str(RCHLEN(i),'%11.4g'),',');
    while size(L3,2)<10
        L3 = strcat(L3,':');
    end;
    L4 = strcat(num2str(DISP(i),'%11.4g'),',');
    while size(L4,2)<10 
        L4 = strcat(L4,':');
    end;
    L5 = strcat(num2str(AREA2(i),'%11.4g'),',');
    while size(L5,2)<10 
        L5 = strcat(L5,':');
    end;
    L6 = strcat(num2str(ALPHA(i),'%11.4g'),',');
    while size(L6,2)<10
        L6 = strcat(L6,':');
    end;
    L7 = strcat(num2str(AREA3(i),'%11.4g'),',');
    while size(L7,2)<10
        L7 = strcat(L7,':');
    end;
    L8 = num2str(ALPHA3(i),'%11.4g');
    while size(L8,2)<10
        L8 = strcat(L8,':');
    end;
    if LGEOM == 0 
        str = strcat(L1,L2,L3,L4,L5,L6,L7,L8);
        str = strrep(str,':',' ');
        LGEOM = str;
    else
        str = strcat(L1,L2,L3,L4,L5,L6,L7,L8);
        str = strrep(str,':',' ');
        LGEOM = strvcat(LGEOM,str);
    end;
end;
set(handles.LST_geometry,'String',LGEOM);


%% Load LST_flow

LFLOW=0;
if ISTEADY == 1        
    set(handles.LST_FLOWLOC,'Visible','off');
    set(handles.TXT_FLOWLOC,'Visible','off');
    set(handles.LBL_FLOWLOC,'Visible','off');
    set(handles.CMD_FLOWLOCADD,'Visible','off');    
    set(handles.CMB_FLINE,'String',1:NREACH);
    set(handles.LBL_FLINE,'String','REACH');
    set(handles.CMB_FFLOWLOC,'Visible','off');
    set(handles.LBL_FFLOWLOC,'Visible','off');
    set(handles.LBL_Q,'Visible','off');    
    set(handles.TXT_Q,'Visible','off');
    for i = 1:NREACH
        L1 = strcat(num2str(i,'%11.4g'),',');
        while size(L1,2)<33 
            L1 = strcat(L1,':');
        end;    
        L2 = strcat(num2str(QLATIN(i),'%11.4g'),',');
        while size(L2,2)<10
            L2 = strcat(L2,':');
        end;
        L3 = strcat(num2str(QLATOUT(i),'%11.4g'),',');
        while size(L3,2)<10
            L3 = strcat(L3,':');
        end;
        L4 = strcat(num2str(AREA(i),'%11.4g'),',');
        while size(L4,2)<10 
            L4 = strcat(L4,':');
        end;
        for J = 1:NSOLUTE
            L5 = num2str(CLATIN(i,J),'%11.4g');
            if J ~= NSOLUTE
                L5 = strcat(L5,',');
            end;
            while size(L5,2)<10 
                L5 = strcat(L5,':');
            end;
            if J > 1
                L6 = strcat(L6,L5);
            else
                L6 = L5;
            end;
        end;
        if LFLOW == 0 
            str = strcat(L1,L2,L3,L4,L6);
            str = strrep(str,':',' ');
            L5 = strrep(L5,':',' ');
            set(handles.TXT_QLATIN,'String',num2str(QLATIN(1)));
            set(handles.TXT_QLATOUT,'String',num2str(QLATOUT(1)));
            set(handles.TXT_AREA,'String',num2str(AREA(1)));
            set(handles.TXT_CLATIN,'String',L5);  
            LFLOW = str;
        else
            str = strcat(L1,L2,L3,L4,L6);
            str = strrep(str,':',' ');
            LFLOW = strvcat(LFLOW,str);
        end;
    end;
else
    set(handles.LST_FLOWLOC,'Visible','on');
    set(handles.TXT_FLOWLOC,'Visible','on');
    set(handles.LBL_FLOWLOC,'Visible','on');
    set(handles.CMD_FLOWLOCADD,'Visible','on');    
    set(handles.LST_FLOWLOC,'String',FLOWLOC);
    set(handles.CMB_FLINE,'String',1:NFLOW*NQSTEP+1);
    set(handles.LBL_FLINE,'String','LINE');
    set(handles.LBL_FFLOWLOC,'Visible','on');
    set(handles.CMB_FFLOWLOC,'Visible','on');
    set(handles.CMB_FFLOWLOC,'String',FLOWLOC);
    set(handles.LBL_Q,'Visible','on');    
    set(handles.TXT_Q,'Visible','on');
    for I = 1:NFLOW
        for J = 1:NQSTEP
            L1 = strcat(num2str(I*J,'%11.4g'),',');
            while size(L1,2)<11 
                L1 = strcat(L1,':');
            end;
            L2 = strcat(num2str(FLOWLOC(I),'%11.4g'),',');
            while size(L2,2)<12 
                L2 = strcat(L2,':');
            end;
            L3 = strcat(num2str(Q(I,J),'%11.4g'),',');
            while size(L3,2)<10 
                L3 = strcat(L3,':');
            end;    
            L4 = strcat(num2str(QLATIN(I,J),'%11.4g'),',');
            while size(L4,2)<10
                L4 = strcat(L4,':');
            end;
            L5 = strcat(num2str(QLATOUT(I,J),'%11.4g'),',');
            while size(L5,2)<10
                L5 = strcat(L5,':');
            end;
            L6 = strcat(num2str(AREA(I,J),'%11.4g'),',');
            while size(L6,2)<10 
                L6 = strcat(L6,':');
            end;
            for K = 1:NSOLUTE
                L7 = num2str(CLATIN(I,J*K),'%11.4g');
                if K ~= NSOLUTE
                    L7 = strcat(L7,',');
                end;
                while size(L7,2)<10 
                    L7 = strcat(L7,':');
                end;
                if K > 1
                    L8 = strcat(L8,L7);
                else
                    L8 = L7;
                end;
            end;
            if LFLOW == 0 
                str = strcat(L1,L2,L3,L4,L5,L6,L8);
                str = strrep(str,':',' ');
                L7 = strrep(L7,':',' ');
                set(handles.TXT_Q,'String',num2str(Q(1)));
                set(handles.TXT_QLATIN,'String',num2str(QLATIN(1)));
                set(handles.TXT_QLATOUT,'String',num2str(QLATOUT(1)));
                set(handles.TXT_AREA,'String',num2str(AREA(1)));
                set(handles.TXT_CLATIN,'String',L7);                 
                LFLOW = str;
            else
                str = strcat(L1,L2,L3,L4,L5,L6,L8);
                str = strrep(str,':',' ');
                LFLOW = strvcat(LFLOW,str);
            end;
        end;
    end;
end;
set(handles.LST_flow,'String',LFLOW);

%% Load LST_chemistry

LCHEM=0;
set(handles.CMB_CSOLUTE,'String',1:NSOLUTE);   
set(handles.CMB_CREACH,'String',1:NREACH);   
for I = 1:NREACH
    for J = 1:NSOLUTE
        L1 = strcat(num2str(I,'%11.4g'),',');
        while size(L1,2)<11 
            L1 = strcat(L1,':');
        end;    
        L2 = strcat(num2str(J,'%11.4g'),',');
        while size(L2,2)<12 
            L2 = strcat(L2,':');
        end;    
        L3 = strcat(num2str(LAMBDA(I,J),'%11.4g'),',');
        while size(L3,2)<10
            L3 = strcat(L3,':');
        end;
        L4 = strcat(num2str(LAMBDA2(I,J),'%11.4g'),',');
        while size(L4,2)<10
            L4 = strcat(L4,':');
        end;
        L5 = strcat(num2str(LAMBDA3(I,J),'%11.4g'),',');
        while size(L5,2)<10 
            L5 = strcat(L5,':');
        end;
        L6 = strcat(num2str(LAMHAT(I,J),'%11.4g'),',');
        while size(L6,2)<10 
            L6 = strcat(L6,':');
        end;
        L7 = strcat(num2str(LAMHAT2(I,J),'%11.4g'),',');
        while size(L7,2)<10
            L7 = strcat(L7,':');
        end;
        L8 = strcat(num2str(LAMHAT3(I,J),'%11.4g'),',');
        while size(L8,2)<10
            L8 = strcat(L8,':');
        end;
        L9 = strcat(num2str(RHO(I,J),'%11.4g'),',');
        while size(L9,2)<10
            L9 = strcat(L9,':');
        end;
        L10 = strcat(num2str(KD(I,J),'%11.4g'),',');
        while size(L10,2)<10
            L10 = strcat(L10,':');
        end;
        L11 = strcat(num2str(CSBACK(I,J),'%11.4g'),',');
        while size(L11,2)<10
            L11 = strcat(L11,':');
        end;    
        L12 = num2str(CSBACK3(I,J),'%11.4g');
        while size(L12,2)<10
            L12 = strcat(L12,':');
        end;
        if LCHEM == 0 
            str = strcat(L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12);
            str = strrep(str,':',' ');
            set(handles.TXT_LAMBDA,'String',num2str(LAMBDA(1)));
            set(handles.TXT_LAMBDA2,'String',num2str(LAMBDA2(1)));
            set(handles.TXT_LAMBDA3,'String',num2str(LAMBDA3(1)));            
            set(handles.TXT_LAMHAT,'String',num2str(LAMHAT(1)));
            set(handles.TXT_LAMHAT2,'String',num2str(LAMHAT2(1)));
            set(handles.TXT_LAMHAT3,'String',num2str(LAMHAT3(1)));
            set(handles.TXT_RHO,'String',num2str(RHO(1)));
            set(handles.TXT_KD,'String',num2str(KD(1)));
            set(handles.TXT_CSBACK,'String',num2str(CSBACK(1)));
            set(handles.TXT_CSBACK3,'String',num2str(CSBACK3(1)));            
            LCHEM = str;
        else
            str = strcat(L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12);
            str = strrep(str,':',' ');
            LCHEM = strvcat(LCHEM,str);
        end;
    end;
end;
set(handles.LST_chemistry,'String',LCHEM);

%% Load LST_boundary

LBOUND=0;
set(handles.CMB_BLINE,'String',1:NBOUND+1);   
for I = 1:NBOUND
    L1 = strcat(num2str(I,'%11.4g'),',');
    while size(L1,2)<11 
        L1 = strcat(L1,':');
    end;
    L2 = strcat(num2str(USTIME(I),'%11.4g'),',');
    while size(L2,2)<10 
        L2 = strcat(L2,':');
    end;    
    for J = 1:NSOLUTE
        L3 = num2str(USCONC(I,J),'%11.4g');
        if J ~= NSOLUTE
            L3 = strcat(L3,',');
        end;
        while size(L3,2)<10 
            L3 = strcat(L3,':');
        end;
        if J > 1
            L4 = strcat(L4,L3);
        else
            L4 = L3;
        end;
    end;    
    if LBOUND == 0 
        str = strcat(L1,L2,L4);
        str = strrep(str,':',' ');
        L3 = strrep(L3,':',' ');
        set(handles.TXT_USTIME,'String',num2str(USTIME(1)));
        set(handles.TXT_USBC,'String',L3);
        LBOUND = str;
    else
        str = strcat(L1,L2,L4);
        str = strrep(str,':',' ');
        LBOUND = strvcat(LBOUND,str);
    end;
end;
set(handles.LST_boundary,'String',LBOUND);