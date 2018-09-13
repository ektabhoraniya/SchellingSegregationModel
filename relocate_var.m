function r = relocate_var(extGrid, x, y, curr_h_val)

global  w ;
w = 2;
r = zeros(2,1);
r(1) = x;
r(2) = y;
my_pop = extGrid(x,y);
[m ,n] = size(extGrid);

while true
    i = randi(m,1);
    j = randi(n,1);
    if (extGrid(i,j) == 0)
        r(1) = i;
        r(2) = j;
        break;
    end

end