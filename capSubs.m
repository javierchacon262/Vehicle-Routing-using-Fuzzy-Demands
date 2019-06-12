function cap = capSubs(Q, fzd)
cap = Q;
cap(1) = cap(1) - fzd(3);
cap(2) = cap(2) - fzd(2);
cap(3) = cap(3) - fzd(1);
end