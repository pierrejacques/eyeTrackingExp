function out = to1(in)
%归一化的函数

load data
out = in./log(sum(fixLen));