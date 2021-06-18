function scores=fitness(pop,y0,A_obs)
global N dt
  K=pop(1,:);
  C=pop(2,:);
  Bp=pop(3,:);
  Bw=pop(4,:);
  Dp=pop(5,:);
  Gp=pop(6,:);
  % construction de scores       %evaluation
                                 %scores=fobj(pop);
      for i=1:N
        k=K(i); c=C(i); bp=Bp(i); bw=Bw(i); deltap=Dp(i); gamap=Gp(i);
        [covid]=covid19(y0,bp,bw,deltap,k,c,gamap);
        A=covid(:,3)+ covid(:,4);
        r=dt*sum((A-A_obs).*(A-A_obs))/2;
        scores(i)=1/(1+r);
      end
end