function [cont, depot] = evalClus(dir, mat, depot, API)
dismat = [];
cont = 0;
s = size(mat, 1);
depCap = mat(1).DepCaps(1);
for i = 1:s
    rDep = mat(i).Ps(depot, :);
    %Gravity center calculation for i-th cluster
    gc = gravC(mat(i));
    %First evaluation: Distance between the cluster to the (end-i+1)-depot
    %Save i: cluster number; gc: gravity center; distance to depot
    dis = euc(gc(1), gc(2), rDep(3), rDep(4));
    dismat = [dismat; [i, gc, dis]];
end
dismat = sortrows(dismat, 4);
bin = 1;
i = 1;
fzdCap = [depCap, depCap, depCap];
while bin == 1 && i <= s
    ind = dismat(i, 1);
    mat_i = mat(ind);
    %Check if the cluster_i has depot or not
    if size(mat_i.assigDep, 2) == 0
        sDem_i = sumClusDem(mat_i);
        cr_i = credVD(fzdCap, sDem_i);
        %Credibility evaluation with API
        if cr_i > API
            fzdCap = fzdCap - sDem_i;
            fileName = strcat(dir, '/cluster', num2str(ind), '.mat');
            assigDep = mat(i).Ps(depot, :);
            save(fileName, 'assigDep', '-append');
            i = i + 1;
            cont = cont + 1;
        else
            bin = 0;
        end
    else
        i = i + 1;
    end
end
end