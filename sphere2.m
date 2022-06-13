function sphere2()
  [curve1,col1]=runallsphere(1.001,1.35,4.8,1.4,1);
  [curve2,col2]=runallsphere(1.35,2,4.5,1.2,1);
  [curve3,col3]=runallsphere(2,2.5,4.2,0.8,1);
  [curve4,col4]=runallsphere(2.5,2.955,4.5,0.4,1);
  [curve5,col5]=runallsphere(2.956,5.888,4.5,0.4,1);
  [curve6,col6]=runallsphere(5.889,9.798,4.5,0.4,1);
  [curve7,col7]=runallsphere(9.800,14.686,4.5,0.4,1);
  [curve8,col8]=runallsphere(14.688,16,4.5,0.4,1);
    
    kk=4.493409;
    
    figure(15)
    hold on
    h=colormap(autumn);
    curve=[curve1;curve2;curve3;curve4;kk;curve5;kk;curve6;kk;curve7;kk;curve8];
    nnn=[col1;col2;col3;col4;2.955788;col5;5.8888;col6;9.799;col7;14.687;col8];
    save('sphere2.mat','curve','nnn');
    
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