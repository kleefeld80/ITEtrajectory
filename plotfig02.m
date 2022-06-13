% disk4()
function plotfig02()
  figure(2)
  hold on
  h=colormap(turbo);
  
  % curve 1
  hh=load('disk4.mat');
  curve=hh.curve;
  nnn=hh.nnn;
  
  for i=1:length(curve)-1
    x1=real(curve(i));
    x2=real(curve(i+1));
    y1=imag(curve(i));
    y2=imag(curve(i+1));
    plot([x1 x2],[ y1, y2],'color',h(floor(257*nnn(i)-1),:))
    plot([x1 x2],[-y1,-y2],'color',h(floor(257*nnn(i)-1),:))
  end
    
  kk=5.52007811028631;
  m=tan(pi/3);
  x=linspace(kk-0.2,kk+0.2,10);
  y1=m.*x-m*kk;
  y2=-m.*x+m*kk;
  plot(x,y1,'g');
  plot(x,y2,'g');
  cc=0.2/cos(pi/3);
  plot([kk-cc,kk+cc],[0,0],'g')
  plot(kk,0,'b*')
  kk=8.65372791291102;
  m=tan(pi/3);
  x=linspace(kk-0.2,kk+0.2,10);
  y1=m.*x-m*kk;
  y2=-m.*x+m*kk;
  plot(x,y1,'g');
  plot(x,y2,'g');
  cc=0.2/cos(pi/3);
  plot([kk-cc,kk+cc],[0,0],'g')
  plot(kk,0,'b*')
  
  % curve 1
  hh=load('disk1.mat');
  curve=hh.curve;
  
  for i=1:length(curve)-1
    x1=real(curve(i));
    x2=real(curve(i+1));
    y1=imag(curve(i));
    y2=imag(curve(i+1));
    plot([x1 x2],[ y1, y2],'k')
    plot([x1 x2],[-y1,-y2],'k')
  end
  
  kk=2.404825557695773;
  m=tan(pi/3);
  x=linspace(kk-0.2,kk+0.2,10);
  y1=m.*x-m*kk;
  y2=-m.*x+m*kk;
  plot(x,y1,'g');
  plot(x,y2,'g');
  cc=0.2/cos(pi/3);
  plot([kk-cc,kk+cc],[0,0],'g')
  plot(kk,0,'b*')
  
  colorbar
  caxis([0.01,1])
  axis equal
  axis([2 9 -2 2])
  xlabel('Re(\kappa)')
  ylabel('Im(\kappa)')
  hold off
  
  set(gcf,'renderer','Painters')
  print -depsc fig02.eps
end