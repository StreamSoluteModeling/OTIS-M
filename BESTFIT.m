close all;
[sfile,spath]=uigetfile('.txt','Select Optimization File');
OPTDATA = importdata([spath sfile],'\t' ,1);
%Determine Best Parameters
n = size(OPTDATA.data,1);
val = sortrows(OPTDATA.data,10);
disp(strcat('Run: ',num2str(val(1,1))))
disp(strcat('DISP: ',num2str(val(1,3))))
disp(strcat('AREA: ',num2str(val(1,4))))
disp(strcat('AREA2: ',num2str(val(1,5))))
disp(strcat('AREA3: ',num2str(val(1,6))))
disp(strcat('alpha: ',num2str(val(1,7))))
disp(strcat('alpha3: ',num2str(val(1,8))))
disp(strcat('RMSE: ',num2str(val(1,10))))