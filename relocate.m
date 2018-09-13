function r = relocate(extGrid, x, y, curr_h_val)

global h_threshold;

r = zeros(2,1);
r(1) = x;
r(2) = y;
my_pop = extGrid(x,y);
[m ,n] = size(extGrid);
pos = find(extGrid==0);

empty_cells = zeros(length(pos),2);
ind = 1;
extGrid(x,y) = 3;
for i=1:m
    for j=1:n
        if(extGrid(i,j)==0)
            empty_cells(ind,1) = i;
            empty_cells(ind,2) = j;
            ind = ind + 1;
        end
    end
end
ind = ind -1;
check_empty = empty_cells;
h_val = zeros(ind,1);
for i=1:ind
    newi = check_empty(i,1);
    newj = check_empty(i,2);
    h_val(i) = calculate_happiness_of_a_cell(extGrid(newi-1:newi+1, newj-1:newj+1), my_pop);
end

[max_h_val, index_max] = max(h_val);
extGrid(x,y) = my_pop;

if max_h_val > curr_h_val
    r(1) = check_empty(index_max,1);
    r(2) = check_empty(index_max,2);
end

end