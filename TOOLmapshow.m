function []=TOOLmapshow(num,colormax,stim)
if nargin<=2
    load RAWstimulus.mat
    stim = DATstim;
end
if nargin<=1
    colormax=0.001;
end

if isfield(stim{num},'heatmap')
    map = stim{num}.heatmap;
else
    disp('please calculate heatmap first');
    return;
end

   figure();
   pcolor(flipud(map'))
   shading flat
   caxis([0,colormax]);
