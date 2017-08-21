function [dist, cost]=levenstein(seq1,seq2)
%dist为标准化的编辑距离，cost为编辑花费
seq1 = seq1(:);
seq2 = seq2(:);
n1 = length(seq1);
n2 = length(seq2);

mat=zeros(n1 + 1, n2 + 1); %DP矩阵
for i=1 : n1 + 1
    for j=1 : n2 + 1
        if i==1 && j==1 mat(i,j)=0;
        else
            if i==1 && j>1 mat(i,j)=j-1;
            else
                if i>1 && j==1 mat(i,j)=i-1;
                else
                    if seq1(i-1) == seq2(j-1)
                        force=0;
                    else
                        force=1;
                    end
                    mat(i,j)=min([mat(i-1,j)+1,mat(i,j-1)+1,mat(i-1,j-1)+force]);
                end
            end
        end
    end
end

s=(n1 + n2 - mat(i,j))/2;
% 这是归一化的编辑花费
dist=(n1 + n2 -2*s)/(n1 + n2 - s);
% 这是编辑的花费
cost=mat(i,j);