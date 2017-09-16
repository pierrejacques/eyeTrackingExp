function [rmat] = showUser(entCell, plotoption)
if nargin == 1
    plotoption = 'b';
end
    
load data
hold on
rmat = zeros(30, 1);
for user = 2:30
    entMat = entCell{user};
    rmat(user) = corr(entMat(pics)', score(pics)');
end

plot(rmat, plotoption);