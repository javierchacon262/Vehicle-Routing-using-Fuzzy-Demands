function fdem = fuzzyd(fzd)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Actual Customer Demand Calculation, SUPER IMPORTANT!!
m = 1;
r = 0;
while m > r
    dem = ranf(fzd);
    m = member(fzd, dem);
    r = rand(1);
end
fdem = [fzd(1), dem, fzd(3)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end