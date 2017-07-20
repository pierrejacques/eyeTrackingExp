function [LCSmax, LCSmean, LCS, seq] = seqEntropy()
load data
% 根据AOImap和fixation产生初始化序列
for pic = pics
    map = AOImap{pic};
    for user = users
        seqMat = [];
        pointer = 0;
        mat = fixations{user, pic};
        n = size(mat, 1);
        for i = 1:n
            if pointer > 20 % seqLengthThreshold
                break;
            end
            x = mat(i, 3);
            y = mat(i, 4);
            if isValid(x, y) && map(x, y) > 0
                pointer = pointer + 1;
                seqMat(pointer) = map(x, y);
            end
        end
        seq{user, pic} = seqMat;
    end
end

% 计算LCS， 编辑距离和标准化编辑距离
for pic = pics
    LCSmat = zeros(length(users));
    EDmat = LCSmat;
    NEDmat = EDmat;
    n = length(users);
    for user1 = 1:n
        for user2 = user1:n
            seq1 = seq{user1, pic};
            seq2 = seq{user2, pic};
            val = LCSlength(seq1, seq2);
            LCSmat(user1, user2) = val;
            LCSmat(user2, user1) = val;
%             EDmat(user1, user2) = length(seq1) + length(seq2) - 2*val;
%             EDmat(user2, user1) = length(seq1) + length(seq2) - 2*val;
%             NEDmat(user1, user2) = (length(seq1) + length(seq2) - 2*val)/(length(seq1) + length(seq2));
%             NEDmat(user2, user1) = (length(seq1) + length(seq2) - 2*val)/(length(seq1) + length(seq2));
        end
    end
    LCS{pic} = LCSmat;
    diagMat = LCSmat.*diag(ones(1, n));
    noDiagMat = LCSmat - diagMat;
    LCSmean(pic) = mean(noDiagMat(:)); %不带对角
%     LCSmean(pic) = (sum(noDiagMat(:)) + sum(diagMat(:))) / 30 / 29 * 2;
%     %带对角
    LCSmax(pic) = mean(max(noDiagMat));
%     ED{pic} = EDmat;
%     NED{pic} = NEDmat;
end
end


function [dist] = LCSlength(seq1,seq2)
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

function [bool] = isValid(x, y)
bool = (x>0 && x<=1280 && y>0 && y<=800);
end
