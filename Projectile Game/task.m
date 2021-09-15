function varargout = task(varargin)
% TASK MATLAB code for task.fig
%      TASK, by itself, creates a new TASK or raises the existing
%      singleton*.
%
%      H = TASK returns the handle to a new TASK or the handle to
%      the existing singleton*.
%
%      TASK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TASK.M with the given input arguments.
%
%      TASK('Property','Value',...) creates a new TASK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before task_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to task_OpeningFcn via varargin.
% 
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help task

% Last Modified by GUIDE v2.5 17-Jul-2021 22:59:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @task_OpeningFcn, ...
    'gui_OutputFcn',  @task_OutputFcn, ...
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

% --- Executes just before task is made visible.
function task_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to task
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to task (see VARARGIN)
handles.fireButton.Enable = 'off';
handles.box.Visible = 'off';
handles.angleSlider.Value = 20;
handles.velocitySlider.Value = 20;
% Choose default command line output for task
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes task wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = task_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to task
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function velocityEditText_Callback(hObject, eventdata, handles)
% hObject    handle to velocityEditText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of velocityEditText as text
%        str2double(get(hObject,'String')) returns contents of velocityEditText as a double


% --- Executes during object creation, after setting all properties.
function velocityEditText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to velocityEditText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function angleEditText_Callback(hObject, eventdata, handles)
% hObject    handle to angleEditText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of angleEditText as text
%        str2double(get(hObject,'String')) returns contents of angleEditText as a double


% --- Executes during object creation, after setting all properties.
function angleEditText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angleEditText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function velocitySlider_Callback(hObject, eventdata, handles)
% hObject    handle to velocitySlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.velocityEditText,'String',num2str(handles.velocitySlider.Value));

% --- Executes during object creation, after setting all properties.
function velocitySlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to velocitySlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function angleSlider_Callback(hObject, eventdata, handles)
% hObject    handle to angleSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.angleEditText.String = num2str(handles.angleSlider.Value);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function angleSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angleSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in fireButton.
function fireButton_Callback(hObject, eventdata, handles)
global objPos;
% hObject    handle to fireButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(handles.fireButton.Value == 1)
    handles.fireButton.Enable = 'off';
    handles.placeButton.Enable = 'off';
    axes(handles.plotWindow);
    cla
    
    t = 0:0.002:50;
    %read the value from velocity slider and set the velocity.
    v = handles.velocitySlider.Value;
    %read the value from angle slider and set the angle.
    theta = handles.angleSlider.Value;
    
    x = (v*cosd(theta)).*t;
    y = (v*sind(theta)).*t - (9.8).*(t.^2);
    for i = 1:length(x)
        if(y(i) < 0)
           itr = i;
           break;
       end
    end
    axes(handles.plotWindow);
    for i = 1:length(x)
       handles.plotWindow.XColor = 'w';
       handles.plotWindow.YColor = 'w';
       plot(x(i),y(i),'p','Color',[i/itr 0 0],'MarkerSize',(i*32)/itr);
       axis([0 50 0 max(y)+0.2]);
       hold on;
       pause(0.01);
       if(x(i) > 50)
           break;
       end
        if(y(i) < 0)
           break;
       end
    end
    hold off;
    if(y(i-1) <= 0.5 && x(i-1)>= objPos-5 && x(i-1) <= objPos+5)
        handles.scoreEditText.String = num2str(str2num(handles.scoreEditText.String) + 1);
    end
    handles.fireButton.Enable = 'on';
    handles.placeButton.Enable = 'on';
    handles.fireButton.Value = 0;
end

% --- Executes on button press in placeButton.
function placeButton_Callback(hObject, eventdata, handles)
global objPos;
handles.plotWindow.Color = 'w';
handles.plotWindow.XColor = 'w';
handles.plotWindow.YColor = 'w';
handles.fireButton.Enable = 'on';
pos = randi([82,130],1);
new_position_array= [pos 12 25 9];
objPos = (pos - 82) * (50 - 30) / (130 - 82) + 30;
handles.box.Visible = 'on';

set(handles.box,'Position', new_position_array)
% hObject    handle to placeButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function scoreEditText_Callback(hObject, eventdata, handles)
% hObject    handle to scoreEditText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of scoreEditText as text
%        str2double(get(hObject,'String')) returns contents of scoreEditText as a double


% --- Executes during object creation, after setting all properties.
function scoreEditText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to scoreEditText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function plotWindow_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plotWindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate plotWindow
axis([0 50 0 3.5]);


% --- Executes during object creation, after setting all properties.
function fireButton_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fireButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
