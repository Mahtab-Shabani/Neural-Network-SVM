function varargout = SVM(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @SVM_OpeningFcn, ...
    'gui_OutputFcn',  @SVM_OutputFcn, ...
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


% --- Executes just before SVM is made visible.
function SVM_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for SVM
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



% --- Outputs from this function are returned to the command line.
function varargout = SVM_OutputFcn(hObject, eventdata, handles)
% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in SetosVersi1.
function SetosVersi1_Callback(hObject, eventdata, handles)
% Load data
load fisheriris
data = meas(1:100,1:2);
group = species(1:100); % lable of classes
svmStruct = svmtrain(data,group,'showplot',true); % train network
[train, test] = crossvalind('holdOut',group);
cp = classperf(group);
% test network
classes = svmclassify(svmStruct,data(test,:),'showplot',false);
% Evaluate performance of classifier
classperf(cp,classes,test);
CorrectRate=cp.CorrectRate;
ErrorRate=cp.ErrorRate;
% Show performance and Error Rate
msgbox (strcat('CorrectRate = ',num2str(CorrectRate),' and ErrorRate = ',num2str(ErrorRate)),'message');


function SetosaVersi2_Callback(hObject, eventdata, handles)
load fisheriris
data = meas(1:100,3:4);
group = species(1:100);
svmStruct = svmtrain(data,group,'showplot',true);
[train, test] = crossvalind('holdOut',group);
cp = classperf(group);
classes = svmclassify(svmStruct,data(test,:),'showplot',false);
classperf(cp,classes,test);
CorrectRate=cp.CorrectRate;
ErrorRate=cp.ErrorRate;
msgbox (strcat('CorrectRate = ',num2str(CorrectRate),' and ErrorRate = ',num2str(ErrorRate)),'message');


function VersiVirgi1_Callback(hObject, eventdata, handles)
load fisheriris
data = meas(51:150,1:2);
group = species(51:150);

% svmStruct = svmtrain(data,group,'showplot',true);
% svmStruct = svmtrain(data,group,'kernel_function','quadratic','ShowPlot',true);
svmStruct = svmtrain(data,group,'kernel_function','rbf','ShowPlot',true);

[train, test] = crossvalind('holdOut',group);
cp = classperf(group);
classes = svmclassify(svmStruct,data(test,:),'showplot',false);
classperf(cp,classes,test);
CorrectRate=cp.CorrectRate;
ErrorRate=cp.ErrorRate;
msgbox (strcat('CorrectRate = ',num2str(CorrectRate),' and ErrorRate = ',num2str(ErrorRate)),'message');


function VersiVirgi2_Callback(hObject, eventdata, handles)
load fisheriris
data = meas(51:150,3:4);
group = species(51:150);
% svmStruct = svmtrain(data,group,'showplot',true);
svmStruct = svmtrain(data,group,'kernel_function','quadratic','ShowPlot',true);
% svmStruct = svmtrain(data,group,'kernel_function','rbf','ShowPlot',true);
[train, test] = crossvalind('holdOut',group);
cp = classperf(group);
classes = svmclassify(svmStruct,data(test,:),'showplot',false);
classperf(cp,classes,test);
CorrectRate=cp.CorrectRate;
ErrorRate=cp.ErrorRate;
msgbox (strcat('CorrectRate = ',num2str(CorrectRate),' and ErrorRate = ',num2str(ErrorRate)),'message');
