function [ pop ] = initPopulationGrid(m, n, empty, pop1, pop2)
pop = zeros(m,n);


p1 = m*n*pop1/100;
i=0;
while i<p1
    row = randperm(m,1);
    col = randperm(n,1);
    if pop(row,col)== 0
        pop(row,col) = 1;
        i=i+1;
    end
    
end

p2 = m*n*pop2/100;
i=0;
while i<p2
    row = randperm(m,1);
    col = randperm(n,1);
    if pop(row,col)== 0
        pop(row,col) = 2;
        i=i+1;
    end
end


end