% triangle1()
% triangle2()
function plotfig06()
  figure(6)
  hold on
  h=colormap(turbo);
  
  % curve 1
  hh=load('triangle1.mat');
  curve=hh.curve;
  nnn=hh.nnn;
  kk=7.255197456936871;        % grebenkov Seite 10 m=3, n=0 4*pi/sqrt(3)\approx 7.255197456936871
  
  for i=1:length(curve)-1
    x1=real(curve(i));
    x2=real(curve(i+1));
    y1=imag(curve(i));
    y2=imag(curve(i+1));
    plot([x1 x2],[y1,y2],'color',h(floor((nnn(i))*8),:))
    plot([x1 x2],[-y1,-y2],'color',h(floor((nnn(i))*8),:))
  end
  plot(kk,0,'b*')
  
  % curve 2
  hh=load('triangle2.mat');
  curve=hh.curve;
  nnn=hh.nnn;
  kk=11.082497176088109;        % grebenkov Seite 10 m=5, n=1 4*pi/sqrt(7)/3\approx 11.082497176088109
  
  for i=1:430
    x1=real(curve(i));
    x2=real(curve(i+1));
    y1=imag(curve(i));
    y2=imag(curve(i+1));
    plot([x1 x2],[y1,y2],'color',h(floor((nnn(i))*8),:))
    plot([x1 x2],[-y1,-y2],'color',h(floor((nnn(i))*8),:))
  end
  plot(kk,0,'b*')
  
  colorbar
  caxis([1,32])
  axis equal
  axis([6.5 11.5 -2.3 2.3])
  xlabel('Re(\kappa)')
  ylabel('Im(\kappa)')
  hold off
  
  set(gcf,'renderer','Painters')
  print -depsc fig06.eps
end