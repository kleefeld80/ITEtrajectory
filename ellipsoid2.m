function ellipsoid2()
    reso=500;
    start=4;
    stop=16;
    
    n=linspace(start,stop,reso);
    len=length(n);
    
    curve=[];
    mux=4.0;
    muy=0.5;
    for i=1:len
        [moep,~]=MFS_ITE_ellipsoid(110,[mux,muy],3,n(i));
        val=moep(1)+moep(2)*1i;
        curve=[curve;val]; %#ok<AGROW>
        mux=moep(1);
        muy=moep(2);
    end
    save('ellipsoid2.mat','n','curve')

    figure(28)
    hold on
    plot(real(curve),imag(curve),'ro')
    plot(4.056326,0,'r*')
    hold off
end