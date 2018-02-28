function [out] = calcSaccade()

load ../data
out = zeros(max(users), max(pics))
for pic = pics
    for user = users
        mat = fixations{user, pic};
        n = size(mat, 1);
        if n > 1
            for i = 1:n-1
                x1 = mat(i, 3);
                y1 = mat(i, 4);
                x2 = mat(i + 1, 3);
                y2 = mat(i + 1, 4);
                out(user, pic) = out(user, pic) + sqrt((x2 - x1)^2 + (y2 - y1)^2);
            end
        end
    end
end