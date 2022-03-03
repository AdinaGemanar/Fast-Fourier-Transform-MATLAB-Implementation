function varargout = pr(varargin)
% PR MATLAB code for pr.fig
%      PR, by itself, creates a new PR or raises the existing
%      singleton*.
%
%      H = PR returns the handle to a new PR or the handle to
%      the existing singleton*.
%
%      PR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PR.M with the given input arguments.
%
%      PR('Property','Value',...) creates a new PR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before pr_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to pr_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help pr

% Last Modified by GUIDE v2.5 06-Jan-2021 14:45:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pr_OpeningFcn, ...
                   'gui_OutputFcn',  @pr_OutputFcn, ...
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


% --- Executes just before pr is made visible.
function pr_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to pr (see VARARGIN)

% Choose default command line output for pr
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes pr wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = pr_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Apply_pushbutton.
function Apply_pushbutton_Callback(hObject, eventdata, handles)

Fs=150; % Sampling frequency   
f = str2num(get(handles.edit1, 'string'));  %frequency from the edit box
A=str2num(get(handles.edit3, 'string')); %amplitude from the edit box
nfft=str2num(get(handles.edit4, 'string')); %lenght of FFT from the edit box
val=get(handles.popupmenu1, 'Value');

switch val
    case 1
       t = 0:1/Fs:1;  % Time vector of 1 second 
       x = A*sin(2*pi*t*f);
       X = fft(x,nfft); 
       X = X(1:nfft/2); % FFT is symmetric, throw away second half
       mx = abs(X); % Take the magnitude of fft of x
       f = (0:nfft/2-1)*Fs/nfft; % Frequency vector
       phase=angle(X)*180/pi; %phase spectrum (in deg.)
       % Generate the plot, title and labels. 
    
       axes(handles.axes1);
  
       plot(t,x );              %plots signal(sin) in time domain
       axes(handles.axes2);
       plot(f,mx);   %plots signal (sin) in freq domain & % Take the magnitude of fft
       axes(handles.axes3);
       plot(f,phase); %plots phase
       
    case 2
       t = 0:1/Fs:1;
       x = A*cos(2*pi*t*f);
       X = fft(x,nfft); 
       X = X(1:nfft/2);
       mx = abs(X);
       f = (0:nfft/2-1)*Fs/nfft;
       phase=angle(X)*180/pi; %phase spectrum (in deg.)
       axes(handles.axes1);
       plot(t,x);              
       axes(handles.axes2);
       plot(f,mx);   
       axes(handles.axes3);
       plot(f,phase);
    case 3
       t = 0:1/Fs:1;
       x = A*tan(2*pi*t*f);
       X = fft(x,nfft); 
       X = X(1:nfft/2);
       mx = abs(X);
       f = (0:nfft/2-1)*Fs/nfft;
       phase=angle(X)*180/pi; %phase spectrum (in deg.)
       axes(handles.axes1);
       plot(t,x);              
       axes(handles.axes2);
       plot(f,mx);   
       axes(handles.axes3);
       plot(f,phase);
    case 4
       t = -.5:1/Fs:.5;
       x =A*( 1/(sqrt(2*pi*0.01))*(exp(-t.^2/(2*0.01))));
       X = fft(x,nfft); 
       X = X(1:nfft/2);
       mx = abs(X);
       f = (0:nfft/2-1)*Fs/nfft;
       phase=angle(X)*180/pi; %phase spectrum (in deg.)
       axes(handles.axes1);
       plot(t,x);            
       axes(handles.axes2);
       plot(f,mx); 
       axes(handles.axes3);
       plot(f,phase);
    case 5
       t = 0:1/Fs:1;
       x = A*sign(sin(2*pi*t*f));
       X = fft(x,nfft); 
       X = X(1:nfft/2);
       mx = abs(X);
       f = (0:nfft/2-1)*Fs/nfft;
       phase=angle(X)*180/pi; %phase spectrum (in deg.)
       axes(handles.axes1);
       plot(t,x);              
       axes(handles.axes2);
       plot(f,mx);   
       axes(handles.axes3);
       plot(f,phase);
    case 6
       t = 0:1/Fs:1; % Time vector of 1 second
       x = 2*exp(-5*t);
       X = fft(x,nfft);
       X = X(1:nfft/2); 
       mx = abs(X);
       f = (0:nfft/2-1)*Fs/nfft; 
       phase=angle(X)*180/pi; %phase spectrum (in deg.)
       axes(handles.axes1);
       plot(t,x);              
       axes(handles.axes2);
       plot(f,mx);   
       axes(handles.axes3);
       plot(f,phase);
    case 7
        t = 0:1/Fs:1; % Time vector of 1 second
        x = chirp(t,0,1,Fs/6);
        X = fft(x,nfft); 
        X = X(1:nfft/2); 
        mx = abs(X);
       f = (0:nfft/2-1)*Fs/nfft; 
       phase=angle(X)*180/pi; %phase spectrum (in deg.)
       axes(handles.axes1);
       plot(t,x);              
       axes(handles.axes2);
       plot(f,mx);   
       axes(handles.axes3);
       plot(f,phase);
        
end

% hObject    handle to Apply_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Clear_pushbutton.
function Clear_pushbutton_Callback(hObject, eventdata, handles)
set(handles.edit1, 'string', ' ');
set(handles.edit3, 'string', ' ');
set(handles.edit4, 'string', ' ');
axes(handles.axes1);
plot(0);
axes(handles.axes2);
plot(0);
axes(handles.axes3);
plot(0);
% hObject    handle to Clear_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
val=get(handles.popupmenu1,'Value');
handles.v=val;
guidata(hObject,handles);
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Close_pushbutton.
function Close_pushbutton_Callback(hObject, eventdata, handles)
close
% hObject    handle to Close_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Grid_pushbutton.
function Grid_pushbutton_Callback(hObject, eventdata, handles)
grid on
% hObject    handle to Grid_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Open_pushbutton.
function Open_pushbutton_Callback(hObject, eventdata, handles)
winopen('Documentatie.pdf');
% hObject    handle to Open_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
xlabel('Time(s)') 
ylabel('Amplitude(V)') 
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
xlabel('Frequency(Hz)') 
ylabel('Amplitude(db)')
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
xlabel('Frequency(Hz)') 
ylabel('Phase(deg)')
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes3
