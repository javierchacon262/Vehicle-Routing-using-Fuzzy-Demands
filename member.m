function m = member(fzd, d)
if d > fzd(1) && d<= fzd(2)
    m = (d - fzd(1))/(fzd(2) - fzd(1));
elseif d > fzd(2) && d < fzd(3)
    m = (fzd(3) - d)/(fzd(3) - fzd(2));
end
end