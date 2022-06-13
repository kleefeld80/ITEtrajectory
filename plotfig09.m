function plotfig09()
  figure(9)
  hold on
  t=linspace(0,2*pi,100);
  fill((sin(4*t)+5).*cos(t)/4,(sin(4*t)+5).*sin(t)/4,[0.5 0.5 0.5])
  axis equal
  axis off
  hold off
  
  set(gcf,'renderer','Painters')
  print -depsc fig09.eps
end