function [peres,meres]=selection(scores)

m=length(scores);
prb=cumsum(scores)/sum(scores);
peres=[ ];
meres=[ ];
	for i=1:m/2
		 u=rand(1,1);
		 peres=[peres,min(find(prb>u))] ;
		 u=rand(1,1);
		 meres= [meres,min(find(prb>u))] ;
	end
end
