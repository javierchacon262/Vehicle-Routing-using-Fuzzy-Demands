function [dist, dist2, sumd] = evalSol(clus, cust, dems, dep, vCap, vCapIni, dCap, DPI)
clust = [];
dist = 0;
dist2 = 0;
vfzcap = vCap;
depCoord = dep(3:4);
xd = depCoord(1, 1);
yd = depCoord(1, 2);
s = size(clus, 2);
i = 0;
while i < s
    [bin, cap, cust1] = evalCus2(clus, dems, vfzcap, DPI);
    vfzcap = cap;
    xc = cust(cust1, 1);
    yc = cust(cust1, 2);
    if bin
        dist = dist + euc(xc, yc, xd, yd);
        clust = [clust, cust1];
        cst1 = cust(clus(end), :);
        xd = cst1(1, 1);
        yd = cst1(1, 2);
        clus(1) = [];
        i = i + 1;
    else
        xd = depCoord(1, 1);
        yd = depCoord(1, 2);
        dist2 = dist2 + euc(xc, yc, xd, yd);
        dCap = dCap - (vCapIni - vfzcap(2));
        vfzcap = vCap;
    end
end
sumd = dist + dist2;
end