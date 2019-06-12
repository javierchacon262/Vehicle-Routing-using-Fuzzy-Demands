function cr = credVD(Cap, fzd)

vc = Cap;
if fzd(1) > vc(3)
    cr = 0;
elseif fzd(1) <= vc(3) && fzd(2) >= vc(2)
    cr = (vc(3) - fzd(1))/(2 * (vc(3) - fzd(1) + fzd(2) - vc(2)));
elseif fzd(2) < vc(2) && fzd(3) >= vc(1)
    cr = (fzd(3) - vc(1) - (2 * (fzd(2) - vc(2))))/(2 * (vc(2) - fzd(2) + fzd(3) - vc(1)));
elseif fzd(3) < vc(1)
    cr = 1;
end

end