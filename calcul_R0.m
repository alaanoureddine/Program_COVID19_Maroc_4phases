function R0=calcul_R0(bp,bw,dp,k,c,gamap)
%cas de la chine: np = mp = 0.0018; wp = wprim = 0.1923 ; bp=
% gamap=0.1724; k=0.5; c=0.5; dp=0.5; bp=0.2; bw=0.1
global wp np mp 
a= wp/((wp + mp)*(gamap +mp));
e=np/mp;
R1=bp*e*(1-dp)*a;
R2=k*bp*e*dp*a;
R3=bw*e*(1-dp)*a; 
R4=bw*e*c*dp*a;
R0=R1+R2+R3+R4;