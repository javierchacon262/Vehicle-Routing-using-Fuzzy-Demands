function evaluated = evaluation(iniPob, cust, dems, dep, vehC, depC, DPI)
%Evaluation method
vecDist = [];
vCap = [vehC, vehC, vehC];
vCapIni = vehC;
s = size(iniPob, 1);
for i = 1:s
    [dist, dist2, sumd] = evalSol(iniPob(i, :), cust, dems, dep, vCap, vCapIni, depC, DPI);
    vecDist = [vecDist; [dist, dist2, sumd]];
end
evaluated = [iniPob, vecDist];
end