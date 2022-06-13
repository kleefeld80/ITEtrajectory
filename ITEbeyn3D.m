function eigi=ITEbeyn3D(n,mux,muy,RA,RB,ior)
    eigi=[];
    NN=1;
    m=NN;
    
    f=@(k)-sqrt(ior)*sbesselj(n,k)*sbesseljp(n,k*sqrt(ior))+sbesseljp(n,k)*sbesselj(n,k*sqrt(ior));
     
    N=50;         
    tolrank=1e-4;
    phi=@(t)mux+RA*cos(t)+RB*sin(t)*1i+muy*1i;
    phip=@(t)-RA*sin(t)+RB*cos(t)*1i;
   
    l=1;
    true=1;
    K=8;
    As=zeros(1,2*K);
    while true
        V=1;
        for j=0:N-1
            tj=2*j*pi/N;
            
            Tzinv=1/f(phi(tj));
            
            part1=Tzinv*V*phip(tj);
            for t=0:2*K-1
                As(t+1)=As(t+1)+part1*phi(tj)^t;
            end
        end
        As=As/(1i*N);
        for p=1:K
            for q=1:K
                B0(p,q)=As(1,p+q-1); %#ok<AGROW>
                B1(p,q)=As(1,p+q);   %#ok<AGROW>
            end
        end
        
        [V,S,W]=svd(B0);
        k=rank(S,tolrank);
        if (k==K*l)
           l=l+1;
        else
            V0=V(1:K*m,1:k);
            W0=W(1:K*l,1:k);
            S0=S(1:k,1:k);
            B=(V0'*B1*W0)/S0;
            eigen=eigs(B); %#ok<NASGU>
            true=0;
            format long
        end
    end
    eigi=eigen(abs(eigen-(mux+muy*1i))<RA); %#ok<UNRCH>
end

function z=sbesselj(n,x)
    z=sqrt(pi./(2*x)).*besselj(n+0.5,x);
end

function z=sbesseljp(n,x)
    z=n*(1./x).*sbesselj(n,x)-sbesselj(n+1,x); 
end
