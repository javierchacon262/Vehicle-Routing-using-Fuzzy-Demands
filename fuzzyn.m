function [d1, d2, d3] = fuzzyn(d)
d1 = d;
d3 = 3 * d1;
d11 = 1.5 * d1;
d31 = 2.5 * d1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%d2 Calculation,  SUPER IMPORTANT
d2 = (d31 - d11) * rand(1) + d11;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end