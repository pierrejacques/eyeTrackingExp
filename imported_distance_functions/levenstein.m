function [dist,DPmatrix,a,b]=levenstein(seq1,seq2)

%初始化，把字符串存成类，方便计算
a=seqStruct(seq1);
b=seqStruct(seq2);

DPmatrix=zeros(a.length+1,b.length+1);
for i=1:a.length+1
    for j=1:b.length+1
        if i==1 && j==1 DPmatrix(i,j)=0;
        else
            if i==1 && j>1 DPmatrix(i,j)=j-1;
            else
                if i>1 && j==1 DPmatrix(i,j)=i-1;
                else
                    if a.seqArr(i-1)==b.seqArr(j-1)
                        force=0;
                    else
                        force=1;
                    end
                    DPmatrix(i,j)=min([DPmatrix(i-1,j)+1,DPmatrix(i,j-1)+1,DPmatrix(i-1,j-1)+force]);
                end
            end
        end
    end
end

s=(a.length+b.length-DPmatrix(i,j))/2;
dist=(a.length+b.length-2*s)/(a.length+b.length-s);

dist=DPmatrix(i,j);