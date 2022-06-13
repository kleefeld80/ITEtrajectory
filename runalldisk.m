function [curve,col]=runalldisk(nunten,noben,mux,muy,indi)
    reso=20;
    n=linspace(nunten,noben,reso);
    curve=[];
    col=[];
    for i=1:reso
        val=ITEbeyn2D(indi,mux,muy,0.4,0.4,n(i));
        if ~isempty(val)
          curve=[curve;val]; %#ok<AGROW>
          col=[col;n(i)];    %#ok<AGROW>
        end
    end
end