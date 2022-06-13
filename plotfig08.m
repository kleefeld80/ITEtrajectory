% kite1()
% kite2()
function plotfig08()
  figure(8)
  hold on
  h=colormap(turbo);
  
  % curve 1
  hh=load('kite1.mat');
  curve=hh.curve;
  nnn=hh.nnn;
  kk=2.9550;        % MFS
  
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
  hh=load('kite2.mat');
  curve=hh.curve;
  nnn=hh.nnn;
  kk=4.3717;        % MFS
  
  for i=1:572
    x1=real(curve(i));
    x2=real(curve(i+1));
    y1=imag(curve(i));
    y2=imag(curve(i+1));
    plot([x1 x2],[y1,y2],'color',h(floor((nnn(i))*8),:))
    plot([x1 x2],[-y1,-y2],'color',h(floor((nnn(i))*8),:))
  end
  plot(kk,0,'b*')
  
  % remaining stuff
  colorbar
  caxis([1,32])
  axis equal
  axis([2.5 5 -1 1])
  xlabel('Re(\kappa)')
  ylabel('Im(\kappa)')
  hold off
  
  set(gcf,'renderer','Painters')
  print -depsc fig08.eps
end