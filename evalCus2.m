function [bin, cap, cust2] = evalCus2(cust, fzd, vcap, DPI)

%This function evaluates the customer to be visited next in the genetic algo,
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
if size(cust, 1) > 0
    cust2 = cust(1);
    fzd1 = fzd(cust2, :);
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
    cap = vcap;
end
end