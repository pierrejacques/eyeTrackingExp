function [meanCount, stdCount, H] = AOIfixcount()
% count the fixation numbers in each AOI of the page

load ../data
for pic = pics
    AOIcount = zeros(1, AOInum(pic));
    for user = users
         fix_mat = fixations{user, pic};
         map = AOImap{pic};
         n = size(fix_mat, 1);
         for i = 1:n
             x = fix_mat(i, 3);
             y = fix_mat(i, 4);
             if isValid(x, y)
                 AOI = map(x, y);
                 if AOI > 0
                     AOIcount(AOI) = AOIcount(AOI) + 1;
                 end
             end
         end
    end
   meanCount(pic) = mean(AOIcount);
   stdCount(pic) = std(AOIcount);
   H(pic) = entropy(AOIcount);
end
end

function bool = isValid(x, y)
    bool = x > 0 && x <= 1280 && y > 0 && y <= 800;
end

function H = entropy(v)
    v = v/sum(v)
    H = 0;
    for i = 1:length(v)
        H = H - v(i)*log(v(i))/log(2);
    end
end
