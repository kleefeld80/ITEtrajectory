function sphere1()
  [curve1,col1]=runallsphere(1.001,1.3,3.5,1.3,0);
  [curve2,col2]=runallsphere(1.3,1.8,3.2,1.1,0);
  [curve3,col3]=runallsphere(1.8,3,3,0.8,0);
  [curve4,col4]=runallsphere(3,3.999,3.1,0.4,0);
  [curve5,col5]=runallsphere(4.001,8.999,3.1,0.4,0);
  [curve6,col6]=runallsphere(9.001,15.999,3.1,0.4,0);
    
    kk=3.14159265358979;
    
    figure(14)
    hold on
    h=colormap(autumn);
    curve=[curve1;curve2;curve3;curve4;pi;curve5;pi;curve6;pi];
    nnn=[col1;col2;col3;col4;4;col5;4;col6;4];
    save('sphere1.mat','curve','nnn');
    
    for i=1:length(curve)-1
      x1=real(curve(i));
      x2=real(curve(i+1));
      y1=imag(curve(i));
      y2=imag(curve(i+1));
      plot([x1 x2],[y1,y2],'color',h(floor(nnn(i)*4),:))
      plot([x1 x2],[-y1,-y2],'color',h(floor(nnn(i)*4),:))
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
    hold off
end