function [out] = generateSeq(pic)

load ../data

map = AOImap{pic};
out = cell(max(users), 1);
for user = users
    fixmat = fixations{user, pic};
    n = size(fixmat, 1);
    lastAOI = 0;
    str = '';
    for i = 1:n
        x = fixmat(i, 3);
        y = fixmat(i, 4);
        if isValid(x, y)
            AOI = map(x, y);
            if AOI > 0 && AOI ~= lastAOI
                if lastAOI
                    str = strcat(str, ' -> ');
                end
                str = strcat(str, num2str(AOI));
                lastAOI = AOI;
            end
        end
    end
    out{user} = str;
end
end

function [bool] = isValid(x, y)
bool = (x>0 && x<=1280 && y>0 && y<=800);
end
