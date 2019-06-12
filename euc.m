function dist = euc(x1, y1, x2, y2)
eucF = @(x1, y1, x2, y2) sqrt((x1-x2)^2 + (y1-y2)^2);
dist = eucF(x1, y1, x2, y2);
end