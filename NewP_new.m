function Parent=NewP_new(pop,y0,A_obs)
Nd=size(pop,2);
global  dd
NN=Nd/2;
Parent=zeros(dd,NN);
  K=pop(1,:);
  C=pop(2,:);
  Bp=pop(3,:);
  Bw=pop(4,:);
  Dp=pop(5,:);
  Gp=pop(6,:);
 scores=zeros(1,Nd); % calculates population cost using
 for i=1:Nd
        %vh=sida(n(i),s(i),d(i),b(i));
        k=K(i); c=C(i); bp=Bp(i); bw=Bw(i); deltap=Dp(i); gamap=Gp(i);
        [covid]=covid19(y0,bp,bw,deltap,k,c,gamap);
        A=covid(:,3)+ covid(:,4);
        r=sum((A-A_obs).*(A-A_obs))/2;
        %r=max(abs(A-A_obs));
        scores(i)=1/(1+r);
  end
      
   for i=1:NN
    [t,j]=max(scores); 
    Parent(:,i)=pop(:,j);
    scores(j)=-1e10;
   end
end
