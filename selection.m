function selected = selection(evaluated)
ev = evaluated;
s = size(evaluated, 1);
if mod(s, 2) == 0
    mit1 = ev(1:s/2, :);
    mit2 = ev(s/2+1:end, :);
else
    s = s - 1;
    mit1 = ev(1:s/2, :);
    mit2 = ev((s/2)+1:end, :);
end
mit1 = shuffle(mit1, 1);
mit2 = shuffle(mit2, 1);
sel = [];
s = s/2;
for i = 1:s
    if mit1(i, end) > mit2(i, end)
        sel = [sel; mit2(i, :)];
    else
        sel = [sel; mit1(i, :)];
    end
end
selected = sel;
end