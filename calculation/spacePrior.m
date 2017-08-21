function [area, cell] = spacePrior()
% 计算fixation位置的鲜艳分布范围度量
load data
cell = {};
for pic = pics
    l = 1280;
    r = 1;
    t = 800;
    b = 1;
    for user = users
        mat = fixations{user, pic};
        [n, ~] = size(mat);
        for i = 1:n
            x = mat(i, 3);
            y = mat(i, 4);
            if isValid(x, y)
                l = min(l, x);
                r = max(r, x);
                t = min(t, y);
                b = max(b, y);
            end
        end
    end
    cell{pic} = [t, r, b, l];
    area(pic) = (r - l)*(b - t);
end
end

function bool = isValid(x, y)
    bool = x > 0 && x <= 1280 && y>0 && y<=800;
end