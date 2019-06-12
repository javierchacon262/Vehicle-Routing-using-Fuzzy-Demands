function mat = loadMat(s, a)
mat = [];
for i = 1:s
    %Load variables from mat file
    file = fullfile(a(i).folder, a(i).name);
    mat = [mat; load(file)];
end
end