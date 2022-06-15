function [k_m,sigma_min]=MFS_ITE_ellipsoid(m,init,R_S,n)
% Fibonacci sphere points

format long;

% Parameters fpr the ellipsoid
a=1.0;
b=1.0;
c=1.2;

% Parameters to be set
m_I=20;
R_I=0.5;

% Boundary collocation points% 
P=2*m+1;
Phi=(1+sqrt(5))/2;
boundary = zeros(3,P);
normals = zeros(3,P);
for i=-m:1:m
    lon = 2*pi*i/Phi;
    lat = asin(2*i/P);
    x=a*cos(lon)*cos(lat);
    y=b*sin(lon)*cos(lat);
    z=c*sin(lat);
    boundary(1,i+m+1) = x;
    boundary(2,i+m+1) = y;
    boundary(3,i+m+1) = z;
    
    % Normal vectors along boundary
    nx=x/a^2;
    ny=y/b^2;
    nz=z/c^2;
    len=sqrt(nx*nx+ny*ny+nz*nz);
    normals(1,i+m+1)=nx/len;
    normals(2,i+m+1)=ny/len;
    normals(3,i+m+1)=nz/len;
end

% Source points 
sources = R_S * boundary;

% interior points
P_I=2*m_I+1;
Phi=(1+sqrt(5))/2;
interior = zeros(3,P_I);
for i=-m_I:1:m_I
    lon = 2*pi*i/Phi;
    lat = asin(2*i/P_I);
    interior(1,i+m_I+1) = R_I*cos(lon)*cos(lat);
    interior(2,i+m_I+1) = R_I*sin(lon)*cos(lat);
    interior(3,i+m_I+1) = R_I*sin(lat);
end

 f_tmp=@(kappa) (f(kappa,P,P_I,interior,boundary,sources,normals,n)); 
 [k_m,sigma_min]=fminsearch(f_tmp,init,optimset('TolX',1e-16));
end

function s=f(lambivec,m,m_I,pts_I,pts_B,pts_S,normals,n)
    lambi=lambivec(1)+lambivec(2)*1i;
    if(lambi==0)
        s=0;
        return
    end
    %if lambivec(2)<0.02    % Uncomment, if real-valued ITEs are thought
    %    s=100;
    %    return
    %end

    % Setup up the interior Dirichlet boundary matrix 
    M_D_i=zeros(m,m);
    for i=1:m
      for j=1:m
        M_D_i(i,j)=kernelHelmholtz(pts_B(:,i),pts_S(:,j),lambi);
      end
    end      
    
    % Setup up the exterior Dirichlet boundary matrix 
    M_D_e=zeros(m,m);
    for i=1:m
      for j=1:m
        M_D_e(i,j)=kernelHelmholtz(pts_B(:,i),pts_S(:,j),sqrt(n)*lambi);
      end
    end  
    
    % Setup up the interior Neumann boundary matrix 
    M_N_i=zeros(m,m);
    for i=1:m
      for j=1:m
        M_N_i(i,j)=nabla_kernelHelmholtz(pts_B(:,i),pts_S(:,j),lambi)*normals(:,i);
      end
    end      
    
    % Setup up the exterior Neumann boundary matrix 
    M_N_e=zeros(m,m);
    for i=1:m
      for j=1:m
        M_N_e(i,j)=nabla_kernelHelmholtz(pts_B(:,i),pts_S(:,j),sqrt(n)*lambi)*normals(:,i);
      end
    end      
    
    % Setup up the interior points of interior domain 
    M_I_i=zeros(m_I,m);
    for i=1:m_I
      for j=1:m
        M_I_i(i,j)=kernelHelmholtz(pts_I(:,i),pts_S(:,j),lambi);
      end
    end
    
    % Setup up the interior points of exterior domain 
    M_I_e=zeros(m_I,m);
    for i=1:m_I
      for j=1:m
        M_I_e(i,j)=kernelHelmholtz(pts_I(:,i),pts_S(:,j),sqrt(n)*lambi);
      end
    end
    
    % Trefethen
    A=[M_D_i  M_D_e ; M_N_i  M_N_e ; M_I_i  zeros(m_I,m) ; zeros(m_I,m) M_I_e];
    [Q,~]=qr(A,0);
    tmp=svd(Q(1:(2*m),:));
    s=tmp(2*m);    % singular values stored in decreasing order
end

function z=kernelHelmholtz(x,y,k)
    r=norm(x-y,2);
    z=exp(1i*k*r)/r;
end

function z=nabla_kernelHelmholtz(x,y,k) 
    r=norm(x-y,2);
    z=(1i*k-1/r)*exp(1i*k*r)/r^2*(x-y)';
end

