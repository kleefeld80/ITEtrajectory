% disk1()
% disk2()
% disk3()
function plotfig01()
  figure(1)
  hold on
  h=colormap(turbo);
  
  % curve 1
  hh=load('disk1.mat');
  curve=hh.curve;
  nnn=hh.nnn;
  
  kk=2.404825557695773;
  
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
  hh=load('disk2.mat');
  curve=hh.curve;
  nnn=hh.nnn;
  
  kk=3.831705970207513;
  
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
  hh=load('disk3.mat');
  curve=hh.curve;
  nnn=hh.nnn;
  
  kk=5.13562230184068;
  
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
  
  colorbar
  caxis([1,16])
  axis equal
  axis([2 6 -2 2])
  xlabel('Re(\kappa)')
  ylabel('Im(\kappa)')
  box on
  hold off
  
  set(gcf,'renderer','Painters')
  print -depsc fig01.eps
end