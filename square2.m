function square2()
    reso=1000;
    start=4;
    stop=32;
    
    n=linspace(start,stop,reso);
    len=length(n);
    
    curve=[];
    mux=7.0;
    muy=1.0;
    for i=1:len
        [moep,~]=MFS_ITE_polygon(61,[mux,muy],4,1.5,n(i));
        val=moep(1)+moep(2)*1i;
        curve=[curve;val]; %#ok<AGROW>
        mux=moep(1);
        muy=moep(2);
    end
    save('square2.mat','n','curve')

    figure(20)
    hold on
    plot(real(curve),imag(curve),'ro')
    plot(7.0248,0,'r*')
    hold off
end