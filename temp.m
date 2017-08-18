discCell3 = {};
weightlessCell3 = {};
heatCell3 = {};

for i = 1:120
    discCell3{i} = discCell{i};
    heatCell3{i} = heatCell{i};
    weightlessCell3{i} = weightlessCell{i};
end
for i = 120:300
    discCell3{i} = discCell0{i};
    heatCell3{i} = heatCell0{i};
    weightlessCell3{i} = weightlessCell0{i};
end
