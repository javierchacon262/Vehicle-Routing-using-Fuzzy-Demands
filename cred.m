function cr = cred(d, r)
%This function calculates the credibility
%for a certain triangular fuzzy number "d"
%"cr" is the value for this calculation

%Demand estimation
d1 = d(1);
d2 = d(2);
d3 = d(3);

%As it is calculated taking into account that is going to be between d1 and
%d3, then the actual demand r only takes two possible decissions:
if r >= d1 && r <= d2
    cr = ((2*d2) - d1 - r)/2*(d2 - d1);
elseif r >= d2 && r <= d3
    cr = (d3 - r)/2*(d3 - d2);
end
end