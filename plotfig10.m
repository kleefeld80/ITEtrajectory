% clover1()
% clover2()
function plotfig10()
  figure(10)
  hold on
  h=colormap(turbo);
  
  % curve 1
  hh=load('clover1.mat');
  curve=hh.curve;
  nnn=hh.n;
  kk=2.0707;        % MFS
  
  for i=1:length(curve)-1
    x1=real(curve(i));
    x2=real(curve(i+1));
    y1=imag(curve(i));
    y2=imag(curve(i+1));
    plot([x1 x2],[y1,y2],'color',h(floor((nnn(i))*5),:))
    plot([x1 x2],[-y1,-y2],'color',h(floor((nnn(i))*5),:))
  end
  plot(kk,0,'b*')
  
  % curve 1
  hh=load('clover2.mat');
  curve=hh.curve;
  nnn=hh.n;
  kk=3.22193;        % MFS
  
  for i=1:length(curve)-1
    x1=real(curve(i));
    x2=real(curve(i+1));
    y1=imag(curve(i));
    y2=imag(curve(i+1));
    plot([x1 x2],[y1,y2],'color',h(floor((nnn(i))*5),:))
    plot([x1 x2],[-y1,-y2],'color',h(floor((nnn(i))*5),:))
  end
  plot(kk,0,'b*')
  
  colorbar
  caxis([1,48])
  axis equal
  axis([1.5 3.5 -1 1])
  xlabel('Re(\kappa)')
  ylabel('Im(\kappa)')
  hold off
  
  set(gcf,'renderer','Painters')
  print -depsc fig10.eps
end