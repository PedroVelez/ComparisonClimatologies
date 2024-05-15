close all
clear all
clc

ipthe=16: 40; % 310 -  790 Dbar Thermocline
ipint=41: 91; % 810 - 1810 Dbar Intermediate
ipuna=88:101; %1750 - 2000 Dbar Upper NADW
iptot=31: 91; % 600 - 1800

ilW=43:92; %West
ilE= 1:52;  %East 49W 23.5W
ilE= 4:44;  %East 45W 25W

jpCLI=10; %24.5N
ipCLI =[23:114];%-69.0000  -23.5000
ip1957=[ 9: 28];
ip1981=[ 7: 65];
ip1992=[17: 88];
ip1998=[22: 89];
ip2004=[41:103];
ipArgo=[16:107];

ianho=5
HB=load('./HidroBase/HydroBase.mat');
ianho=ianho+1;
anho(ianho)=2006;
nombre{ianho}='HB';
lonA=ones(101,1)*fliplr(HB.lonCLI(ipCLI));
latA=lonA*0+24.5;
temA=fliplr(squeeze(HB.temCLI(jpCLI,ipCLI,:))');
salA=fliplr(squeeze(HB.salCLI(jpCLI,ipCLI,:))');
preA=HB.preCLI*ones(size(salA,2),1)';
temA=sw_ptmp(salA,temA,preA,0);
tems(:,:,ianho)=temA;
sals(:,:,ianho)=salA;
clear lonA latA temA salA preA

L94=load('./Levitus/WOA94.mat');
ianho=ianho+1;
anho(ianho)=1994;
nombre{ianho}='L94';
lonA=ones(101,1)*fliplr(L94.lonL94(ipCLI));
latA=lonA*0+24.5;
temA=fliplr(squeeze(L94.temL94(jpCLI,ipCLI,:))');
salA=fliplr(squeeze(L94.salL94(jpCLI,ipCLI,:))');
preA=HB.preCLI*ones(size(salA,2),1)';
temA=sw_ptmp(salA,temA,preA,0);
tems(:,:,ianho)=temA;
sals(:,:,ianho)=salA;
clear lonA latA temA salA preA

L98=load('./Levitus/WOA98.mat');
ianho=ianho+1;
anho(ianho)=1998;
nombre{ianho}='L98';
lonA=ones(101,1)*fliplr(L98.lonCLI(ipCLI));
latA=lonA*0+24.5;
temA=fliplr(squeeze(L98.temCLI(jpCLI,ipCLI,:))');
salA=fliplr(squeeze(L98.salCLI(jpCLI,ipCLI,:))');
preA=HB.preCLI*ones(size(salA,2),1)';
temA=sw_ptmp(salA,temA,preA,0);
tems(:,:,ianho)=temA;
sals(:,:,ianho)=salA;
clear lonA latA temA salA preA

L05=load('./Levitus/WOA05.mat');
ianho=ianho+1;
anho(ianho)=2005;
nombre{ianho}='L05';
lonA=ones(101,1)*fliplr(L05.lonCLI(ipCLI));
latA=lonA*0+24.5;
temA=fliplr(squeeze(L05.temCLI(jpCLI,ipCLI,:))');
salA=fliplr(squeeze(L05.salCLI(jpCLI,ipCLI,:))');
preA=HB.preCLI*ones(size(salA,2),1)';
temA=sw_ptmp(salA,temA,preA,0);
tems(:,:,ianho)=temA;
sals(:,:,ianho)=salA;

file='../CTDData/Data24N/1957';load(file)
anho(1)=1957;
nombre{1}='1957';
lats1957=lats1957(:,ip1957);
lons1957=lons1957(:,ip1957);
pres1957=pres1957(:,ip1957);
tems1957=tems1957(:,ip1957);
sals1957=sals1957(:,ip1957);
tems1957=sw_ptmp(sals1957,tems1957,pres1957,0);
tems(:,:,1)= interp2(lons1957,pres1957,tems1957,lonA,preA);
sals(:,:,1)= interp2(lons1957,pres1957,sals1957,lonA,preA);

file='../CTDData/Data24N/1981';load(file)
anho(2)=1981;
nombre{2}='1981';
lats1981=lats1981(:,ip1981);
lons1981=lons1981(:,ip1981);
pres1981=pres1981(:,ip1981);
tems1981=tems1981(:,ip1981);
sals1981=sals1981(:,ip1981);
tems1981=sw_ptmp(sals1981,tems1981,pres1981,0);
tems(:,:,2)= interp2(lons1981,pres1981,tems1981,lonA,preA);
sals(:,:,2)= interp2(lons1981,pres1981,sals1981,lonA,preA);

file='../CTDData/Data24N\WOCEA05';load(file)
anho(3)=1992;
nombre{3}='1992 WOCEA05';
latsA05=latsA05(:,ip1992);
lonsA05=lonsA05(:,ip1992);
presA05=presA05(:,ip1992);
temsA05=temsA05(:,ip1992);
salsA05=salsA05(:,ip1992);
temsA05=sw_ptmp(salsA05,temsA05,presA05,0);
tems(:,:,3)= interp2(lonsA05,presA05,temsA05,lonA,preA);
sals(:,:,3)= interp2(lonsA05,presA05,salsA05,lonA,preA);


file='../CTDData/Data24N\WOCEAR01';load(file)
anho(4)=1998;
nombre{4}='1998 WOCEAR01';
latsAR01=latsAR01(:,ip1998);
lonsAR01=lonsAR01(:,ip1998);
presAR01=presAR01(:,ip1998);
temsAR01=temsAR01(:,ip1998);
salsAR01=salsAR01(:,ip1998);
temsAR01=sw_ptmp(salsAR01,temsAR01,presAR01,0);
tems(:,:,4)= interp2(lonsAR01,presAR01,temsAR01,lonA,preA);
sals(:,:,4)= interp2(lonsAR01,presAR01,salsAR01,lonA,preA);

file='../CTDData/Data24N/2004';load(file)
anho(5)=2004;
nombre{5}='2004 RAPID';
lats2004=fliplr(lats2004(:,ip2004));
lons2004=fliplr(lons2004(:,ip2004));
pres2004=fliplr(pres2004(:,ip2004));
tems2004=fliplr(tems2004(:,ip2004));
sals2004=fliplr(sals2004(:,ip2004));
tems2004=sw_ptmp(sals2004,tems2004,pres2004,0);
tems(:,:,5)= interp2(lons2004,pres2004,tems2004,lonA,preA);
sals(:,:,5)= interp2(lons2004,pres2004,sals2004,lonA,preA);

ind=1:size(tems,3);
for i=ind
    temtheE(:,i)=nanmean(tems(ipthe,ilE,i));
    temintE(:,i)=nanmean(tems(ipint,ilE,i));
    temunaE(:,i)=nanmean(tems(ipuna,ilE,i));
    temtotE(:,i)=nanmean(tems(iptot,ilE,i));
    mtemtheE(i)=nanmean(temtheE(:,i));
    mtemintE(i)=nanmean(temintE(:,i));
    mtemunaE(i)=nanmean(temunaE(:,i));
    mtemtotE(i)=nanmean(temtotE(:,i));
    saltheE(:,i)=nanmean(sals(ipthe,ilE,i));
    salintE(:,i)=nanmean(sals(ipint,ilE,i));
    salunaE(:,i)=nanmean(sals(ipuna,ilE,i));
    saltotE(:,i)=nanmean(sals(iptot,ilE,i));
    saltheW(:,i)=nanmean(sals(ipthe,ilW,i));
    salintW(:,i)=nanmean(sals(ipint,ilW,i));
    salunaW(:,i)=nanmean(sals(ipuna,ilW,i));
    saltotW(:,i)=nanmean(sals(iptot,ilW,i));
    msaltheE(i)=nanmean(saltheE(:,i));
    msalintE(i)=nanmean(salintE(:,i));
    msalunaE(i)=nanmean(salunaE(:,i));
    msaltotE(i)=nanmean(saltotE(:,i));
    temtheW(:,i)=nanmean(tems(ipthe,ilW,i));
    temintW(:,i)=nanmean(tems(ipint,ilW,i));
    temunaW(:,i)=nanmean(tems(ipuna,ilW,i));
    temtotW(:,i)=nanmean(tems(iptot,ilW,i));
    mtemtheW(i)=nanmean(temtheW(:,i));
    mtemintW(i)=nanmean(temintW(:,i));
    mtemunaW(i)=nanmean(temunaW(:,i));
    mtemtotW(i)=nanmean(temtotW(:,i));
    saltheW(:,i)=nanmean(sals(ipthe,ilW,i));
    salintW(:,i)=nanmean(sals(ipint,ilW,i));
    salunaW(:,i)=nanmean(sals(ipuna,ilW,i));
    saltotW(:,i)=nanmean(sals(iptot,ilW,i));
    msaltheW(i)=nanmean(saltheW(:,i));
    msalintW(i)=nanmean(salintW(:,i));
    msalunaW(i)=nanmean(salunaW(:,i));
    msaltotW(i)=nanmean(saltotW(:,i));
    temthe(:,i)=nanmean(tems(ipthe,:,i));
    temint(:,i)=nanmean(tems(ipint,:,i));
    temuna(:,i)=nanmean(tems(ipuna,:,i));
    temtot(:,i)=nanmean(tems(iptot,:,i));
    mtemthe(i)=nanmean(temthe(:,i));
    mtemint(i)=nanmean(temint(:,i));
    mtemuna(i)=nanmean(temuna(:,i));
    mtemtot(i)=nanmean(temtot(:,i));
    salthe(:,i)=nanmean(sals(ipthe,:,i));
    salint(:,i)=nanmean(sals(ipint,:,i));
    saluna(:,i)=nanmean(sals(ipuna,:,i));
    saltot(:,i)=nanmean(sals(iptot,:,i));
    msalthe(i)=nanmean(salthe(:,i));
    msalint(i)=nanmean(salint(:,i));
    msaluna(i)=nanmean(saluna(:,i));
    msaltot(i)=nanmean(saltot(:,i));
end
%Calculo las diferencias respecto de 1957 y calculo intervalos de confianza
disp(sprintf('Upper Ocean tendencies respect 1957'))
for i=1:size(temtot,2)-1
    dtemtot(:,i)=round(temtot(:,i)*100)/100-round(temtot(:,1)*100)/100;
    danho(i)=anho(i)-anho(1);
    dmtemtot(i)=nanmean(dtemtot(:,i));
    [th,tp,tci]=ttest(dtemtot(:,i),0,0.05); %Verifico respecto de la hipotesis nula de que no hy calentamiento ni enfriamineto
    h(i)=th;
    p(i)=tp;
    ci1(i)=tci(1);
    ci2(i)=tci(2);
    disp(sprintf('%4d-1957  %4.2f (%4.2f %4.2f) Reject null hypotehsis %1.0f',anho(i),dmtemtot(i),ci1(i),ci2(i),h(i)))
end
disp(sprintf('Thermocline tendencies respect 1957'))
for i=1:size(temtot,2)-1
    dtemthe(:,i)=round(temthe(:,i)*100)/100-round(temthe(:,1)*100)/100;
    danho(i)=anho(i)-anho(1);
    dmtemthe(i)=nanmean(dtemthe(:,i));
    [th,tp,tci]=ttest(dtemthe(:,i),0,0.05); %Verifico respecto de la hipotesis nula de que no hy calentamiento ni enfriamineto
    h(i)=th;
    p(i)=tp;
    ci1(i)=tci(1);
    ci2(i)=tci(2);
    disp(sprintf('%4d-1957  %4.2f (%4.2f %4.2f) Reject null hypotehsis %1.0f',anho(i),dmtemthe(i),ci1(i),ci2(i),h(i)))
end
disp(sprintf('Intermediate tendencies respect 1957'))
for i=1:size(temtot,2)-1
    dtemint(:,i)=round(temint(:,i)*100)/100-round(temint(:,1)*100)/100;
    danho(i)=anho(i)-anho(1);
    dmtemint(i)=nanmean(dtemint(:,i));
    [th,tp,tci]=ttest(dtemint(:,i),0,0.05); %Verifico respecto de la hipotesis nula de que no hy calentamiento ni enfriamineto
    h(i)=th;
    p(i)=tp;
    ci1(i)=tci(1);
    ci2(i)=tci(2);
    disp(sprintf('%4d-1957  %4.2f (%4.2f %4.2f) Reject null hypotehsis %1.0f',anho(i),dmtemint(i),ci1(i),ci2(i),h(i)))
end
%Calculo las diferencias respecto de 1998 y calculo intervalos de confianza
disp(sprintf('Upper Ocean tendencies respect 1998'))
for i=1:size(temtot,2)-1
    dtemtot(:,i)=round(temtot(:,i)*100)/100-round(temtot(:,4)*100)/100;
    danho(i)=anho(i)-anho(1);
    dmtemtot(i)=nanmean(dtemtot(:,i));
    [th,tp,tci]=ttest(dtemtot(:,i),0,0.05); %Verifico respecto de la hipotesis nula de que no hy calentamiento ni enfriamineto
    h(i)=th;
    p(i)=tp;
    ci1(i)=tci(1);
    ci2(i)=tci(2);
    disp(sprintf('%4d-1998  %4.2f (%4.2f %4.2f) Reject null hypotehsis %1.0f',anho(i),dmtemtot(i),ci1(i),ci2(i),h(i)))
end
disp(sprintf('Thermocline tendencies respect 1998'))
for i=1:size(temtot,2)-1
    dtemthe(:,i)=round(temthe(:,i)*100)/100-round(temthe(:,4)*100)/100;
    danho(i)=anho(i)-anho(1);
    dmtemthe(i)=nanmean(dtemthe(:,i));
    [th,tp,tci]=ttest(dtemthe(:,i),0,0.05); %Verifico respecto de la hipotesis nula de que no hy calentamiento ni enfriamineto
    h(i)=th;
    p(i)=tp;
    ci1(i)=tci(1);
    ci2(i)=tci(2);
    disp(sprintf('%4d-1998  %4.2f (%4.2f %4.2f) Reject null hypotehsis %1.0f',anho(i),dmtemthe(i),ci1(i),ci2(i),h(i)))
end
disp(sprintf('Intermediate tendencies respect 1998'))
for i=1:size(temtot,2)-1
    dtemint(:,i)=round(temint(:,i)*100)/100-round(temint(:,4)*100)/100;
    danho(i)=anho(i)-anho(1);
    dmtemthe(i)=nanmean(dtemint(:,i));
    [th,tp,tci]=ttest(dtemint(:,i),0,0.05); %Verifico respecto de la hipotesis nula de que no hy calentamiento ni enfriamineto
    h(i)=th;
    p(i)=tp;
    ci1(i)=tci(1);
    ci2(i)=tci(2);
    disp(sprintf('%4d-1998  %4.2f (%4.2f %4.2f) Reject null hypotehsis %1.0f',anho(i),dmtemint(i),ci1(i),ci2(i),h(i)))
end
for i=1:size(temtot,2)-1
    dtemsT(:,:,i)=tems(:,:,i+1)-tems(:,:,1);
    dsalsT(:,:,i)=sals(:,:,i+1)-sals(:,:,1);
    dtemsE(:,:,i)=tems(:,ilE,i+1)-tems(:,ilE,1);
    dsalsE(:,:,i)=sals(:,ilE,i+1)-sals(:,ilE,1);
    dtemsW(:,:,i)=tems(:,ilW,i+1)-tems(:,ilW,1);
    dsalsW(:,:,i)=sals(:,ilW,i+1)-sals(:,ilW,1);
end

for i1=1:size(temtot,2)-1
    for i2=1:101
        msalsT(i2,i1)=nanmean(dsalsT(i2,:,i1));
        mtemsT(i2,i1)=nanmean(dtemsT(i2,:,i1));
        mpresT(i2)=nanmean(preA(i2,:));
        msalsE(i2,i1)=nanmean(dsalsE(i2,:,i1));
        mtemsE(i2,i1)=nanmean(dtemsE(i2,:,i1));
        mpresE(i2)=nanmean(preA(i2,:));
    end
end

figure(1)
plot(mtemsT(:,2),-mpresT(:),'g','linewidth',2.0);grid on;hold on
plot(mtemsT(:,3),-mpresT(:),'r','linewidth',2.0);grid on;hold on
plot(mtemsT(:,4),-mpresT(:),'m','linewidth',2.0)
plot(mtemsT(:,5),-mpresT(:),'b','linewidth',2.0)
plot(mtemsT(:,6),-mpresT(:),'k','linewidth',2.0)
plot(mtemsT(:,7),-mpresT(:),'c','linewidth',2.0)
plot(mtemsT(:,8),-mpresT(:),'y','linewidth',2.0)
hl=legend(strcat(nombre{2+1},'-',nombre{1}),...
          strcat(nombre{3+1},'-',nombre{1}),...
          strcat(nombre{4+1},'-',nombre{1}),...
          strcat(nombre{5+1},'-',nombre{1}),...
strcat(nombre{6+1},'-',nombre{1}),...          
strcat(nombre{7+1},'-',nombre{1}),...          
strcat(nombre{8+1},'-',nombre{1}),...          
'interpreter','none','fontsize',10,'FontName','Arial','FontWeight','bold','location','SouthWest','boxoff');
title('Absolute zonally averaged temperature differences at 24.5ºN (-70ºW -23ºW)','FontSize',10,'Fontweight','bold','FontName','Arial','interpreter','none')
set(gca,'XTick',[-0.5 -0.4 -0.3 -0.2 -0.1 0 0.1 0.2 0.3 0.4 0.5 ])
axis([-0.5 0.5 -2000 -200])

% figure(2)
% %Totales
% plot(mtemsT(:,4),-mpresT(:),'k','linewidth',2.0);grid on;hold on
% plot(mtemsT(:,5),-mpresT(:),'g','linewidth',2.0);grid on;hold on
% plot(mtemsT(:,6),-mpresT(:),'c','linewidth',2.0);grid on;hold on
% plot(mtemsT(:,7),-mpresT(:),'c:','linewidth',2.0);grid on;hold on
% plot(mtemsT(:,8),-mpresT(:),'c--','linewidth',2.0);grid on;hold on
% plot(mtemsT(:,9),-mpresT(:),'c-.','linewidth',2.0);grid on;hold on
% plot(mtemsT(:,10),-mpresT(:),'y','linewidth',2.0);grid on;hold on
% plot(mtemsT(:,11),-mpresT(:),'y:','linewidth',2.0);grid on;hold on
% plot(mtemsT(:,12),-mpresT(:),'r','linewidth',2.0);grid on;hold on
% plot(mtemsT(:,13),-mpresT(:),'r:','linewidth',2.0);grid on;hold on
% plot(mtemsT(:,14),-mpresT(:),'b','linewidth',2.0);grid on;hold on
% hl=legend(strcat(nombre{4+1},'-',nombre{1}),...
%           strcat(nombre{5+1},'-',nombre{1}),...
%           strcat(nombre{6+1},'-',nombre{1}),...
%           strcat(nombre{7+1},'-',nombre{1}),...
%           strcat(nombre{8+1},'-',nombre{1}),...
%           strcat(nombre{9+1},'-',nombre{1}),...
%           strcat(nombre{10+1},'-',nombre{1}),...
%           strcat(nombre{11+1},'-',nombre{1}),...
%           strcat(nombre{12+1},'-',nombre{1}),...
%           strcat(nombre{13+1},'-',nombre{1}),...
%           strcat(nombre{14+1},'-',nombre{1}),...
%          'interpreter','none','fontsize',10,'FontName','Arial','FontWeight','bold','location','SouthWest','boxoff');
% title('Absolute zonally averaged temperature differences at 24.5ºN (-70ºW -23ºW)','FontSize',10,'Fontweight','bold','FontName','Arial','interpreter','none')
% set(gca,'XTick',[-0.5 -0.4 -0.3 -0.2 -0.1 0 0.1 0.2 0.3 0.4 0.5 ])
% axis([-0.5 0.5 -2000 -200])

figure(3)
subplot(3,2,1)
h1=plot(anho,mtemtot,'ko-','linewidth',2.0,'MarkerSize',2);grid on;hold on
h2=plot(anho,mtemtotE,'ro-','MarkerSize',2);
h3=plot(anho,mtemtotW,'bo-','MarkerSize',2);
axis([1955 2007 -inf inf])
title('Mean temperature')
ylabel('600-1800 dbar')
subplot(3,2,3)
plot(anho,mtemthe,'ko-','linewidth',2.0,'MarkerSize',2);grid on;hold on
plot(anho,mtemtheE,'ro-','MarkerSize',2);
plot(anho,mtemtheW,'bo-','MarkerSize',2);
axis([1955 2007 -inf inf])
ylabel('300-800 dbar')
subplot(3,2,5)
plot(anho,mtemint,'ko-','linewidth',2.0,'MarkerSize',2);grid on;hold on
plot(anho,mtemintE,'ro-','MarkerSize',2);
plot(anho,mtemintW,'bo-','MarkerSize',2);
axis([1955 2007 -inf inf])
ylabel('800-1800 dbar')


subplot(3,2,2)
plot(anho,msaltot,'ko-','linewidth',2.0,'MarkerSize',2);grid on;hold on
plot(anho,msaltotE,'ro-','MarkerSize',2);
plot(anho,msaltotW,'bo-','MarkerSize',2);
axis([1955 2005 -inf inf])
axis([1955 2007 -inf inf])
title('Mean salinity')
subplot(3,2,4)
plot(anho,msalthe,'ko-','linewidth',2.0,'MarkerSize',2);grid on;hold on
plot(anho,msaltheE,'ro-','MarkerSize',2);
plot(anho,msaltheW,'bo-','MarkerSize',2);
axis([1955 2007 -inf inf])
subplot(3,2,6)
plot(anho,msalint,'ko-','linewidth',2.0,'MarkerSize',2);grid on;hold on
plot(anho,msalintE,'ro-','MarkerSize',2);
plot(anho,msalintW,'bo-','MarkerSize',2);
axis([1955 2007 -inf inf])

orient landscape
CreaFigura(1,'ComparaArgoHydro',2)
CreaFigura(3,'MeanTemp',2)


for i=1:size(tems,3)
    t=tems(iptot,:,i);
    disp(sprintf('%s %6.4f',nombre{i},nanmean(t(:))))
end