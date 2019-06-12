function crossed = cross(selected)
sel = selected;
s2 = size(sel, 2);
cros = [];
if mod(size(sel, 1), 2)
    %Case when the selected number is odd
    s1 = size(sel, 1) - 1;
    i = 1;
    %Ciclo para los normales
    while i < s1
        cros = [cros; sel(i, :)];
        cros = [cros; sel(i+1, :)];
        r1 = randi(s2);
        r2 = randi(s2);
        while r1 == r2 && s2 > 1
            r2 = randi(s2);
        end
        cr1 = sel(i, :);
        cr2 = sel(i+1, :);
        n11 = cr1(r1);
        n12 = cr1(r2);
        n21 = cr2(r1);
        n22 = cr2(r2);
        cr1(r1) = n21;
        cr1(r2) = n22;
        cr2(r1) = n11;
        cr2(r2) = n12;
        if length(unique(cr1)) == s2
            cros = [cros; cr1];
        end
        if length(unique(cr2)) == s2
            cros = [cros; cr2];
        end
        i = i + 2;
    end
    %Caso especial
    cros = [cros; sel(end, :)];
    r1 = randi(s2);
    r2 = randi(s2);
    while r1 == r2 && s2 > 1
        r2 = randi(s2);
    end
    cr1 = sel(end, :);
    cr2 = sel(end-1, :);
    n11 = cr1(r1);
    n12 = cr1(r2);
    n21 = cr2(r1);
    n22 = cr2(r2);
    cr1(r1) = n21;
    cr1(r2) = n22;
    cr2(r1) = n11;
    cr2(r2) = n12;
    if length(unique(cr1)) == s2
        cros = [cros; cr1];
    end
    if length(unique(cr2)) == s2
        cros = [cros; cr2];
    end
else
    %Case when the selected number is even
    s1 = size(sel, 1);
    i = 1;
    while i < s1
        cros = [cros; sel(i, :)];
        cros = [cros; sel(i+1, :)];
        r1 = randi(s2);
        r2 = randi(s2);
        while r1 == r2 && s2 > 1
            r2 = randi(s2);
        end
        cr1 = sel(i, :);
        cr2 = sel(i+1, :);
        n11 = cr1(r1);
        n12 = cr1(r2);
        n21 = cr2(r1);
        n22 = cr2(r2);
        cr1(r1) = n21;
        cr1(r2) = n22;
        cr2(r1) = n11;
        cr2(r2) = n12;
        if length(unique(cr1)) == s2
            cros = [cros; cr1];
        end
        if length(unique(cr2)) == s2
            cros = [cros; cr2];
        end
        i = i + 2;
    end
end
crossed = cros;
end