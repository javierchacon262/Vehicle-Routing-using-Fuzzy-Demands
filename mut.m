function mutated = mut(crossed)
cr = crossed;
s = size(cr, 1);
s2 = size(cr, 2);
if s2 > 1
    for i = 1:s
        r1 = randi(ceil(s2/2));
        r2 = randi([ceil(s2/2)+1, s2]);
        n1 = cr(i, r1);
        n2 = cr(i, r2);
        cr(i, r1) = n2;
        cr(i, r2) = n1;
    end
end
mutated = cr;
end