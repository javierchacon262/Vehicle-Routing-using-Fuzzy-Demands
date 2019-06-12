function evaluated = genetic(mat)
clus = mat.cterInt;
dep = mat.assigDep;
vehC = mat.vehCap;
depC = mat.depCap;
dems = mat.fuzzDems;
DPI = mat.DPI;
cust = mat.custom;
%Insert initial poblation method
iniPob = initial(clus);
if size(iniPob, 1) > 10000
    iniPob = iniPob(1:10000, :);
end
%Evaluation method
evaluated = evaluation(iniPob, cust, dems, dep, vehC, depC, DPI);
%For loop with genetic operators
s = size(evaluated, 1);
s2 = size(evaluated, 2);
sSel = size(iniPob, 1);
i = 1;
while i <= s && sSel > 2
    selected = selection(evaluated);
    if size(selected, 1) == 1
        disp("Cosas");
        evaluated = selected;
        break
    end
    selected(:, s2-2:end) = [];
    crossed = cross(selected);
    mutated = mut(crossed);
    evaluated = evaluation(mutated, cust, dems, dep, vehC, depC, DPI);
    sSel = size(evaluated, 1);
    i = i + 1;
end
end