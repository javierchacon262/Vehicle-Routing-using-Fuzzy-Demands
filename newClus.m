function rcus = newClus(cterExt, numc)
vec = 1:numc;
for i = 1:size(cterExt, 1)
    vec(vec == cterExt(i)) = [];
end
if size(vec, 2) > 0
    rcus = randsample(vec, 1);
else
    rcus = 0;
end
end