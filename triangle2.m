function triangle2()
    reso=1000;
    curve=[];
    nnn=[];
    
    n=linspace(4,32,reso);
    len=length(n);
    
    mux=11.0;
    muy=2.0;
    for i=1:len
        [moep,~]=MFS_ITE_polygon(61,[mux,muy],3,1.5,n(i));
        val=moep(1)+moep(2)*1i;
        curve=[curve;val]; %#ok<AGROW>
        nnn=[nnn;n(i)];    %#ok<AGROW>
        mux=moep(1);
        muy=moep(2);
    end
    
    save('triangle2.mat','nnn','curve')
    figure(22)
    hold on
    plot(real(curve),imag(curve),'ro')
    plot(11.082,0,'r*')
    hold off
end