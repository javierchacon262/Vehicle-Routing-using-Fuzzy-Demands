function GC = gravC(cluster)
cus = cluster.custom;
clu = cluster.cterInt;

A = 0;
B = 0;
s = size(clu, 1);
for i = 1:s
    A = A + cus(clu(i), 1);
    B = B + cus(clu(i), 2);
end
A = A/s;
B = B/s;
GC = [A, B];
end