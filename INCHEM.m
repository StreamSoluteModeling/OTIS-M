%!**********************************************************************
%
%     Subroutine INPUT5               Called by: INPUT
%
%     read the sorption parameters
%
%***********************************************************************
%     Read the sorption parameters for each reach and solute.  Note that
%     the parameter RHO is always multiplied by LAMHAT -- therefore do
%     the multiplication here and store in RHOLAM.  Fill vectors with
%     reach values.
%
disp('Loading Chemistry Data')
cd (CF);
chemistry=load('CHEMISTRY.txt'); %LAMBDA LAMBDA2 LAMBDA3 LAMHAT LAMHAT2 LAMHAT3
                       %RHO KD  CSBACK CSBACK3
cd (WF);                   
ILAMBDA = chemistry(:,1);
ILAMBDA2 = chemistry(:,2);
ILAMBDA3 = chemistry(:,3);
ILAMHAT = chemistry(:,4);
ILAMHAT2 = chemistry(:,5);
ILAMHAT3 = chemistry(:,6);
IRHO = chemistry(:,7);
IKD = chemistry(:,8);
ICSBACK = chemistry(:,9);
ICSBACK3 = chemistry(:,10);

NSOLUTE = size(chemistry,1)/NREACH;
I = 1;
LAMBDA=zeros(IMAX,NSOLUTE);
LAMBDA2=zeros(IMAX,NSOLUTE);
LAMBDA3=zeros(IMAX,NSOLUTE);
LAMHAT=zeros(IMAX,NSOLUTE);
LAMHAT2=zeros(IMAX,NSOLUTE);
LAMHAT3=zeros(IMAX,NSOLUTE);
RHO=zeros(IMAX,NSOLUTE);
RHOLAM=zeros(IMAX,NSOLUTE);
KD=zeros(IMAX,NSOLUTE);
CSBACK=zeros(IMAX,NSOLUTE);
CSBACK3=zeros(IMAX,NSOLUTE);
for Reach = 1:NREACH
    for Seg = I:LASTSEG(Reach)
        for Sol = 1:NSOLUTE
            LAMBDA(Seg,Sol) = ILAMBDA(Reach*Sol);
            LAMBDA2(Seg,Sol) = ILAMBDA2(Reach*Sol);
            LAMBDA3(Seg,Sol) = ILAMBDA3(Reach*Sol);
            LAMHAT(Seg,Sol) = ILAMHAT(Reach*Sol);
            LAMHAT2(Seg,Sol) = ILAMHAT2(Reach*Sol);
            LAMHAT3(Seg,Sol) = ILAMHAT3(Reach*Sol);
            RHO(Seg,Sol)=IRHO(Reach*Sol);
            RHOLAM(Seg,Sol) = IRHO(Reach*Sol)*ILAMHAT(Reach*Sol);
            KD(Seg,Sol) = IKD(Reach*Sol);
            CSBACK(Seg,Sol) = ICSBACK(Reach*Sol);
            CSBACK3(Seg,Sol) = ICSBACK3(Reach*Sol);
        end;
    end;
    I = LASTSEG(Reach)+1;
end;