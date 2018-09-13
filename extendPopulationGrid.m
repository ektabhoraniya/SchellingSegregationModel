function [ ex_pop, count ] = extendPopulationGrid(m,n,pop)
ex_pop = zeros(m+2,n+2);

global BORDER h_threshold neighbourhood_size;

for i=2:m+1
    for j = 2:n+1
        ex_pop(i,j) = pop(i-1,j-1);
    end
end

for i =1:m+2
    ex_pop(i,n+2) = BORDER;
    ex_pop(i,1) = BORDER;
end

for i = 2:n+1
    ex_pop(1,i)  = BORDER;
    ex_pop(m+2,i) = BORDER;
end
count = 0;
for i=2:m+1
    for j=2:n+1
        if(ex_pop(i,j)~=0)
            if (calculate_happiness_of_a_cell(ex_pop(i-1:i+1,j-1:j+1),ex_pop(i,j)) >= h_threshold)
                count = count+1;
            end
        end
    end
end
end