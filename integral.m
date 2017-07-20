function [out]=integral(in,dt)
if nargin==1;
    dt=150;
end

out=in;

for i=1:41
    curve = in{i}.EF;
    int=[];
    int(1)=sum(curve([1:1+dt]));
    for j=2:length(curve)-dt
        int(j)=int(j-1)-curve(j-1)+curve(j+dt);
    end
    out{i}.EFintegral=int/dt;
end

for i=1:41
    curve = in{i}.IF;
    int=[];
    int(1)=sum(curve([1:1+dt]));
    for j=2:length(curve)-dt
        int(j)=int(j-1)-curve(j-1)+curve(j+dt);
    end
    out{i}.IFintegral=int/dt;
end