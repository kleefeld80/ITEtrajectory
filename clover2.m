function clover2()
    reso=1000;
    start=4;
    stop=32;
    
    n=linspace(start,stop,reso);
    len=length(n);
    
    curve=[];
    mux=3.0;
    muy=0.5;
    for i=1:len
        [moep,~]=MFS_ITE_clover(51,[mux,muy],1.2,n(i));
        val=moep(1)+moep(2)*1i;
        curve=[curve;val]; %#ok<AGROW>
        mux=moep(1);
        muy=moep(2);
    end
    save('clover2.mat','n','curve')

    figure(26)
    hold on
    plot(real(curve),imag(curve),'ro')
    plot(3.2219,0,'r*')
    hold off
end