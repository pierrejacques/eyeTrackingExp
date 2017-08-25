function [area] = rectArea(margin)
% 计算fixation位置的外接矩形的面积，margin是扩张范围
if nargin == 0
    margin = 0;
end

load data
area = zeros(max(pics), 1);

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
    area(pic) = (r - l + 2*margin)*(b - t + 2*margin);
end
end

function bool = isValid(x, y)
    bool = x > 0 && x <= 1280 && y>0 && y<=800;
end