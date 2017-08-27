function []=showCanvas(map,colormax);
if nargin==1
    colormax=20;
end

   figure();
   pcolor(flipud(map'))
   shading flat
   caxis([0,colormax]);
