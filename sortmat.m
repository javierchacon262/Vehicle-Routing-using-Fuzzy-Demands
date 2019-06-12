function smat = sortmat(mat)
matab = struct2table(mat);
matab = sortrows(matab, 'clusCont');
smat = table2struct(matab);
end