function [fils,fille]=croise(pere,mere)
% Croisement par moyennes
% Arguments d'entree :
%   pere, mere  : vecteurs d x N/2 des parents
% Arguments de sortie :
%   fils, fille : vecteurs d x N/2 des enfants
u=1/3;
fils = floor(u*pere+(1-u)*mere);
fille = floor((1-u)*pere+u*mere);

%end