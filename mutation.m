function newpop=mutation(pop,pm)
global sigma l L N dd
	% Mutation de la population par perturbation gaussienne
	% Arguments d'entres :
	%  pop   : vecteur d x N decrivant la population
	%  pm    : vecteur 1 x 1 probabilite de mutation
	%  sigma : Ecart-type pour la gaussienne

	newpop=pop; 
	for i=1:N
        u=rand(1,1); 
	    if (u<pm) % sous proba pm 
	    ss=newpop(:,i) + sigma*rand(dd,1); 
	        if (ss>=l) & (ss<=L) 
             newpop(:,i)=ss; 
	        end 
	    end 
	end 
end