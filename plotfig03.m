% sphere1()
% sphere2()
% sphere3()
function plotfig03()
  figure(3)
  hold on
  h=colormap(turbo);
  
  % curve 1
  hh=load('sphere1.mat');
  curve=hh.curve;
  nnn=hh.nnn;
  
  kk=3.14159265358979;
  
  for i=1:length(curve)-1
    x1=real(curve(i));
    x2=real(curve(i+1));
    y1=imag(curve(i));
    y2=imag(curve(i+1));
    plot([x1 x2],[y1,y2],'color',h(floor(nnn(i)*16),:))
    plot([x1 x2],[-y1,-y2],'color',h(floor(nnn(i)*16),:))
  end
    
  m=tan(pi/3);
  x=linspace(kk-0.2,kk+0.2,10);
  y1=m.*x-m*kk;
  y2=-m.*x+m*kk;
  plot(x,y1,'g');
  plot(x,y2,'g');
  cc=0.2/cos(pi/3);
  plot([kk-cc,kk+cc],[0,0],'g')
  plot(kk,0,'b*')
  
  % curve 2
  hh=load('sphere2.mat');
  curve=hh.curve;
  nnn=hh.nnn;
  
  kk=4.493409;
  
  for i=1:length(curve)-1
    x1=real(curve(i));
    x2=real(curve(i+1));
    y1=imag(curve(i));
    y2=imag(curve(i+1));
    plot([x1 x2],[y1,y2],'color',h(floor(nnn(i)*16),:))
    plot([x1 x2],[-y1,-y2],'color',h(floor(nnn(i)*16),:))
  end
    
  m=tan(pi/3);
  x=linspace(kk-0.2,kk+0.2,10);
  y1=m.*x-m*kk;
  y2=-m.*x+m*kk;
  plot(x,y1,'g');
  plot(x,y2,'g');
  cc=0.2/cos(pi/3);
  plot([kk-cc,kk+cc],[0,0],'g')
  plot(kk,0,'b*')
  
  % curve 3
  hh=load('sphere3.mat');
  curve=hh.curve;
  nnn=hh.nnn;
  
  kk=5.763459;
  
  for i=1:length(curve)-1
    x1=real(curve(i));
    x2=real(curve(i+1));
    y1=imag(curve(i));
    y2=imag(curve(i+1));
    plot([x1 x2],[y1,y2],'color',h(floor(nnn(i)*16),:))
    plot([x1 x2],[-y1,-y2],'color',h(floor(nnn(i)*16),:))
  end
    
  m=tan(pi/3);
  x=linspace(kk-0.2,kk+0.2,10);
  y1=m.*x-m*kk;
  y2=-m.*x+m*kk;
  plot(x,y1,'g');
  plot(x,y2,'g');
  cc=0.2/cos(pi/3);
  plot([kk-cc,kk+cc],[0,0],'g')
  plot(kk,0,'b*')
  
  % remaining stuff
  colorbar
  caxis([1,16])
  axis equal
  axis([2 7 -2 2])
  xlabel('Re(\kappa)')
  ylabel('Im(\kappa)')
  hold off
  
  set(gcf,'renderer','Painters')
  print -depsc fig03.eps
end