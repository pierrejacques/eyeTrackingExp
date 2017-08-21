function [dist,pos1,pos2]=commonDist(seq1,seq2)
%对于Dir矩阵，0表示空，1表示向右，2表示向右下，3表示向下
a=seqStruct(seq1);
b=seqStruct(seq2);
x=a.length;
y=b.length;
if min(x,y)==0
    dist=0;
    same=[];
    DPmatrix=[];
    Dir=[];
else
    same=zeros(x,y);
    DPmatrix=zeros(x,y);
    Dir=zeros(x,y);
    for i=x:-1:1
        for j=y:-1:1
            if a.seqArr(i)==b.seqArr(j)
                same(i,j)=1;
            end
            if i==x && j==y
                DPmatrix(i,j)=same(i,j);
            else
                if i==x
                    if DPmatrix(i,j+1) > same(i,j)
                        DPmatrix(i,j) = DPmatrix(i,j+1);
                        Dir(i,j)=1;
                    else
                        DPmatrix(i,j) = same(i,j);
                    end
                else
                    if j==y
                        if DPmatrix(i+1,j) > same(i,j)
                            DPmatrix(i,j) = DPmatrix(i+1,j);
                            Dir(i,j)=3;
                        else
                            DPmatrix(i,j) = same(i,j);
                        end
                    else
                        maxx=max([DPmatrix(i+1,j),DPmatrix(i,j+1),DPmatrix(i+1,j+1)+same(i,j)]);
                        DPmatrix(i,j)=maxx;
                        if DPmatrix(i+1,j)==maxx
                            Dir(i,j)=3;
                        else
                            if DPmatrix(i,j+1)==maxx
                                Dir(i,j)=1;
                            else
                                Dir(i,j)=2;
                            end
                        end
                    end
                end
            end
        end
    end
    dist=DPmatrix(1,1);
%          dist=a.length+b.length-2*DPmatrix(1,1);
%          dist=dist/(dist+DPmatrix(1,1));
    
    
    %以下搜索最长的路径
    i=1;
    j=1;
    pos1=[];
    pos2=[];
    while i<=x && j<=y && Dir(i,j)~=0
        if same(i,j)
            pos1(length(pos1)+1)=i;
            pos2(length(pos2)+1)=j;
        end
        if Dir(i,j)==1
            j=j+1;
        else
            if Dir(i,j)==2
                j=j+1;
                i=i+1;
            else
                i=i+1;
            end
        end
    end
    if same(i,j)
        pos1(length(pos1)+1)=i;
        pos2(length(pos2)+1)=j;
    end
    
    %以下计算转移的代价，该指标由于存在较多的重复性计算的难度最好应用于首达序列的计算
    
    
end
