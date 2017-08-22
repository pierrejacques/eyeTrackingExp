function [dist] = commonDist(seq1,seq2)
%对于Dir矩阵，0表示空，1表示向右，2表示向右下，3表示向下
x=length(seq1);
y=length(seq2);

if min(x, y)==0
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
            if seq1(i) == seq2(j)
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
end
end
