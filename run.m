%Run Start
clear
clc
close all
%Parameter Definition: instance lecture
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Empirical Parameters
DPI = 0.8;
API = 0.8;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Instances Parameters
inst = load('bcmanga.mat');
dpistr = num2str(DPI);
dpistr(dpistr == '.') = '';
apistr = num2str(API);
apistr(apistr == '.') = '';
dirname = strcat('bcmanga', dpistr, apistr);
mkdir(dirname);
dir = dirname;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Ix = inst.depotX;
Iy = inst.depotY;
Jx = inst.costumX;
Jy = inst.costumY;
depots = [Ix', Iy'];
custom = [Jx', Jy'];
%Distances calculating
E = [];
sc = size(custom, 1);
%Distance formula:
travCF = @(x1, y1, x2, y2) sqrt((x1-x2)^2 + (y1-y2)^2);
for i = 1:sc
    for j = 1:sc
        if i ~= j
            E = [E; [i, j,... 
                     custom(i, 1),...
                     custom(i, 2),... 
                     custom(j, 1),... 
                     custom(j, 2),... 
                     travCF(custom(i, 1),... 
                            custom(j, 1),... 
                            custom(i, 2),... 
                            custom(j, 2))]];
        end
    end
end

K = [];
vehCap = inst.vehCap;
depCap = inst.depCap;
dems = inst.demands';
DepCaps = zeros(size(depots, 1), 1);
for i = 1:size(depots, 1)
    DepCaps(i) = inst.depCap;
end
depCost = inst.openDepCost;
vehCost = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Phase 1: Depot Ranking
%Sum of distances:
W = [];
%Factor Pi/(Oi + Wi)
P = [];
for i = 1:size(depots, 1)
    dist = 0;
    for j = 1:size(custom, 1)
        dist = dist + travCF(depots(i, 1), depots(i, 2), custom(j, 1), custom(j, 2));
    end
    W = [W; dist];
    P = [P; [DepCaps(i)/(depCost * W(i)), i]];
end

%Order resulting P vector ascending
Ps = [P, depots];
Ps = sortrows(Ps, 1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Phase 2: Fuzzy Demands
fuzzDems = [];
d2Sum = 0;
for i = 1:size(dems, 1)
    [d1, d2, d3] = fuzzyn(dems(i));
    %initial d2 sumatory for the depot selection
    d2Sum = d2Sum + d2;
    fuzzDems = [fuzzDems; [d1, d2, d3]];
end

%Depot Selection based on the fuzzy demands
%number of deposits to be opened
depNum = ceil(d2Sum/inst.depCap);
ind1 = size(depots, 1) - depNum + 1;
ind2 = size(depots, 1);
%Depot selection statement
selDeps = Ps(ind1:end,:);
save('clusters.mat');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Phase 3: customer clustering
%random choose of the first customer to begin clustering
numc = inst.numCostum;
rCus = randi([1 numc], 1);
assigDep = [];
cterExt = [];
%Initial substraction from the vehicle capacity
%Definition of the fuzzy capacity for the vehicles and depots
clusCont = 1;
while size(cterExt, 1) < numc
    Q = [vehCap, vehCap, vehCap];    %Vehicles
    fzd = fuzzyd(fuzzDems(rCus, :));
    Q = capSubs(Q, fzd);
    cterInt = rCus;
    cterExt = [cterExt; rCus];
    %Evaluating customers in order of distance
    disl = seekDist(E, rCus);
    deadC = 0;
    binVar = 1;
    while binVar == 1 && size(disl, 1) > 0
        [bin, nCus, Q] = evalCus(disl, cterExt, fuzzDems, Q, DPI);
        if bin == 1
            cterInt = [cterInt; nCus];
            cterExt = [cterExt; nCus];
            if deadC == numc - size(cterInt, 1)
                binVar = 0;
                %Create the string for saving the cluster in a mat file
                str = strcat('/cluster', num2str(clusCont));
                clusCont = clusCont + 1;
                %Saving into the specified dir above specified in data
                %organization phase, SUPER IMPORTANT!!
                save(strcat(dir, str));
                %Find another non-clustered customer to start a new cluster
                %while ismember(rCus, cterExt) == 1
                %    rCus = randi([1 numc], 1);
                %end
                rCus = newClus(cterExt, numc);
            end
        else
            if deadC == numc - size(cterInt, 1)
                binVar = 0;
                %Create the string for saving the cluster in a mat file
                str = strcat('/cluster', num2str(clusCont));
                clusCont = clusCont + 1;
                %Saving into the specified dir above specified in data
                %organization phase, SUPER IMPORTANT!!
                save(strcat(dir, str));
                %Find another non-clustered customer to start a new cluster
                %while ismember(rCus, cterExt) == 1
                %    rCus = randi([1 numc], 1);
                %end
                rCus = newClus(cterExt, numc);
            end
            deadC = deadC + 1;
            %Delete customer that went non-factible to visit in the cluster
            disl(disl(:, 2) == nCus, :) = [];
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Cluster assignation
clusAssign(dir, API);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Genetic algorithm



    





