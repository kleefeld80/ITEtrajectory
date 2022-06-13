function [curve,col]=runallsphere(nunten,noben,mux,muy,indi)
    reso=100;
    n=linspace(nunten,noben,reso);
    curve=[];
    col=[];
    for i=1:reso
        val=ITEbeyn3D(indi,mux,muy,0.4,0.4,n(i));
        if isempty(val)
          j=0;                %#ok<NASGU>
        elseif length(val)==1
          curve=[curve;val];  %#ok<AGROW>
          col=[col;n(i)];     %#ok<AGROW>
        else
            n(i)
          [maxi,index]=min(real(val)); %#ok<ASGLU>
          curve=[curve;val(index,:)];  %#ok<AGROW>
          col=[col;n(i)];              %#ok<AGROW>
        end
    end
end