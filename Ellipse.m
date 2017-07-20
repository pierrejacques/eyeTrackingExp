function [S]=Ellipse(X,Y) %此处的输入向量应为两个列向量，标记了在一个时间t上所有点的横纵坐标

l=length(X);
for i=l:-1:1
   if X(i)==0
       X(i)=[];
       Y(i)=[];
   end
end
l=length(X);

stdX=std(X);
stdY=std(Y);
r=corr(X,Y);
S=sqrt(1-r*r)*stdX*stdY;
