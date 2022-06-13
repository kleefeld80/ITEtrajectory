function triangle1()
    reso=1000;
    curve=[];
    nnn=[];
    
    n=linspace(4,32,reso);
    len=length(n);
    
    mux=7.3;
    muy=1.5;
    for i=1:len
        [moep,~]=MFS_ITE_polygon(51,[mux,muy],3,1.5,n(i));
        val=moep(1)+moep(2)*1i;
        curve=[curve;val]; %#ok<AGROW>
        nnn=[nnn;n(i)];    %#ok<AGROW>
        mux=moep(1);
        muy=moep(2);
    end
    
    save('triangle1.mat','nnn','curve')
    figure(21)
    hold on
    plot(real(curve),imag(curve),'ro')
    plot(7.255,0,'r*')
    hold off
end