function [deps] = clusAssign(direc, API)
a = dir([direc '/*.mat']);
s = size(a, 1);
%Mat files vector load
mat = loadMat(s, a);
mat = sortmat(mat);
sd = size(mat(1).Ps, 1);
numC = mat(1).numc;
%Cluster assignation evaluation
i = 1;
cont = 0;
%depots to be opened
deps = [];
while cont < s
    v = sd+1-i;
    [inds, depot] = evalClus(direc, mat, v, API);
    cont = cont + inds;
    dep = mat(1).Ps(depot, :);
    deps = [deps; dep];
    %Mat file reload to take into account the changes
    mat = loadMat(s, a);
    mat = sortmat(mat);
    i = i + 1; 
end
end