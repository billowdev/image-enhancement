function varargout = MatlabGUI_Ex715CS63112(varargin)
% MATLABGUI_EX715CS63112 MATLAB code for MatlabGUI_Ex715CS63112.fig
%      MATLABGUI_EX715CS63112, by itself, creates a new MATLABGUI_EX715CS63112 or raises the existing
%      singleton*.
%
%      H = MATLABGUI_EX715CS63112 returns the handle to a new MATLABGUI_EX715CS63112 or the handle to
%      the existing singleton*.
%
%      MATLABGUI_EX715CS63112('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MATLABGUI_EX715CS63112.M with the given input arguments.
%
%      MATLABGUI_EX715CS63112('Property','Value',...) creates a new MATLABGUI_EX715CS63112 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MatlabGUI_Ex715CS63112_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MatlabGUI_Ex715CS63112_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MatlabGUI_Ex715CS63112

% Last Modified by GUIDE v2.5 02-Aug-2021 14:29:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MatlabGUI_Ex715CS63112_OpeningFcn, ...
                   'gui_OutputFcn',  @MatlabGUI_Ex715CS63112_OutputFcn, ...
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


% --- Executes just before MatlabGUI_Ex715CS63112 is made visible.
function MatlabGUI_Ex715CS63112_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MatlabGUI_Ex715CS63112 (see VARARGIN)

% Choose default command line output for MatlabGUI_Ex715CS63112
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MatlabGUI_Ex715CS63112 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MatlabGUI_Ex715CS63112_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

[filename pathname] = uigetfile({'*.jpg';'*.png';'*.bmp'},'File Selector');
pathf = strcat(pathname, filename);
I = imread(pathf);

handles.image = I;
guidata(hObject, handles)
axes(handles.axes1);
imshow(I)
n = 0:256;
N = 128;
phaR = 0; phaG = pi/3; phaB = 2*pi/3;
handles.Rdata = abs(cos(2*pi.*n/N+phaR));
guidata(hObject, handles)
handles.Gdata = abs(cos(2*pi.*n/N+phaG));
guidata(hObject, handles)
handles.Bdata = abs(cos(2*pi.*n/N+phaB));
guidata(hObject,handles)
mx = max(max(I))

axes(handles.axes3);
plot(n, handles.Rdata, n, handles.Gdata, n, handles.Bdata);

MapColor(I, handles);


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
Update(hObject,handles);

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
Update(hObject,handles);

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
Update(hObject,handles);

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
