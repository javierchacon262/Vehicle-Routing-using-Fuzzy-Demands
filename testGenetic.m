%Genetic algorithm
clear
clc
%Empirical Parameters
DPI = 0.8;
API = 0.5;
dirstr1 = 'bcmanga';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Instances Parameters
dpistr = num2str(DPI);
dpistr(dpistr == '.') = '';
apistr = num2str(API);
apistr(apistr == '.') = '';
dirname = strcat(dirstr1, dpistr, apistr, 'solved');
dirname2 = strcat(dirstr1, dpistr, apistr);
mkdir(dirname);
a = dir([dirname2 '/*.mat']);
s = size(a, 1);
%Mat files vector load
mat = loadMat(s, a);
solution = 0;
extraD = 0;
planedR = 0;
time = 0;
for i = 1:s
    tic
    solved = genetic(mat(i));
    time = time + toc;
    s2 = size(solved, 2);
    tmp = solved(:,s2); 
    [~, ind]=min(tmp);
    planedR = planedR + solved(ind, s2 - 2);
    extraD = extraD + solved(ind, s2 - 1);
    solution = solution + solved(ind, end);
    %str1 = strcat('solved', num2str(i));
    str2 = a(i).name;
    str3 = strcat(dirname, '/', str2);
    save(str3);
end
