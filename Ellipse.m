function [S]=Ellipse(X,Y) %�˴�����������ӦΪ�������������������һ��ʱ��t�����е�ĺ�������

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
