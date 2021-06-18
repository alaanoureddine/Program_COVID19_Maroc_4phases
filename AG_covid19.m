% identification de parametres dans le modele covid19
%clear al; close all; clc;
function [bp,bw,dp,k,c,gamap,COV]=AG_covid19(y0,data,Sind,Find)
global M N l L pc sigma nbgen dd dt Np
global m eps wp  np mp 
eps=0.1; wp=0.1923;  np=18.1*1e-3; mp=5*1e-3; Np=90000; % gamap=0.1724;
N=40;    %% taille de la population 
pc=0.7;  %%probabilite de croisement
%pm=0.01;
sigma=0.5;
nbgen=20;
l=0.01; L=0.8;
%y0=[np;np/2;wp*np/4;wp*np/4;0.0;np/4]';
%y0=zeros(6,1)';
%A_obs=vecteur des observations des individus Infectes 
data = xlsread('covidMAR_150321.xlsx');
A_obs=data(Sind:Find,1)/Np; %A_obs/sum(A_obs);
%A_obs=[10,9,23,10,19,28,27,55,50,70,57,77,77,61,37,54,83,67];
M=size(A_obs,1); dt=1;  % M=nombre de jours de la simulation dt= jours
dd=6; % nombre de parametres a identifier
m=6;  % nombre d equations dans le modele
%generation
pop=randpop(N,dd,l,L);     % dd lignes , N colonnes 
%%
% Les inconnues sont np, mp, bp, bw
%%

%boucle sur les generations
for g=1:nbgen
    %hold on
    scores=fitness(pop,y0,A_obs);  
    %% graphe  
    %graphe (g,scores);   
    %% selection (roue de la fortune)
    [peres,meres]=selection(scores);   
    %% Croisements (moyenne)
	 newpop=croisement(pop,peres,meres);
	%% Mutations (remplacement d'un individu par un aleatoire) 
     pm=.15+.33/g;
     newpop=mutation(pop,pm);
     %newpop=mutation_new(newpop,pm,l,L);
     popp=[pop,newpop];  
    %% Triers parmis les deux pop obtenues les meilleurs individus 
     pop=NewP_new(popp,y0,A_obs);
end
% title('Historique de convergence');
% xlabel('generation');
% ylabel('score');
%determination du meilleur individu
  K=pop(1,:);
  C=pop(2,:);
  Bp=pop(3,:);
  Bw=pop(4,:);
  Dp=pop(5,:);
  Gp=pop(6,:);
 % construction de scores        
scores=fitness(pop,y0,A_obs);
[S,I]=max(scores);
disp('Meilleur individu:')
disp(pop(:,I))
disp('valeur de la fonction objectif:')
disp(-1+(1/S))
k=K(I); c=C(I); bp=Bp(I); bw=Bw(I); dp=Dp(I); gamap=Gp(I);
[covid]=covid19(y0,bp,bw,dp,k,c,gamap);
COV=covid(end,:);
%figure,
hold on
plot(Sind:Find,covid(:,3)+covid(:,4),'r','Linewidth',2)
plot(Sind:Find,A_obs,'b');

