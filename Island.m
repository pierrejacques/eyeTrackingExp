function [S]=Island(X,Y) %此处的输入向量应为两个列向量，标记了在一个时间t上所有点的横纵坐标

l=length(X);
for i=l:-1:1
   if X(i)==0
       X(i)=[];
       Y(i)=[];
   end
end
l=length(X);

map=zeros(1280,800);

for i=1:l
    for dx=-55:55
        tmp=round(sqrt(55*55-dx*dx));
        for dy=-tmp:tmp
            x=X(i)+dx;
            y=Y(i)+dy;
            if x>0 && x<=1280 && y>0 && y<=1280
                map(x,y)=1;
            end
        end
    end
end

S=sum(sum(map));
