function disk1()
  [curve1,col1]=runalldisk(1.001,2.6,2.8,1.0,0);
  [curve2,col2]=runalldisk(2.6,  4.26,2.4,0.6,0);
  
    k1= 5.26894043160523;
    k2=12.949091948711422;

    kk=2.404825557695773;
    
    reso=30;
    x=linspace(0,1,reso/2);
    c2=linspace(k1+1,k2-1,5*reso);
    c3=linspace(k2+1,16,5*reso);
    n=[abs((1-x).^5-1)+k1-1 x.^5+k1 c2 abs((1-x).^5-1)+k2-1 x.^5+k2 c3];
    ll=length(n);
    
    curve3=zeros(1,ll);
    mux=2.3;
    muy=0.3;
    for i=1:ll
        val=extensionTrans2D(0,mux,muy,0.3,0.3,n(i));
        if isempty(val)
          curve3(i)=kk;
        else
          curve3(i)=val;
        end
    end
    figure(11)
    hold on
    h=colormap(autumn);
    curve=[curve1; curve2; conj(curve3)'];
    nnn=[col1; col2; n'];
    save('disk1.mat','curve','nnn');
    
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
    
    plot(2.404825557695773,0,'b*')
    colorbar
    caxis([1,16])
    axis equal
    hold off
end