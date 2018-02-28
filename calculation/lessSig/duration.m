function [all_mean, all_std, mean_mat] = duration()
load ../data

all_mean = zeros(1, max(pics));
all_std = zeros(1, max(pics));
mean_mat = zeros(max(users), max(pics));

for pic = pics
    v = [];
    for user = users
        dur_mat = fixations{user, pic}(:, 2);
        mean_mat(user, pic) = mean(dur_mat);
        v = [v;dur_mat];
    end
    all_mean(pic) = mean(v);
    all_std(pic) = std(v);
end

