function [covid]=covid19(y0,bp,bw,deltap,k,c,gamap)
global m M dt
covid=zeros(M,m);
covid(1,:)=y0; 
for j=1:M-1 
    y=covid(j,:);
    k1=fctcovid(y,bp,bw,deltap,k,c,gamap) ;
    y1=y+0.5*dt*k1;
    k2=fctcovid(y1,bp,bw,deltap,k,c,gamap);
    y2=y+0.5*dt*k2;
    k3=fctcovid(y2,bp,bw,deltap,k,c,gamap);
    y3=y+dt*k3;
    k4=fctcovid(y3,bp,bw,deltap,k,c,gamap);
    covid(j+1,:)=y+(1/6)*(k1+2*k2+2*k3+k4)*dt;            
end
end
