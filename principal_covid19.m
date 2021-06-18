% Principal COVID19 Maroc
clear al; clc;
global M N l L pc sigma nbgen dd dt Np
global m eps wp  np mp 

eps=0.1; wp=0.1923;  np=18.1*1e-3; mp=6.55*1e-3; Np=1000; % gamap=0.1724;;
N=90;    %% taille de la population 
pc=0.7;  %% probabilite de croisement
%pm=0.01;
sigma=0.5;
nbgen=50;
l=0.01; L=0.8;
data = xlsread('covidMAR_150321.xlsx');
y0=[np;np/2;wp*np/4;wp*np/4;0.0;np/4]';
%y0=[np;np/2;1/Np;0;0.0;1]';
INDS=[1,150,220,300];
INDF=[150,220,300,379]; 
for j=1:4
    [bp,bw,dp,k,c,gamap,COV]=AG_covid19(y0,data,INDS(j),INDF(j));
    y0=COV;
    figure,
    R0=calcul_R0(bp,bw,dp,k,c,gamap)
end
    

    