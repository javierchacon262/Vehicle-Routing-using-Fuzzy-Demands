function perm = initial(cust)
perm = [];
s = size(cust, 1);
if s <= 3
    for i = 1:10
        j = randperm(s);
        perm = [perm; cust(j, :)'];
    end
elseif s > 3 && s <= 6
    for i = 1:100
        j = randperm(s);
        perm = [perm; cust(j, :)'];
    end
elseif s > 6 && s <= 9
    for i = 1:1000
        j = randperm(s);
        perm = [perm; cust(j, :)'];
    end
elseif s > 9
    for i = 1:10000
        j = randperm(s);
        perm = [perm; cust(j, :)'];
    end
end
end