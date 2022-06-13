function ellipse2()
    reso=1000;
    start=4;
    stop=32;
    
    n=linspace(start,stop,reso);
    len=length(n);
    
    curve=[];
    mux=5.0;
    muy=1.0;
    for i=1:len
        [moep,~]=MFS_ITE_ellipse(40,[mux,muy],1,0.5,4,n(i));
        val=moep(1)+moep(2)*1i;
        curve=[curve;val]; %#ok<AGROW>
        mux=moep(1);
        muy=moep(2);
    end
    save('ellipse2.mat','n','curve')
    figure(18)
    hold on
    plot(real(curve),imag(curve),'ro')
    plot(3.77715,0,'r*')
    hold off
end