function [out, seq] = seqDist()
%out是一个struct，包含五种距离，seq是序列矩阵（cell）
%out包括：编辑距离ED，共同距离CD，最长共同子序列长LCS

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
ED = {};
CD = {};
LCS = {};

for pic = pics
    EDmat = zeros(length(users));
    CDmat = zeros(length(users));
    LCSmat = zeros(length(users));
    n = length(users);
    for user1 = 1:n
        for user2 = user1:n
            seq1 = seq{user1, pic};
            seq2 = seq{user2, pic};
            % 计算赋值
            [EDmat(user1, user2)] = levenstein(seq1, seq2);
            [CDmat(user1, user2), LCSmat(user1, user2)] = common(seq1, seq2);
            % 矩阵自赋值
            EDmat(user2, user1) = EDmat(user1, user2);
            CDmat(user2, user1) = CDmat(user1, user2);
            LCSmat(user2, user1) = LCSmat(user1, user2);
        end
    end
    ED{pic} = EDmat;
    CD{pic} = CDmat;
    LCS{pic} = LCSmat;
end
out.ED = ED;
out.CD = CD;
out.LCS = LCS;

end

%标准编辑距离（with Insertion，Deletion，Substitution）
function cost =levenstein(seq1, seq2)
%dist为标准化的编辑距离(先不考虑了)，cost为编辑花费
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
%s=(n1 + n2 - mat(i,j))/2;
% 这是归一化的编辑花费
%dist=(n1 + n2 -2*s)/(n1 + n2 - s);
% 这是编辑的花费
cost=mat(i,j);
end

%common编辑距离（with Insertion, Deletion)
function [cost, common] = common(seq1,seq2)
%dist是归一化的共同编辑距离
%cost是编辑代价
%common是共同长

x=length(seq1);
y=length(seq2);

if min(x, y)==0
    common = 0;
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
    common=DPmatrix(1,1);
end

cost = x + y - 2*common;
end

%判断一个点是否落在画面内
function [bool] = isValid(x, y)
bool = (x>0 && x<=1280 && y>0 && y<=800);
end
