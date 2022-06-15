% ellipsoid1()
% ellipsoid2()
% ellipsoid3()
function plotfig11()
  figure(1)
  hold on
  h=colormap(turbo);
  
  % curve 1
  hh=load('ellipsoid1.mat');
  curve=hh.curve;
  nnn=hh.n;
  kk=2.975506; 
  % Paper Kleefeld, Inverse Problems 
  % https://doi.org/10.1088/0266-5611/29/10/104012
  % Table 11
  
  for i=1:length(curve)-1
    x1=real(curve(i));
    x2=real(curve(i+1));
    y1=imag(curve(i));
    y2=imag(curve(i+1));
    plot([x1 x2],[y1,y2],'color',h(floor((nnn(i))*16),:))
    plot([x1 x2],[-y1,-y2],'color',h(floor((nnn(i))*16),:))
  end
  plot(kk,0,'b*')
  
  % curve 2
  hh=load('ellipsoid2.mat');
  curve=hh.curve;
  nnn=hh.n;
  kk=4.056326;        
  
  for i=1:length(curve)-1
    x1=real(curve(i));
    x2=real(curve(i+1));
    y1=imag(curve(i));
    y2=imag(curve(i+1));
    plot([x1 x2],[y1,y2],'color',h(floor((nnn(i))*16),:))
    plot([x1 x2],[-y1,-y2],'color',h(floor((nnn(i))*16),:))
  end
  plot(kk,0,'b*')
  
  % curve 3
  hh=load('ellipsoid3.mat');
  curve=hh.curve;
  nnn=hh.n;
  kk=4.351067;    
  
  for i=1:length(curve)-1
    x1=real(curve(i));
    x2=real(curve(i+1));
    y1=imag(curve(i));
    y2=imag(curve(i+1));
    plot([x1 x2],[y1,y2],'color',h(floor((nnn(i))*16),:))
    plot([x1 x2],[-y1,-y2],'color',h(floor((nnn(i))*16),:))
  end
  plot(kk,0,'b*')
  
  colorbar
  caxis([1,16])
  axis equal
  axis([2.5 5 -1 1])
  xlabel('Re(\kappa)')
  ylabel('Im(\kappa)')
  hold off
  
  set(gcf,'renderer','Painters')
  print -depsc fig11.eps
end