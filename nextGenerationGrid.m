function [grid] = nextGenerationGrid(grid,m,n,var) %here m and n are original dimensions of a grid

global h_threshold neighbourhood_size r_prob ;
for i=2:m+1
    for j = 2:n+1
        if grid(i,j)~=0
            h_val = calculate_happiness_of_a_cell(grid(i-1:i+1,j-1:j+1), grid(i,j));
            l = rand();
           
            if h_val < h_threshold || l<=r_prob
                x = grid(i,j);
                if (var == 1)
                    grid_ind  = relocate(grid,i,j,h_val);
                else
                    grid_ind  = relocate_schelling(grid,i,j,h_val);
                end
                grid(grid_ind(1),grid_ind(2)) = x;
                grid(i,j) = 0;
                if grid_ind(1) == i && grid_ind(2)== j
                    grid(i,j) = x;
                end
            end
        end
    end
end