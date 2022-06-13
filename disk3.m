function disk3()
    [curve1,col1]=runalldisk(1.001,1.4,5.8,1.5,2);
    [curve2,col2]=runalldisk(1.4,2.2,5.2,1.2,2);
    [curve3,col3]=runalldisk(2.2,2.6,5.0,0.8,2);
    [curve4,col4]=runalldisk(2.6,2.66,5.0,0.4,2);
    
    k1=2.686294950099330;
    k2=5.119343033436942;
    k3=8.300412244865717;
    k4=12.229755726810973;
    
    kk=5.13562230184068;
    
    reso=30;
    x=linspace(0,1,reso/2);
    c2=linspace(k1+1,k2-1,5*reso);
    c3=linspace(k2+1,k3-1,5*reso);
    c4=linspace(k3+1,k4-1,5*reso);
    c5=linspace(k4+1,16,5*reso);
    %n=[abs((1-x).^5-1)+k1-1 x.^5+k1 c2 abs((1-x).^5-1)+k2-1 x.^5+k2 c3 abs((1-x).^5-1)+k3-1 x.^5+k3 c4];
    n=[x.^5+k1 c2 abs((1-x).^5-1)+k2-1 x.^5+k2 c3 abs((1-x).^5-1)+k3-1 x.^5+k3 c4 abs((1-x).^5-1)+k4-1 x.^5+k4 c5];
    ll=length(n);
    
    curve5=zeros(1,ll);
    mux=5.2;
    muy=0.4;
    for i=1:ll
        val=extensionTrans2D(2,mux,muy,0.4,0.4,n(i));
        if isempty(val)
          curve5(i)=kk;
        else
          curve5(i)=val;
        end
    end
    figure(13)
    hold on
    h=colormap(autumn);
    curve=[curve1; curve2; curve3; curve4; conj(curve5)'];
    nnn=[col1; col2; col3; col4; n'];
    save('disk3.mat','curve','nnn');
    
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