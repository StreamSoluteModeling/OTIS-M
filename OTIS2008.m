%***********************************************************************
%
%     OTIS2008GUI                 Called by: 
%
%     ...
%
%***********************************************************************
%
function varargout = OTIS2008(varargin)
% OTIS2008 M-file for OTIS2008.fig
%      OTIS2008, by itself, creates a new OTIS2008 or raises the existing
%      singleton*.
%
%      H = OTIS2008 returns the handle to a new OTIS2008 or the handle to
%      the existing singleton*.
%
%      OTIS2008('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OTIS2008.M with the given input arguments.
%
%      OTIS2008('Property','Value',...) creates a new OTIS2008 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before OTIS2008_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to OTIS2008_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help OTIS2008

% Last Modified by GUIDE v2.5 25-Feb-2009 10:06:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @OTIS2008_OpeningFcn, ...
                   'gui_OutputFcn',  @OTIS2008_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before OTIS2008 is made visible.
function OTIS2008_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to OTIS2008 (see VARARGIN)

% Choose default command line output for OTIS2008
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes OTIS2008 wait for user response (see UIRESUME)
% uiwait(handles.OTIS2008);


% --- Outputs from this function are returned to the command line.
function varargout = OTIS2008_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%%  List Boxes - CreateFcn
% --- Executes during object creation, after setting all properties.
% hObject    handle to LST_SOLUTE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

function LST_CU_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function LST_SOLUTE_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function LST_RPRTLOC_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function LST_FLOWLOC_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
function LST_chemistry_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function LST_flow_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function LST_geometry_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function LST_boundary_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end    


%%  Combo Boxes - CreateFcn
% --- Executes during object creation, after setting all properties.
% hObject    handle to CMB_? (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

function CMB_SOLUTE_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end    
    
function CMB_FLOWLOC_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function CMB_IBOUND_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function CMB_solutes_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function CMB_NREACH_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function CMB_CREACH_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function CMB_CSOLUTE_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function CMB_FFLOWLOC_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function CMB_BLINE_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function CMB_GREACH_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function CMB_FLINE_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
%%  EDIT BOXES CreateFcn
% --- Executes during object creation, after setting all properties.
% hObject    handle to TXT_LAMHAT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

function TXT_AREA3_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_LU_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end    
    
function TXT_PSTEP_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_TSTART_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_TSTEP_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_DSBOUND_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_USSZ2_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_CSBACK3_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_CSBACK_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_QSTEP_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_QSTART_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_NAMESOL_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_USSZ1_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_ALPHA3_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
function TXT_USTIME_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_CU_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end    
    
function TXT_USBC_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_XSTART_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_TITLE_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_NSEG_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_RPRTLOC_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_TFINAL_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_FLOWLOC_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_CF_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_LAMHAT_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_LAMHAT2_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_LAMHAT3_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_KD_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_RHO_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_LAMBDA3_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_LAMBDA_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_LAMBDA2_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_Q_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_QLATIN_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_RCHLEN_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_CLATIN_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_AREA_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_QLATOUT_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_DISP_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_ALPHA_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function TXT_AREA2_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
%%  Edit Text Boxes - Callback
% hObject    handle to Tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hObject as text
%        str2double(get(hObject,'String')) returns contents of hObject
%        as a double

%General

function TXT_CF_Callback(hObject, eventdata, handles)
%Do Nothing
function TXT_TITLE_Callback(hObject, eventdata, handles)
    SAVEGUI
function TXT_PSTEP_Callback(hObject, eventdata, handles)
    SAVEGUI
function TXT_TSTEP_Callback(hObject, eventdata, handles)
    SAVEGUI
function TXT_TSTART_Callback(hObject, eventdata, handles)
    SAVEGUI
function TXT_TFINAL_Callback(hObject, eventdata, handles)
    SAVEGUI
function TXT_XSTART_Callback(hObject, eventdata, handles)
    SAVEGUI
function TXT_DSBOUND_Callback(hObject, eventdata, handles)
    SAVEGUI
function TXT_QSTART_Callback(hObject, eventdata, handles)
    SAVEGUI
function TXT_QSTEP_Callback(hObject, eventdata, handles)
    SAVEGUI
function TXT_NAMESOL_Callback(hObject, eventdata, handles)
	SAVEGUI
function TXT_RPRTLOC_Callback(hObject, eventdata, handles)
%Do Nothing
function TXT_FLOWLOC_Callback(hObject, eventdata, handles)
%Do Nothing
function TXT_CU_Callback(hObject, eventdata, handles)
    SAVEGUI
function TXT_LU_Callback(hObject, eventdata, handles)
    SAVEGUI

%Chemistry

function TXT_LAMBDA_Callback(hObject, eventdata, handles)
    SAVEGUI
function TXT_LAMBDA2_Callback(hObject, eventdata, handles)
    SAVEGUI
function TXT_LAMBDA3_Callback(hObject, eventdata, handles)
    SAVEGUI
function TXT_LAMHAT_Callback(hObject, eventdata, handles)
    SAVEGUI
function TXT_LAMHAT2_Callback(hObject, eventdata, handles)
    SAVEGUI
function TXT_LAMHAT3_Callback(hObject, eventdata, handles)
    SAVEGUI
function TXT_KD_Callback(hObject, eventdata, handles)
    SAVEGUI
function TXT_RHO_Callback(hObject, eventdata, handles)
    SAVEGUI
function TXT_CSBACK_Callback(hObject, eventdata, handles)
    SAVEGUI
function TXT_CSBACK3_Callback(hObject, eventdata, handles)
    SAVEGUI
    
%Geometry

function TXT_NSEG_Callback(hObject, eventdata, handles)
    SAVEGUI
function TXT_RCHLEN_Callback(hObject, eventdata, handles)
    SAVEGUI
function TXT_DISP_Callback(hObject, eventdata, handles)
    SAVEGUI
function TXT_AREA2_Callback(hObject, eventdata, handles)
    SAVEGUI
function TXT_ALPHA_Callback(hObject, eventdata, handles)
    SAVEGUI
function TXT_AREA3_Callback(hObject, eventdata, handles)
    SAVEGUI
function TXT_ALPHA3_Callback(hObject, eventdata, handles)
    SAVEGUI

%Boundary

function TXT_USTIME_Callback(hObject, eventdata, handles)
    SAVEGUI
function TXT_USBC_Callback(hObject, eventdata, handles)
    SAVEGUI

%Flow

function TXT_Q_Callback(hObject, eventdata, handles)
    SAVEGUI
function TXT_QLATIN_Callback(hObject, eventdata, handles)
    SAVEGUI
function TXT_QLATOUT_Callback(hObject, eventdata, handles)
    SAVEGUI
function TXT_AREA_Callback(hObject, eventdata, handles)
    SAVEGUI
function TXT_CLATIN_Callback(hObject, eventdata, handles)
    SAVEGUI

%%	Command Buttons - Callback
% hObject    handle to Tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function CMD_boundaryHELP_Callback(hObject, eventdata, handles)
    BCHELP = strvcat('Upstream Boundary Condition Parameters','TIME', 'MC','SZ1','SZ2');
    helpdlg(BCHELP,'HELP')

function CMD_chemistryHELP_Callback(hObject, eventdata, handles)
    CHEMHELP = strvcat('Chemistry Parameters','LAMBDA','LAMBDA2','LAMBDA3','LAMHAT','LAMHAT2','LAMHAT3','RHO','KD','CSBACK','CSBACK3');
    helpdlg(CHEMHELP,'HELP')

function CMD_DIR_Callback(hObject, eventdata, handles)
    WF = cd;
    CF = uigetdir('C:\');
    set(handles.TXT_CF,'String',CF);
    %Perform QC Input
    INPUT
    if ERRORS == 0
        LOADGUI
    else
        msgbox(ERRMSG)
    end

function CMD_ECHO_Callback(hObject, eventdata, handles)

function CMD_FLOWLOCADD_Callback(hObject, eventdata, handles)
    LFLOWLOC = get(handles.LST_FLOWLOC,'String');
    I = size(LFLOWLOC,1);    
    str = get(handles.TXT_FLOWLOC,'String');
    if size(str2num(str),1)==0
         helpdlg('Flow Location must be a number','Error')
    else
        LFLOWLOC = strvcat(LFLOWLOC,str);
        LFLOWLOC = str2num(LFLOWLOC);
        LFLOWLOC = sort(LFLOWLOC);
        LFLOWLOC = num2str(LFLOWLOC,'%11.4g');
        set(handles.LST_FLOWLOC,'String',LFLOWLOC)
        set(handles.LST_FFLOWLOC,'String',LFLOWLOC)
    end;
    set(handles.LST_FLOWLOC,'Value',1)

    
function CMD_flowHELP_Callback(hObject, eventdata, handles)
    FLOWHELP = strvcat('Flow Parameters','FLOWLOC','Q','QLATIN','QLATOUT','AREA','CLATIN');
    helpdlg(FLOWHELP,'HELP')

function CMD_generalHELP_Callback(hObject, eventdata, handles)
    GENHELP = strvcat('General Parameters','TITLE','PSTEP','TSTEP','TSTART','TFINAL','XSTART','DSBOUND','QSTART','QSTEP','IBOUND','NAMESOL','PRTLOC');
    helpdlg(GENHELP,'HELP')

function CMD_geometryHELP_Callback(hObject, eventdata, handles)
    GEOMHELP = strvcat('Geometry Parameters','NSEG','RCHLEN','DISP','AREA2','ALPHA','AREA3','ALPHA3');
    helpdlg(GEOMHELP,'HELP')

function CMD_GRAPH_Callback(hObject, eventdata, handles)

function CMD_graphHELP_Callback(hObject, eventdata, handles)

function CMD_MOVIE_Callback(hObject, eventdata, handles)

function CMD_RPRTLOCADD_Callback(hObject, eventdata, handles)
    LRPRTLOC = get(handles.LST_RPRTLOC,'String');
    I = size(LRPRTLOC,1);    
    str = get(handles.TXT_RPRTLOC,'String');
    if size(str2num(str),1)==0
         helpdlg('Requested Print Location must be a number','Error')
    else
        LRPRTLOC = strvcat(LRPRTLOC,str);
        LRPRTLOC = str2num(LRPRTLOC);
        LRPRTLOC = sort(LRPRTLOC);
        LRPRTLOC = num2str(LRPRTLOC,'%11.4g');
        set(handles.LST_RPRTLOC,'String',LRPRTLOC)
    end;
    set(handles.LST_RPRTLOC,'Value',1)
    
function CMD_QC_Callback(hObject, eventdata, handles)

  
function CMD_RUN_Callback(hObject, eventdata, handles)

%%	Combo Boxes - Callback
% --- Executes on selection change in CMB_?.
% hObject    handle to CMB_? (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns CMB_? contents as cell array
%        contents{get(hObject,'Value')} returns selected item from CMB_?

function CMB_BLINE_Callback(hObject, eventdata, handles)
    K = get(hObject,'Value');
    str = get(handles.LST_boundary,'String');
    J = str(K,:);
    I = findstr(J,',');
    USTIME = strrep(J(I(1)+1:I(2)-1),' ','');
    USBC = strrep(J(I(2)+1:size(str,2)),' ','');
    set(handles.TXT_USTIME,'String',USTIME)
    set(handles.TXT_USBC,'String',USBC)

function CMB_CREACH_Callback(hObject, eventdata, handles)
    REACH = get(hObject,'Value');
    SOLUTE = get(handles.CMB_CSOLUTE,'Value');
    NSOLUTE = size(get(handles.CMB_CSOLUTE,'String'),1);
    K = (REACH-1)*NSOLUTE + SOLUTE;  
    str = get(handles.LST_chemistry,'String');
    J = str(K,:);
    I = findstr(J,',');
    LAMBDA = strrep(J(I(2)+1:I(3)-1),' ','');        
    LAMBDA2 = strrep(J(I(3)+1:I(4)-1),' ','');
    LAMBDA3 = strrep(J(I(4)+1:I(5)-1),' ','');
    LAMHAT = strrep(J(I(5)+1:I(6)-1),' ','');
    LAMHAT2 = strrep(J(I(6)+1:I(7)-1),' ','');
    LAMHAT3 = strrep(J(I(7)+1:I(8)-1),' ','');
    RHO = strrep(J(I(8)+1:I(9)-1),' ','');    
    KD = strrep(J(I(9)+1:I(10)-1),' ','');
    CSBACK = strrep(J(I(10)+1:I(11)-1),' ','');
    CSBACK3 = strrep(J(I(11)+1:size(str,2)),' ','');
    set(handles.TXT_LAMBDA,'String',LAMBDA)          
    set(handles.TXT_LAMBDA2,'String',LAMBDA2)
    set(handles.TXT_LAMBDA3,'String',LAMBDA3)
    set(handles.TXT_LAMHAT,'String',LAMHAT)
    set(handles.TXT_LAMHAT2,'String',LAMHAT2)
    set(handles.TXT_LAMHAT3,'String',LAMHAT3)
    set(handles.TXT_RHO,'String',RHO)          
    set(handles.TXT_KD,'String',KD)
    set(handles.TXT_CSBACK,'String',CSBACK)
    set(handles.TXT_CSBACK3,'String',CSBACK3)

function CMB_CSOLUTE_Callback(hObject, eventdata, handles)
    REACH = get(handles.CMB_CREACH,'Value');
    SOLUTE = get(hObject,'Value');
    NSOLUTE = size(get(handles.CMB_CSOLUTE,'String'),1);    
    K = (REACH-1)*NSOLUTE + SOLUTE;  
    str = get(handles.LST_chemistry,'String');
    J = str(K,:);
    I = findstr(J,',');
    LAMBDA = strrep(J(I(2)+1:I(3)-1),' ','');        
    LAMBDA2 = strrep(J(I(3)+1:I(4)-1),' ','');
    LAMBDA3 = strrep(J(I(4)+1:I(5)-1),' ','');
    LAMHAT = strrep(J(I(5)+1:I(6)-1),' ','');
    LAMHAT2 = strrep(J(I(6)+1:I(7)-1),' ','');
    LAMHAT3 = strrep(J(I(7)+1:I(8)-1),' ','');
    RHO = strrep(J(I(8)+1:I(9)-1),' ','');    
    KD = strrep(J(I(9)+1:I(10)-1),' ','');
    CSBACK = strrep(J(I(10)+1:I(11)-1),' ','');
    CSBACK3 = strrep(J(I(11)+1:size(str,2)),' ','');
    set(handles.TXT_LAMBDA,'String',LAMBDA)          
    set(handles.TXT_LAMBDA2,'String',LAMBDA2)
    set(handles.TXT_LAMBDA3,'String',LAMBDA3)
    set(handles.TXT_LAMHAT,'String',LAMHAT)
    set(handles.TXT_LAMHAT2,'String',LAMHAT2)
    set(handles.TXT_LAMHAT3,'String',LAMHAT3)
    set(handles.TXT_RHO,'String',RHO)          
    set(handles.TXT_KD,'String',KD)
    set(handles.TXT_CSBACK,'String',CSBACK)
    set(handles.TXT_CSBACK3,'String',CSBACK3)

function CMB_FFLOWLOC_Callback(hObject, eventdata, handles)
    SAVEGUI

function CMB_FLINE_Callback(hObject, eventdata, handles)
    ISTEADY = get(handles.CHK_ISTEADY,'Value');
    K = get(hObject,'Value');
    str = get(handles.LST_flow,'String');
    J = str(K,:);
    I = findstr(J,',');
    if ISTEADY == 1
        QLATIN = strrep(J(I(1)+1:I(2)-1),' ','');
        QLATOUT = strrep(J(I(2)+1:I(3)-1),' ','');
        AREA = strrep(J(I(3)+1:I(4)-1),' ','');
        CLATIN = strrep(J(I(4)+1:size(str,2)),' ','');
        set(handles.TXT_QLATIN,'String',QLATIN)
        set(handles.TXT_QLATOUT,'String',QLATOUT)
        set(handles.TXT_AREA,'String',AREA)
        set(handles.TXT_CLATIN,'String',CLATIN)
    else
        FLOWLOC = strrep(J(I(1)+1:I(2)-1),' ','');
        Q = strrep(J(I(2)+1:I(3)-1),' ','');        
        QLATIN = strrep(J(I(3)+1:I(4)-1),' ','');
        QLATOUT = strrep(J(I(4)+1:I(5)-1),' ','');
        AREA = strrep(J(I(5)+1:I(6)-1),' ','');
        CLATIN = strrep(J(I(6)+1:size(str,2)),' ','');
        I = get(handles.LST_FLOWLOC,'String');
        for J = 1:size(I,1)
            if strcmp(I(J,:),FLOWLOC)==1
                K = J;
            end
        end
        set(handles.CMB_FLOWLOC,'Value',K)
        set(handles.TXT_Q,'String',Q)          
        set(handles.TXT_QLATIN,'String',QLATIN)
        set(handles.TXT_QLATOUT,'String',QLATOUT)
        set(handles.TXT_AREA,'String',AREA)
        set(handles.TXT_CLATIN,'String',CLATIN)
    end;

    
function CMB_GREACH_Callback(hObject, eventdata, handles)
    K = get(hObject,'Value');
    LGEOM = get(handles.LST_geometry,'String');
    ISTEADY = get(handles.CHK_ISTEADY,'Value');
    if K == size(get(hObject,'String'),1)
        set(handles.TXT_NSEG,'String','0')
        set(handles.TXT_RCHLEN,'String','0')
        set(handles.TXT_DISP,'String','0')
        set(handles.TXT_AREA2,'String','0')
        set(handles.TXT_ALPHA,'String','0')
        set(handles.TXT_AREA3,'String','0')
        set(handles.TXT_ALPHA3,'String','0')        
        set(handles.CMB_GREACH,'String',1:K+1)
        set(handles.CMB_CREACH,'String',1:K)
        if ISTEADY ==1
            set(handles.CMB_FLINE,'String',1:K)
            set(handles.CMB_FLINE,'Value',K)
            set(handles.TXT_QLATIN,'String','0')
            set(handles.TXT_QLATOUT,'String','0')
            set(handles.TXT_AREA,'String','0')
            set(handles.TXT_CLATIN,'String','0')            
        end
        NSOLUTE = size(get(handles.CMB_CSOLUTE,'String'),1);
        for I = 1:NSOLUTE
            set(handles.CMB_CREACH,'Value',K)
            set(handles.CMB_CSOLUTE,'Value',I)
            set(handles.TXT_LAMBDA,'String','0')
            set(handles.TXT_LAMBDA2,'String','0')
            set(handles.TXT_LAMBDA3,'String','0')
            set(handles.TXT_LAMHAT,'String','0')                        
            set(handles.TXT_LAMHAT2,'String','0')
            set(handles.TXT_LAMHAT3,'String','0')
            set(handles.TXT_RHO,'String','0')
            set(handles.TXT_KD,'String','0')                        
            set(handles.TXT_CSBACK,'String','0')
            set(handles.TXT_CSBACK3,'String','0')                        
            SAVEGUI
        end
        set(handles.LST_geometry,'Value',1);                        
        SAVEGUI        
    else
        J = LGEOM(K,:);
        I = findstr(J,',');
        NSEG = strrep(J(I(1)+1:I(2)-1),' ','');
        RCHLEN = strrep(J(I(2)+1:I(3)-1),' ','');
        DISP = strrep(J(I(3)+1:I(4)-1),' ','');
        AREA2 = strrep(J(I(4)+1:I(5)-1),' ','');
        ALPHA = strrep(J(I(5)+1:I(6)-1),' ','');
        AREA3 = strrep(J(I(6)+1:I(7)-1),' ','');
        ALPHA3 = strrep(J(I(7)+1:size(LGEOM,2)),' ','');
        set(handles.TXT_NSEG,'String',NSEG)
        set(handles.TXT_RCHLEN,'String',RCHLEN)
        set(handles.TXT_DISP,'String',DISP)
        set(handles.TXT_AREA2,'String',AREA2)
        set(handles.TXT_ALPHA,'String',ALPHA)
        set(handles.TXT_AREA3,'String',AREA3)
        set(handles.TXT_ALPHA3,'String',ALPHA3)
    end

function CMB_IBOUND_Callback(hObject, eventdata, handles)
    SAVEGUI

function CMB_SOLUTE_Callback(hObject, eventdata, handles)
    K = get(hObject,'Value');
    LSOLUTE = get(handles.LST_SOLUTE,'String');
    if K == size(get(hObject,'String'),1)
        set(handles.TXT_NAMESOL,'String','0')
        set(handles.TXT_CU,'String','0')
        set(handles.CMB_CSOLUTE,'String',1:K)
        set(handles.CMB_SOLUTE,'String',1:K+1)        
        NREACH = size(get(handles.CMB_CREACH,'String'),1);
        LCHEM = get(handles.LST_chemistry,'String');
        if NREACH ~= 0
            for J = 1:NREACH
                L1 = strcat(num2str(J),',');
                while size(L1,2)<11 
                    L1 = strcat(L1,':');
                end; 
                L2 = strcat(num2str(K),',');
                while size(L2,2)<12 
                    L2 = strcat(L2,':');
                end;
                L3 = strcat(L1,L2,'0,::::::::0,::::::::0,::::::::0,::::::::0,::::::::0,::::::::0,::::::::0,::::::::0,::::::::0,:');
                L3 = strrep(L3,':',' ');
                LCHEM= strvcat(LCHEM,L3);
                LCHEM = sortrows(LCHEM);
                set(handles.LST_chemistry,'String',LCHEM);
            end
        end
        set(handles.LST_SOLUTE,'Value',1);                        
        SAVEGUI
    else
        J = LSOLUTE(K,:);
        I = findstr(J,',');
        NAMESOL = strrep(J(I(1)+1:I(2)-1),' ','');
        CU = strrep(J(I(2)+1:size(LSOLUTE,2)),' ','');
        set(handles.TXT_NAMESOL,'String',NAMESOL)
        set(handles.TXT_CU,'String',CU)
    end

%%	List Boxes - Callback
% --- Executes on selection change in LST_RPRTLOC.
% hObject    handle to LST_RPRTLOC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns LST_RPRTLOC contents as cell array
%        contents{get(hObject,'Value')} returns selected item from
%        LST_RPRTLOC

function LST_boundary_Callback(hObject, eventdata, handles)
    if strcmp(get(handles.OTIS2008,'SelectionType'),'open') == 1
        K = get(hObject,'Value');
        LBOUND = get(hObject,'String');
        I = size(LBOUND,1);
        S = strvcat('Delete','Insert', 'Copy Up', 'Copy Down','Move Up','Move Down');
        [button,v] = listdlg('ListString',S,'SelectionMode','single','ListSize',[150 100],'Name','Please Select Option');
        if v == 1
            if strcmp(button,'Delete')==1
                if I == 1
                    LBOUND = '';
                elseif K == 1
                    LBOUND = LBOUND(2:I,:);
                elseif K == I    
                    LBOUND = LBOUND(1:I-1,:);
                else
                    LBOUND = strvcat(LBOUND(1:K-1,:),LBOUND(K+1:I,:));
                end
                I = I - 1;
                set(handles.CMB_BLINE,'String',1:I+1);
            elseif strcmp(button,'Copy Up')==1
                if K == 1
                    helpdlg('Cannot Copy Up','Error')
                else
                    L1 = LBOUND(K,:);
                    LBOUND(K-1,:) = L1;
                end
            elseif strcmp(button,'Copy Down')==1
                if K == I
                    helpdlg('Cannot Copy Down','Error')
                else
                    L1 = LBOUND(K,:);
                    LBOUND(K+1,:) = L1;
                end
            elseif strcmp(button,'Insert')==1
                L1 = LBOUND(K,:);
                if K == 1
                    LBOUND = strvcat(L1,LBOUND);
                elseif K == I
                    LBOUND = strvcat(LBOUND,L1);
                else
                    LBOUND = strvcat(LBOUND(1:K,:),L1,LBOUND(K+1:I,:));                    
                end
                set(handles.CMB_BLINE,'String',1:I+1);
            elseif strcmp(button,'Move Up')==1
                if K == 1
                    helpdlg('Cannot Move Up','Error')
                else
                    L1 = LBOUND(K,:);
                    L2 = LBOUND(K-1,:);
                    LBOUND(K,:) = L2;
                    LBOUND(K-1,:) = L1;
                end            
            elseif strcmp(button,'Move Down')==1
                if K == I
                    helpdlg('Copied Down','!! Warning !!')
                    LBOUND = strvcat(LBOUND,LBOUND(I,:));
                    I = I + 1;
                    set(handles.CMB_BLINE,'String',1:I+1);
                else
                    L1 = LBOUND(K,:);
                    L2 = LBOUND(K+1,:);
                    LBOUND(K,:) = L2;
                    LBOUND(K+1,:) = L1;
                end            
            end
            for J = 1:I
                str = strcat(num2str(J,'%11.4g'),',');
                while size(str,2)<11
                    str = strcat(str,':');
                end;
                str = strrep(str,':',' ');    
                LBOUND(J,1:11)=str;
            end;    
            set(hObject,'String',LBOUND)
        end;
    end

function LST_chemistry_Callback(hObject, eventdata, handles)
    if strcmp(get(handles.OTIS2008,'SelectionType'),'open') == 1
        K = get(hObject,'Value');
        L1 = get(hObject,'String');
        I = size(L1,1);
        J = findstr(L1(K,:),',');
        NREACH = size(get(handles.CMB_CREACH,'String'),1);
        REACH = str2num(L1(K,1:J(1)-1));
        SOLUTE = strrep(L1(K,J(1)+1:J(2)-1),' ','');
        NSOLUTE = size(get(handles.CMB_CSOLUTE,'String'),1);
          button = questdlg('Please Select Option','Adjust Chemistry Data','Copy Up','Copy Down','Copy Up');
        if strcmp(button,'Copy Up')==1
            if K < NSOLUTE+1
                helpdlg('Cannot Copy Up','Error')
            else
                str = L1(K-NSOLUTE,1:11);
                L1(K-NSOLUTE,:) = L1(K,:);
                L1(K-NSOLUTE,1:11) = str;
            end
        elseif strcmp(button,'Copy Down')==1
            if K > (NREACH-1)*NSOLUTE
                helpdlg('Cannot Copy Down','Error')
            else
                str = L1(K+NSOLUTE,1:11);
                L1(K+NSOLUTE,:) = L1(K,:);
                L1(K+NSOLUTE,1:11) = str; 
            end            
        end
        set(hObject,'String',L1)
    end
function LST_flow_Callback(hObject, eventdata, handles)
    if strcmp(get(handles.OTIS2008,'SelectionType'),'open') == 1
        ISTEADY = get(handles.CHK_ISTEADY,'Value');
        K = get(hObject,'Value');
        L1 = get(hObject,'String');
        I = size(L1,1);
        if ISTEADY == 1
            button = questdlg('Please Select Option','Adjust Flow Data','Copy Up','Copy Down','Copy Up');
        else
            button = questdlg('Please Select Option','Adjust Flow Data','Delete','Copy','Move','Delete');
            if strcmp(button,'Move')==1
                button1 = questdlg('Please Select Option','Copy Flow Data','Copy Up','Copy Down','Copy Up');                
            elseif strcmp(button,'Copy')==1
                button1 = questdlg('Please Select Option','Move Flow Data','Move Up','Move Down','Move Up');                 
            end
        end           
        if strcmp(button,'Delete')==1
            if I == 1
                L1 = '';
            elseif K == 1
                L1 = L1(2:I,:);
            elseif K == I    
                L1 = L1(1:I-1,:);
            else
                L1 = strvcat(L1(1:K-1,:),L1(K+1:I,:));
            end
            I = I - 1;
            set(handles.CMB_GREACH,'String',1:I+1);

        elseif strcmp(button,'Copy Up')==1
            if K == 1
                helpdlg('Cannot Copy Up','Error')
            else
                L3 = L1(K,:);
                L1(K-1,:) = L3;
            end
        elseif strcmp(button,'Copy Down')==1
            if K == I
                helpdlg('Cannot Copy Down','Error')
            else
                L3 = L1(K,:);
                L1(K+1,:) = L3;
            end
        elseif strcmp(button,'Move Up')==1
            if K == 1
                helpdlg('Cannot Move Up','Error')
            else
                L3 = L1(K,:);
                L4 = L1(K-1,:);
                L1(K,:) = L4;
                L1(K-1,:) = L3;
            end            
        elseif strcmp(button,'Move Down')==1
            if K == I
                helpdlg('Copied Down','!! Warning !!')
                L1 = strvcat(L1,L1(I,:));
                I = I + 1;
                set(handles.CMB_GREACH,'String',1:I+1);
            else
                L3 = L1(K,:);
                L4 = L1(K+1,:);
                L1(K,:) = L4;
                L1(K+1,:) = L3;
            end            
        end
        for J = 1:I
            str = strcat(num2str(J,'%11.4g'),',');
            while size(str,2)<11
                str = strcat(str,':');
            end;
            str = strrep(str,':',' ');    
            L1(J,1:11)=str;
        end;    
        set(hObject,'String',L1)
    end

function LST_FLOWLOC_Callback(hObject, eventdata, handles)
    if strcmp(get(handles.OTIS2008,'SelectionType'),'open') == 1
        K = get(hObject,'Value');
        LFLOWLOC = get(hObject,'String');
        str = LFLOWLOC(K,:);
        I = size(LFLOWLOC,1);
        button = questdlg('Selecting Delete will remove all data for this flow location.','Unsteady Flow Locations','Delete','Delete');
        if strcmp(button,'Delete')==1
            if I == 1
                LFLOWLOC = '';
            elseif K == 1
                LFLOWLOC = LFLOWLOC(2:I,:);
            elseif K == I    
                LFLOWLOC = LFLOWLOC(1:I-1,:);
            else
                LFLOWLOC = strvcat(LFLOWLOC(1:K-1,:),LFLOWLOC(K+1:I,:));
            end
            LFLOW = get(handles.LST_flow,'String');
            J = 1;
            while J < size(LFLOW,1)
                L1 = findstr(LFLOW(J,:),',');
                L2 = LFLOW(J,12:L1(2)-1);
                L2 = strrep(L2,' ','');
                if strcmp(str,L2)==1
                    if J == 1
                        LFLOW = LFLOW(2:size(LFLOW,1),:);
                    elseif K == I    
                        LFLOW = LFLOW(1:size(LFLOW,1)-1,:);
                    else
                        LFLOW = strvcat(LFLOW(1:J-1,:),LFLOW(J+1:size(LFLOW,1),:));
                    end
                    J = J + 1; 
                end
            end    
            set(hObject,'String',LFLOWLOC)
            set(hObject,'Value',1)
            for J = 1:size(LFLOW)
                str = strcat(num2str(J,'%11.4g'),',');
                while size(str,2)<11
                    str = strcat(str,':');
                end;
                str = strrep(str,':',' ');    
                LFLOW(J,1:11)=str;
            end
            set(handles.LST_flow,'String',LFLOW);
        end
    end

function LST_geometry_Callback(hObject, eventdata, handles)
    if strcmp(get(handles.OTIS2008,'SelectionType'),'open') == 1
        K = get(hObject,'Value');
        LGEOM = get(hObject,'String');
        NREACH = size(LGEOM,1);
        button = questdlg('Please Select Option','Geometry Data','Delete','Delete');
        if strcmp(button,'Delete')==1
            if NREACH == 1
                helpdlg('One reach Minimum','!! Warning !!')
            elseif K == 1
                LGEOM = LGEOM(2:NREACH,:);
                NREACH = NREACH - 1;
            elseif K == NREACH    
                LGEOM = LGEOM(1:NREACH-1,:);
                NREACH = NREACH - 1;
            else
                LGEOM = strvcat(LGEOM(1:K-1,:),LGEOM(K+1:NREACH,:));
                NREACH = NREACH - 1;
            end            
            set(handles.CMB_GREACH,'String',1:NREACH+1);                        
            % Correct Chemistry
            set(handles.CMB_CREACH,'String',1:NREACH);
            LCHEM = get(handles.LST_chemistry,'String');
            NSOLUTE = size(get(handles.CMB_CSOLUTE,'String'),1);
            if size(LCHEM,1) > NREACH*NSOLUTE
                if K == 1
                    LCHEM = LCHEM(NSOLUTE+1:size(LCHEM,1),:);
                elseif K == NREACH+1
                    LCHEM = LCHEM(1:size(LCHEM,1)-NSOLUTE,:);
                else
                    LCHEM = strvcat(LCHEM(1:(K-1)*NSOLUTE,:),LCHEM((K+1)*NSOLUTE:size(LCHEM,1),:));
                end
            end
            % Correct Flow
            ISTEADY = get(handles.CHK_ISTEADY,'Value');
            if ISTEADY == 1
                set(handles.CMB_FLINE,'String',1:NREACH);
                LFLOW = get(handles.LST_flow,'String');
                if size(LFLOW,1) > NREACH
                    if K == 1
                        LFLOW = LFLOW(2:NREACH+1,:);
                    elseif K == NREACH+1
                        LFLOW = LFLOW(1:NREACH,:);
                    else
                        LFLOW = strvcat(LFLOW(1:K-1,:),LFLOW(K+1:NREACH+1,:));
                    end
                end
                for J = 1:NREACH
                    str = strcat(num2str(J,'%11.4g'),',');
                    while size(str,2)<11
                        str = strcat(str,':');
                    end;
                    str = strrep(str,':',' ');    
                    LFLOW(J,1:11)=str;
                end;
            end;
                set(handles.LST_flow,'String',LFLOW);
                set(handles.LST_flow,'Value',1);
            for J = 1:NREACH
                str = strcat(num2str(J,'%11.4g'),',');
                while size(str,2)<11
                    str = strcat(str,':');
                end;
                str = strrep(str,':',' ');    
                LGEOM(J,1:11)=str;
                for I = 1:NSOLUTE
                    LCHEM((J-1)*NSOLUTE+I,1:11)=str;
                end;  
            end;
        end;
        set(hObject,'String',LGEOM);
        set(handles.LST_chemistry,'String',LCHEM);        
        set(hObject,'Value',1);
        set(handles.CMB_GREACH,'Value',1);
        set(handles.LST_chemistry,'Value',1);
        set(handles.CMB_CREACH,'VAlue',1);
    end;
    
function LST_SOLUTE_Callback(hObject, eventdata, handles)
    if strcmp(get(handles.OTIS2008,'SelectionType'),'open') == 1
        K = get(hObject,'Value');
        LSOLUTE = get(hObject,'String');
        NSOLUTE = size(LSOLUTE,1);
        NREACH = size(get(handles.CMB_GREACH,'String'),1)-1;                
        button = questdlg('Please Select Option','Solutes','Delete','Delete');
        if strcmp(button,'Delete')==1
            if NSOLUTE == 1
                helpdlg('One solute Minimum','!! Warning !!')
                NSOLUTE = 1 ;
            elseif K == 1
                LSOLUTE = LSOLUTE(2:NSOLUTE,:);
                NSOLUTE = NSOLUTE - 1;
            elseif K == NSOLUTE    
                LSOLUTE = LSOLUTE(1:NSOLUTE-1,:);
                NSOLUTE = NSOLUTE - 1;
            else
                LSOLUTE = strvcat(LSOLUTE(1:K-1,:),LSOLUTE(K+1:NSOLUTE,:));
                NSOLUTE = NSOLUTE - 1;
            end
            % Correct Chemistry
            LCHEM = get(handles.LST_chemistry,'String');
            if size(LCHEM,1)/NREACH > 1
                for J = (NREACH-1)*(NSOLUTE+1)+K:-(NSOLUTE+1):K
                    if J == 1
                        LCHEM = LCHEM(2:size(LCHEM,1),:);
                    elseif K == size(LCHEM,1)
                        LCHEM = LCHEM(1:size(LCHEM,1)-1,:);
                    else
                        LCHEM = strvcat(LCHEM(1:J-1,:),LCHEM(J+1:size(LCHEM,1),:));
                    end
                end
            end
        end
        for J = 1:NSOLUTE
            str = strcat(num2str(J,'%11.4g'),',');
            while size(str,2)<11
                str = strcat(str,':');
            end;
            str = strrep(str,':',' ');    
            LSOLUTE(J,1:11)=str;
        end;
        NREACH = size(get(handles.CMB_GREACH,'String'),1)-1;
        for K = 1:NREACH
            for J = 1:NSOLUTE
                L1 = strcat(num2str(K,'%11.4g'),',');
                while size(L1,2)<11
                    L1 = strcat(L1,':');
                end;
                L2 = strcat(num2str(J,'%11.4g'),',');
                while size(L2,2)<12
                    L2 = strcat(L2,':');
                end;
                L1 = strrep(L1,':',' ');  
                L2 = strrep(L2,':',' ');    
                LCHEM((K-1)*NSOLUTE+J,1:11)=L1;
                LCHEM((K-1)*NSOLUTE+J,12:23)=L2;                
            end;
        end;
        set(hObject,'String',LSOLUTE);
        set(hObject,'Value',1);
        set(handles.LST_chemistry,'String',LCHEM);
        set(handles.CMB_SOLUTE,'String',1:NSOLUTE+1);             
        set(handles.CMB_SOLUTE,'Value',1);        
        set(handles.CMB_CSOLUTE,'String',1:NSOLUTE);        
    end
  
function LST_RPRTLOC_Callback(hObject, eventdata, handles)
    if strcmp(get(handles.OTIS2008,'SelectionType'),'open') == 1
        K = get(hObject,'Value');
        LRPRTLOC = get(hObject,'String');
        I = size(LRPRTLOC,1);
        button = questdlg('Please Select Option','Print Locations','Delete','Delete');
        if strcmp(button,'Delete')==1
            if I == 1
                LRPRTLOC = '';
                set(hObject,'Value',1)
            elseif K == 1
                LRPRTLOC = LRPRTLOC(2:I,:);
            elseif K == I    
                LRPRTLOC = LRPRTLOC(1:I-1,:);
            else
                LRPRTLOC = strvcat(LRPRTLOC(1:K-1,:),LRPRTLOC(K+1:I,:));
            end
        end
        set(hObject,'String',LRPRTLOC)
    end
   
%%	Check Boxes - Callback
% --- Executes on button press.
% hObject    handle to Tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of hObject

function CHK_ISTEADY_Callback(hObject, eventdata, handles)
    ISTEADY = get(handles.CHK_ISTEADY,'Value');
    button = questdlg('Choose Carefully','Flow Option','Steady','Unsteady','Steady');
    if strcmp(button,'Steady')==1 && ISTEADY == 1
        NREACH = size(get(handles.CMB_CREACH,'String'),1);
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
        for I = 1:NREACH
            set(handles.CMB_FLINE,'Value',I)
            set(handles.TXT_QLATIN,'String','0')
            set(handles.TXT_QLATOUT,'String','0')
            set(handles.TXT_AREA,'String','0')
            set(handles.TXT_CLATIN,'String','0')
            SAVEGUI
        end
    elseif strcmp(button,'Unsteady')==1 && ISTEADY == 0
        set(handles.LST_FLOWLOC,'String','');
        set(handles.LST_FLOWLOC,'Value',1);
        set(handles.LST_FLOWLOC,'Visible','on');
        set(handles.TXT_FLOWLOC,'Visible','on');
        set(handles.LBL_FLOWLOC,'Visible','on');
        set(handles.CMD_FLOWLOCADD,'Visible','on');    
        set(handles.CMB_FLINE,'String','1');
        set(handles.LBL_FLINE,'String','LINE');
        set(handles.LBL_FFLOWLOC,'Visible','on');
        set(handles.CMB_FFLOWLOC,'Visible','on');
        set(handles.CMB_FFLOWLOC,'String','');
        set(handles.CMB_FFLOWLOC,'Value',1);        
        set(handles.LST_flow,'String','');                
        set(handles.LST_flow,'Value',1);
        set(handles.LBL_Q,'Visible','on');    
        set(handles.TXT_Q,'Visible','on');
        SAVEGUI
    end
function CHK_IPAR_Callback(hObject, eventdata, handles)
	SAVEGUI
function CHK_INEST_Callback(hObject, eventdata, handles)
    SAVEGUI
function CHK_IMETRIC_Callback(hObject, eventdata, handles)
    SAVEGUI
function CHK_IGRAPH_Callback(hObject, eventdata, handles)
    SAVEGUI
function CHK_IMOVIE_Callback(hObject, eventdata, handles)
    SAVEGUI