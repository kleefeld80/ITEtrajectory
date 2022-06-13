function plotfig07()
  figure(7)
  hold on
  t=linspace(0,2*pi,100);
  fill(0.75*cos(t)+0.3*cos(2*t),sin(t),[0.5 0.5 0.5])
  axis equal
  axis off
  hold off
  
  set(gcf,'renderer','Painters')
  print -depsc fig07.eps
end