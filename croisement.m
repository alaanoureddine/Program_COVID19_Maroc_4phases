function newpop=croisement(pop,peres,meres)
global pc N 
% Croisement de la populasion
% Arguments d'entree :
%   pop   : vecteur d x N
%   peres : vecteur 1 x N/2
%   meres : vecteur 1 x N/2
%   pc    : proba de croisement
newpop=[];
for i=1:N/2
    pere=pop(:,peres(i));
    mere=pop(:,meres(i));
    u=rand;
    if (u<pc) % sous proba pc
        [fils,fille]=croise(pere,mere);
        newpop=[newpop,fils,fille];
    else
        newpop=[newpop,pere,mere];
    end
end
