function [vec]=TOOLlinear(map)
sum=0;
for x=1:1280
    for y=1:800
        sum=sum+1;
        vec(sum)=map(x,y);
    end
end
