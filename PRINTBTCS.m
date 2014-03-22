clc;
clear all;
close all;

% tit{1}='0_0_0';
% col{1}='r';
% fids{1}='C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU3-C-2SZ-R\PTS_NaCl_XS_460_0_0_0.txt';
% tit{2}='0_0_0';
% col{2}='b';
% fids{2}='C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU3-N-2SZ-R\PTS_NaCl_XS_460_0_0_0.txt';

% tit{2}='0_0_0.01';
% col{2}='r';
% fids{2}='C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU3-C-2SZ-R\PTS_NaCl_XS_460_0_0_0.01.txt';
% tit{3}='0_0_0.001';
% col{3}='b';
% fids{3}='C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU3-C-2SZ-R\PTS_NaCl_XS_460_0_0_0.001.txt';
% tit{4}='0_0.01_0';
% col{4}='g';
% fids{4}='C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU3-C-2SZ-R\PTS_NaCl_XS_460_0_0.01_0.txt';
% tit{5}='0_0.001_0';
% col{5}='y';
% fids{5}='C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU3-C-2SZ-R\PTS_NaCl_XS_460_0_0.001_0.txt';


tit{1}='0_0.001_0.001';
col{1}='r';
fids{1}='C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU3-C-2SZ-R\PTS_NaCl_XS_460_0_0.001_0.001.txt';
tit{2}='0_0.001_0.001';
col{2}='b';
fids{2}='C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU3-N-2SZ-R\PTS_NaCl_XS_460_0_0.001_0.001.txt';
tit{3}='0_0.001_0.01';
col{3}='r';
fids{3}='C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU3-C-2SZ-R\PTS_NaCl_XS_460_0_0.001_0.01.txt';
tit{4}='0_0.001_0.01';
col{4}='b';
fids{4}='C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU3-N-2SZ-R\PTS_NaCl_XS_460_0_0.001_0.01.txt';
desc = 'MC=0,STS=0.001,HTS=0.001';
LEG = ['Competing'; 'Nested   '];
% % 
% tit{1}='0_0.01_0.001';
% col{1}='r';
% fids{1}='C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU3-C-2SZ-R\PTS_NaCl_XS_460_0_0.01_0.001.txt';
% tit{2}='0_0.01_0.001';
% col{2}='b';
% fids{2}='C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU3-N-2SZ-R\PTS_NaCl_XS_460_0_0.01_0.001.txt';
% desc = 'MC=0,STS=0.01,HTS=0.001';
% LEG = ['Competing'; 'Nested   '];

% tit{1}='0_0.001_0.01';
% col{1}='r';
% fids{1}='C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU3-C-2SZ-R\PTS_NaCl_XS_460_0_0.001_0.01.txt';
% tit{2}='0_0.001_0.01';
% col{2}='b';
% fids{2}='C:\Users\chluser\Desktop\Work\PennState\Model\OTIS-M\Files\LAU3-N-2SZ-R\PTS_NaCl_XS_460_0_0.001_0.01.txt';
% desc = 'MC=0,STS=0.001,HTS=0.01';
% LEG = ['Competing'; 'Nested   '];

clf; set(gcf,'renderer','zbuffer');set(gcf,'color','white'); figure(1);        
set(gcf,'PaperType','usLetter','PaperOrientation','portrait',...
        'PaperUnits','Inches','PaperPositionMode','Manual') 
set(gcf,'PaperPosition',[0 0 12 7],'Position',[100 100 1200 700])

mxM=0;mxS=0;mxH=0;
for i = 1:length(fids)
    OBSALL =  importdata(fids{i},'\t' ,2);
    OBSMC = [OBSALL.data(:,1),OBSALL.data(:,2)];
    OBSSTS = [OBSALL.data(:,1),OBSALL.data(:,3)];
    OBSHTS = [OBSALL.data(:,1),OBSALL.data(:,4)];
   
    subplot(2,2,1)
       plot(OBSMC(:,1),OBSMC(:,2),col{i})
       mxM = max(mxM,max(OBSMC(:,2)));
       hold on;
       axis([OBSMC(1,1) OBSMC(end,1) 0 mxM])
       xlabel('t (s)')
       ylabel('Conc (mg/l)')
       title(['MC:' '  ' desc])       
       legend(LEG)
    subplot(2,2,2)
       plot(OBSSTS(:,1),OBSSTS(:,2),strcat(col{i},':'))         
       mxS = max(mxS,max(OBSSTS(:,2)));
       hold on;
       axis([OBSMC(1,1) OBSMC(end,1) 0 mxS])
       xlabel('t (s)')
       ylabel('Conc (mg/l)')
       title(['STS:' '  ' desc])
       legend(LEG)
    subplot(2,2,3)
       plot(OBSHTS(:,1),OBSHTS(:,2),strcat(col{i},'--'))                
       mxH = max(mxH,max(OBSHTS(:,2)));
       hold on;
       axis([OBSMC(1,1) OBSMC(end,1) 0 mxH])
       xlabel('t (s)')           
       ylabel('Conc (mg/l)')
       title(['HTS:' '  ' desc])
       legend(LEG)
    subplot(2,2,4)
       plot(OBSMC(:,1),OBSMC(:,2),col{i})
       hold on;
       plot(OBSSTS(:,1),OBSSTS(:,2),strcat(col{i},':'))         
       plot(OBSHTS(:,1),OBSHTS(:,2),strcat(col{i},'--'))                
       axis([OBSMC(1,1) OBSMC(end,1) 0 mxM])
       title(['ALL:' '  ' desc])       
       xlabel('t (s)')      
       ylabel('Conc (mg/l)')
end    