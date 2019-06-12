function sortVec = seekDist(E, ind)
%this function returns a matrix with the closest customers ordered by the
%distance in ascending way. it has as parameters E which is the full matrix
%of distnaces between customers and ind which is the customer for which we
%are asking the closest customers.

selInd = [];
se = size(E, 1);
for i = 1:se
    if E(i, 1) == ind
        selInd = [selInd; E(i, :)];
    end
end
sortVec = sortrows(selInd, 7);
end