function sphere3()
   [curve1,col1]=runallsphere(1.001,1.2,6.2,1.5,2); 
   [curve2,col2]=runallsphere(1.2,1.5,5.9,1.4,2); 
   [curve3,col3]=runallsphere(1.5,1.9,5.6,1.1,2); 
   [curve4,col4]=runallsphere(1.9,2.3,5.5,0.8,2);
   [curve5,col5]=runallsphere(2.3,2.49,5.8,0.402,2); 
   [curve6,col6]=runallsphere(2.4905,4.5714,5.8,0.402,2);
   [curve7,col7]=runallsphere(4.572,7.246,5.8,0.402,2); 
   [curve8,col8]=runallsphere(7.247,10.514,5.8,0.402,2); 
   [curve9,col9]=runallsphere(10.515,14.377,5.8,0.402,2); 
   [curve10,col10]=runallsphere(14.378,15,5.8,0.402,2); 
   [curve11,col11]=runallsphere(15,16,5.6,0.42,2);
    
    kk=5.763459;
    
    figure(16)
    hold on
    h=colormap(autumn);
    curve=[curve1;curve2;curve3;curve4;curve5;kk;      curve6;kk;    curve7;kk;     curve8;kk;      curve9;kk;     curve10;curve11];
    nnn=  [col1;  col2;  col3;  col4;  col5;  2.490233;col6;  4.5715;col7;  7.24627;col8;  10.51495;col9;  14.3777;col10;col11];
    save('sphere3.mat','curve','nnn');
    
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