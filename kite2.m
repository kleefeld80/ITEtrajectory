function kite2()
    reso=1000;
    start=4;
    stop=32;
    
    n=linspace(start,stop,reso);
    len=length(n);
    
    curve=[];
    nnn=[];
    mux=4.0;
    muy=0.8;
    for i=1:len
        [moep,~]=MFS_ITE_kite_isotropic2(51,[mux,muy],0.3,1.5,n(i));
        val=moep(1)+moep(2)*1i;
        curve=[curve;val]; %#ok<AGROW>
        nnn=[nnn;n(i)];    %#ok<AGROW>
        mux=moep(1);
        muy=moep(2);
    end
    save('kite2.mat','nnn','curve')
    
    figure(24)
    hold on
    plot(real(curve),imag(curve),'go')
    plot(4.3717,0,'r*')
    hold off
end