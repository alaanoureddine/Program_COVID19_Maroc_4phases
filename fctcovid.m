function Y=fctcovid(y,bp,bw,deltap,k,c,gamap)
global m eps wp np mp
Y=zeros(m,1);
Y1=np-mp*y(1)- bp*y(1)*(y(3)+k*y(4)) - bw*y(1)*y(6); 
Y2=bp*y(1)*(y(3)+k*y(4)) + bw*y(1)*y(6) - (1-deltap)*bw*y(2) -mp*y(2);
Y3=(1-deltap)*wp*y(2) - (gamap+mp)*y(3);
Y4=deltap*wp*y(2)- (deltap+mp)*y(4);
Y5=gamap*y(3) + gamap*y(4) -mp*y(5);
Y6= eps*(y(3) + c*y(4) - y(6));
Y=[Y1;Y2;Y3;Y4;Y5;Y6]';
end
