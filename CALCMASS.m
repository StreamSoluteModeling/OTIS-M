%***********************************************************************
%
%     Subroutine CALCMASS           Called by: 
%
%     ...
%
%***********************************************************************
%
[file1,path1] = uigetfile('*.txt','Select Observed File');
[file2,path2] = uigetfile('*.txt','Select BOUNDARY File');
dx = 455;
Q = 57.6;
MC = load(strcat(path1,file1));
BC = load(strcat(path2,file2));
J = size(MC,1);
I = size(BC,1);
BC(1,3) = 0;
MC(1,3) = 0;
for K = 2:J    
    MC(K,3) = (MC(K,2)+MC(K-1,2))/2*(MC(K,1)-MC(K-1,1))+MC(K-1,3);
end
for K = 2:I    
    BC(K,3) = (BC(K,2)+BC(K-1,2))/2*(BC(K,1)-BC(K-1,1))+BC(K-1,3);
end

OM = MC(J,3)*Q
QDS = MC(J,3)*Q/BC(I,3)
QLAT = (QDS-Q)/dx