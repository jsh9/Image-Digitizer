function varargout = ImgDigitizer(varargin)
% IMGDIGITIZER MATLAB code for ImgDigitizer.fig
%      IMGDIGITIZER, by itself, creates a new IMGDIGITIZER or raises the existing
%      singleton*.
%
%      H = IMGDIGITIZER returns the handle to a new IMGDIGITIZER or the handle to
%      the existing singleton*.
%
%      IMGDIGITIZER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMGDIGITIZER.M with the given input arguments.
%
%      IMGDIGITIZER('Property','Value',...) creates a new IMGDIGITIZER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ImgDigitizer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ImgDigitizer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ImgDigitizer

% Last Modified by GUIDE v2.5 03-Dec-2014 03:46:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ImgDigitizer_OpeningFcn, ...
                   'gui_OutputFcn',  @ImgDigitizer_OutputFcn, ...
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


% --- Executes just before ImgDigitizer is made visible.
function ImgDigitizer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ImgDigitizer (see VARARGIN)

% Choose default command line output for ImgDigitizer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ImgDigitizer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ImgDigitizer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1_load_img.
function pushbutton1_load_img_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1_load_img (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

start_dir0 = pwd();
filter_spec = {'*.png;*.jpg;*.tiff','Image files (*.png,*.jpg,*.tiff)';'*.*','All Files (*.*)'};
dlg_title = 'Select image file...';
[img_file_name,img_dir_name,filter_index] ...
    = uigetfile(filter_spec,dlg_title,start_dir0,'MultiSelect','off');
A = imread(fullfile(img_dir_name,img_file_name));

axes(handles.axes1);
imshow(A, []);

handles.metricdata.img_dir_name = img_dir_name;
handles.metricdata.step1_finished = 1;

guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function pushbutton1_load_img_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1_load_img (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

handles.metricdata.step1_finished = 0;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in uipanel1_x_scale.
function uipanel1_x_scale_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel1_x_scale 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
    case 'radiobutton1'
        x_scale = 'linear';
    case 'radiobutton2'
        x_scale = 'log';
end
handles.metricdata.x_scale = x_scale;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function uipanel1_x_scale_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1_x_scale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
handles.metricdata.x_scale = 'linear';
guidata(hObject,handles);


% --- Executes when selected object is changed in uipanel2_y_scale.
function uipanel2_y_scale_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel2_y_scale 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
    case 'radiobutton1'
        y_scale = 'linear';
    case 'radiobutton2'
        y_scale = 'log';
end
handles.metricdata.y_scale = y_scale;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function uipanel2_y_scale_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel2_y_scale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
handles.metricdata.y_scale = 'linear';
guidata(hObject,handles);


function edit2_x_lim_low_Callback(hObject, eventdata, handles)
% hObject    handle to edit2_x_lim_low (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2_x_lim_low as text
%        str2double(get(hObject,'String')) returns contents of edit2_x_lim_low as a double

x_lim_low = str2double(get(hObject,'String'));
handles.metricdata.x_lim_low = x_lim_low;
handles.metricdata.step2_finished = 1;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit2_x_lim_low_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2_x_lim_low (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.metricdata.step2_finished = 0;
guidata(hObject,handles);


function edit3_x_lim_high_Callback(hObject, eventdata, handles)
% hObject    handle to edit3_x_lim_high (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3_x_lim_high as text
%        str2double(get(hObject,'String')) returns contents of edit3_x_lim_high as a double

x_lim_high = str2double(get(hObject,'String'));
handles.metricdata.x_lim_high = x_lim_high;
handles.metricdata.step3_finished = 1;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit3_x_lim_high_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3_x_lim_high (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.metricdata.step3_finished = 0;
guidata(hObject,handles);


% --- Executes on button press in pushbutton2_click_low.
function pushbutton2_click_low_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2_click_low (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[x_low_coord,y_low_coord] = ginput(1);
handles.metricdata.x_low_coord = x_low_coord;
handles.metricdata.y_low_coord = y_low_coord;
handles.metricdata.step6_finished = 1;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function pushbutton2_click_low_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton2_click_low (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

handles.metricdata.step6_finished = 0;
guidata(hObject,handles);


% --- Executes on button press in pushbutton3_click_high.
function pushbutton3_click_high_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3_click_high (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[x_high_coord,y_high_coord] = ginput(1);
handles.metricdata.x_high_coord = x_high_coord;
handles.metricdata.y_high_coord = y_high_coord;
handles.metricdata.step7_finished = 1;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function pushbutton3_click_high_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton3_click_high (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

handles.metricdata.step7_finished = 0;
guidata(hObject,handles);


function edit4_y_lim_low_Callback(hObject, eventdata, handles)
% hObject    handle to edit4_y_lim_low (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4_y_lim_low as text
%        str2double(get(hObject,'String')) returns contents of edit4_y_lim_low as a double
y_lim_low = str2double(get(hObject,'String'));
handles.metricdata.y_lim_low = y_lim_low;
handles.metricdata.step4_finished = 1;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit4_y_lim_low_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4_y_lim_low (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.metricdata.step4_finished = 0;
guidata(hObject,handles);


function edit5_y_lim_high_Callback(hObject, eventdata, handles)
% hObject    handle to edit5_y_lim_high (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5_y_lim_high as text
%        str2double(get(hObject,'String')) returns contents of edit5_y_lim_high as a double

y_lim_high = str2double(get(hObject,'String'));
handles.metricdata.y_lim_high = y_lim_high;
handles.metricdata.step5_finished = 1;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit5_y_lim_high_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5_y_lim_high (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.metricdata.step5_finished = 0;
guidata(hObject,handles);


% --- Executes on button press in pushbutton6_Start.
function pushbutton6_Start_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6_Start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

clc;

step1 = handles.metricdata.step1_finished;
step2 = handles.metricdata.step2_finished;
step3 = handles.metricdata.step3_finished;
step4 = handles.metricdata.step4_finished;
step5 = handles.metricdata.step5_finished;

if step1*step2*step3*step4*step5 ~= 1
    errordlg('You haven''t finished all the necessary steps!','Error');
else
    x1c = handles.metricdata.x_low_coord;  % x limits obtained by mouse clicks
    x2c = handles.metricdata.x_high_coord;
    y1c = handles.metricdata.y_low_coord;
    y2c = handles.metricdata.y_high_coord;

    x1 = handles.metricdata.x_lim_low;  % x limits entered by keyboard
    x2 = handles.metricdata.x_lim_high;
    y1 = handles.metricdata.y_lim_low;
    y2 = handles.metricdata.y_lim_high;

    x_scale = handles.metricdata.x_scale;
    y_scale = handles.metricdata.y_scale;

    if (x1 < x2) && (y1 < y2)

        [x,y] = getpts();
        n = length(x);

        for j = 1 : 1 : n
            dx = x - x1c;
            dy = y - y1c;
            if strcmp(x_scale,'log')
                a_x = (x2c - x1c)/log10(x2/x1);
                b_x = mod(dx,a_x);
                x_base = x1 * 10.^(floor(dx/a_x));
                x_ = x_base .* 10.^(b_x/a_x);
            elseif strcmp(x_scale,'linear')
                x_ = x1 + (x - x1c)/(x2c - x1c)*(x2 - x1);
            end
            if strcmp(y_scale,'log')
                a_y = (y2c - y1c)/log10(y2/y1);
                b_y = mod(dy,a_y);
                y_base = y1 * 10.^(floor(dy/a_y));
                y_ = y_base .* 10.^(b_y/a_y);
            elseif strcmp(y_scale,'linear')
                y_ = y1 + (y - y1c)/(y2c - y1c)*(y2 - y1);
            end
        end
        data = [x_,y_];
        handles.metricdata.data = data;
        disp('Digitized data (x,y):')
        disp(data);
        
        figure;
        plot(x_,y_,'b-o');
        set(gca,'xScale',x_scale,'yScale',y_scale);
        xlim([x1 x2]);
        ylim([y1 y2]);
        grid on;
        h_export_data = uicontrol('style','pushbutton','units','normalized',...
                           'string', 'Export data',...
                           'position', [0.8 0.95 0.2 0.05]);
        set(h_export_data,'callback',{@h_export_data_Callback,handles}); % associate button with callback
    else
        errordlg('X and/or Y limit values incorrect!','Input data error');
    end
end
assignin('base', 'digitized_data', data);  % send 'data' to base workspace as 'digitized_data'
guidata(hObject, handles);


function h_export_data_Callback(h_export_data, eventdata, handles)

c = clock;
date_time = sprintf('%d-%d-%d_%d-%d-%d',c(1),c(2),c(3),c(4),c(5),floor(c(6)));
fname = sprintf('Digitized_data_%s.csv',date_time);

img_dir = handles.metricdata.img_dir_name;

if strcmpi(computer,'pcwin64')
    newline_str = 'pc';
elseif strcmpi(computer,'maci64')
    newline_str = 'unix';
end
data = handles.metricdata.data;
dlmwrite(fullfile(img_dir,fname),data,'delimiter',',','newline',newline_str,...
    'precision',6);

if strcmpi(computer,'pcwin64')
    command_Windows = sprintf('explorer /select,%s',fullfile(img_dir,fname));
    system(command_Windows);
elseif strcmpi(computer,'maci64')
    cdir = img_dir;  % directory of image
    cdir = strrep(cdir,'(','\('); % replace ( with \(
    cdir = strrep(cdir,')','\)'); % replace ) with \)
    cdir = strrep(cdir,' ','\ '); % add a \ before the spaces
    command_Mac = sprintf('open %s',cdir);
    system(command_Mac);
end
% guidata(hObject, handles);


% --- Executes on key press with focus on figure1 or any of its controls.
function figure1_WindowKeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7_author_info.
function pushbutton7_author_info_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7_author_info (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

hm = msgbox({'Current version: v1.2.5, 11/03/2017',...
    'First draft: 12/3/2014',...
    ' ','(c) Jian Shi, 2017',...
    '    jian.shi@caltech.edu'},'About');
ahm = get(hm,'CurrentAxes');
chm = get(ahm,'Children');
set(chm,'FontSize',10);
set(ahm,'FontSize',10);
set(chm,'FontName','Arial');
pos = get(hm,'position');
pos = pos + [0,0,42,10];
set(hm,'position',pos);
