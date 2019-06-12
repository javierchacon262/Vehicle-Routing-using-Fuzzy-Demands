function [bin, cust2, cap] = evalCus(disl, clus, fzd, vcap, DPI)

%This function evaluates if a customer could be assigned to a cluster,
%taking into account intra-distance "disl" with the last customer assigned
%to the current cluster, the fuzzy demand for this new customer "fzd", and
%the capacity of the vehicle "vcap" and the DPI value "DPI"

%Parameters:
%    disl: list of the closest customers sorted by distance ascending.
%    clus: list of currently visited customers.
%    fzd: fuzzy estimated demand for the customer.
%    vcap: vehicle remaining capacity.
%    DPI: DPI value for comparisons whit the credibility.

%cust2 is the customer to be evaluated
%verifying that the customer to be evaluated is not already clustered

for i = 1:size(clus, 1)
    disl(disl(:, 2) == clus(i), :) = [];
end
if size(disl, 1) > 0
    cust2 = disl(1, 2);
    fzd1 = [fzd(cust2, 1), fzd(cust2, 2), fzd(cust2, 3)];
    %Decission between the fuzzy demand and the capacity of the vehicle
    fzd = fuzzyd(fzd1);
    cr = credVD(vcap, fzd);
    if cr >= DPI
        bin = 1;
        cap = capSubs(vcap, fzd);
    else
        bin = 0;
        cap = vcap;
    end
else
    bin = 0;
    cust2 = 0;
    cap = vcap;
end
end