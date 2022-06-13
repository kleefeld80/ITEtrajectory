% ellipse1.m 
% ellipse2.m
function plotfig04()
  figure(4)
  hold on
  h=colormap(turbo);
  
  % curve 1
  hh=load('ellipse1.mat');
  curve=hh.curve;
  nnn=hh.n;
  
  kk=3.777;
  
  for i=1:length(curve)-1
    x1=real(curve(i));
    x2=real(curve(i+1));
    y1=imag(curve(i));
    y2=imag(curve(i+1));
    plot([x1 x2],[y1,y2],'color',h(floor(nnn(i)*8),:))
    plot([x1 x2],[-y1,-y2],'color',h(floor(nnn(i)*8),:))
  end
  plot(kk,0,'b*')
  
  % curve 1
  hh=load('ellipse2.mat');
  curve=hh.curve;
  nnn=hh.n;
  
  kk=5.010;
  
  for i=1:length(curve)-1
    x1=real(curve(i));
    x2=real(curve(i+1));
    y1=imag(curve(i));
    y2=imag(curve(i+1));
    plot([x1 x2],[y1,y2],'color',h(floor(nnn(i)*8),:))
    plot([x1 x2],[-y1,-y2],'color',h(floor(nnn(i)*8),:))
  end
  plot(kk,0,'b*')
 
  colorbar
  caxis([1,32])
  axis equal
  axis([3 5.5 -1.5 1.5])
  xlabel('Re(\kappa)')
  ylabel('Im(\kappa)')
  hold off
  
  set(gcf,'renderer','Painters')
  print -depsc fig04.eps
end