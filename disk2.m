function disk2()
  [curve1,col1]=runalldisk(1.001,1.7,4.1,1.5,1);
  [curve2,col2]=runalldisk(1.7,3,3.9,0.8,1);
  [curve3,col3]=runalldisk(3,3.35,3.6,0.4,1);
  
    k1=3.352305866930587;
    k2=7.049425204419588;
    k3=12.091072182400474;
    
    kk=3.831705970207513;
    
    reso=30;
    x=linspace(0,1,reso/2);
    c2=linspace(k1+1,k2-1,5*reso);
    c3=linspace(k2+1,k3-1,5*reso);
    c4=linspace(k3+1,16,5*reso);
    n=[x.^5+k1 c2 abs((1-x).^5-1)+k2-1 x.^5+k2 c3 abs((1-x).^5-1)+k3-1 x.^5+k3 c4];
    ll=length(n);
    
    curve4=zeros(1,ll);
    mux=3.8;
    muy=0.4;
    for i=1:ll
        val=extensionTrans2D(1,mux,muy,0.4,0.4,n(i));
        if isempty(val)
          curve4(i)=kk;
        else
          curve4(i)=val;
        end
    end
    figure(12)
    hold on
    h=colormap(autumn);
    curve=[curve1; curve2; curve3; conj(curve4)'];
    nnn=[col1; col2; col3; n'];
    save('disk2.mat','curve','nnn');
    
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