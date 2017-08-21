discCell3 = {};
weightlessCell3 = {};
heatCell3 = {};

for i = 1:300
    discCell3{i} = disc{i};
    heatCell3{i} = heat{i};
    weightlessCell3{i} = weightless{i};
end
for i = 300:400
    discCell3{i} = discCell0{i};
    heatCell3{i} = heatCell0{i};
    weightlessCell3{i} = weightlessCell0{i};
end
