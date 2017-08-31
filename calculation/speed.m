function [out] = speed()
load data
out = [];
for pic = pics
    out(pic) = 0;
    for user = users
        mat = fixations{user, pic};
        n = size(mat, 1);
        if n > 1
            for i = 1:n-1
                x1 = mat(i, 3);
                y1 = mat(i, 4);
                x2 = mat(i + 1, 3);
                y2 = mat(i + 1, 4);
                out(pic) = out(pic) + sqrt((x2 - x1)^2 + (y2 - y1)^2);
            end
        end
    end
    out(pic) = out(pic) / 30;
end