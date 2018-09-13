function h_val = calculate_happiness_of_a_cell(arr, my_pop)

global h_threshold neighbourhood_size;

current_state = my_pop;
n_match = 0;
n_mismatch =0;
cnt_total=0;

for i=1:neighbourhood_size
    for j=1:neighbourhood_size
            if arr(i,j)~=3 && arr(i,j)~=0  %if no neighbour or boundry condition
            cnt_total = cnt_total +1;
                if arr(i,j)==current_state
                    n_match = n_match+1;
                else
                    n_mismatch = n_mismatch+1;
                end
            end
    end
end
% -1 since the cell itself needs to be subtracted
if cnt_total> 0 && arr(2,2)~=0 
    cnt_total = cnt_total-1;
    n_match = n_match-1;
end
if cnt_total==0
    h_val=0;
else
    h_val = (n_match)/(cnt_total); 
end

