function [dSum] = sumClusDem(mat)
cter = mat.cterInt;
dems = mat.fuzzDems;
s = size(cter, 1);
dSum = [0, 0, 0];
for i = 1:s
    dSum = dSum + dems(cter(i), :);
end
end