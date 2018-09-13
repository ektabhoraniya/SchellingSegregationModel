clear all;
clc;
close all;

global BORDER h_threshold neighbourhood_size r_prob;
h_threshold = 0.67;         % fraction of like neighbours required = .67
r_prob = 0.0;               % The probability by which a happy agent relocates
red = 50;                   % percentage of the red population out of remaining cells
empty_p = 5;                % percentage of empty cells in the m*n grid
var = 1;                    % use var = 1 for modeified Schelling and var = 2 for Schelling's Model

neighbourhood_size = 3;     % Moore neighbourhood of 3X3
BORDER=3;                   % Border condition(absorbing condition)

m = 50;                     
n = 50;
noOfCells = m*n ;           % number of cells in the grid
Time = 200;  

red_p = (100 - empty_p)*red/100;  % actual percentage of red population in the grid
              
[tmp] = initPopulationGrid(m, n, empty_p, red_p, 100 - empty_p - red_p); % initialize the grid
grids(:, :, 1) = tmp;               % storing the configurations in the grids
empty = length(find(grids(:,:,1)==0));    % count number of empty cells
satisfaction = zeros(Time,1);

%%   Running the Simulation
for i=2:Time+1
    
    currGrid = grids(:,:,i-1);
    [extendedGrid, count_h] = extendPopulationGrid(m, n, currGrid);
    [tempGrid] = nextGenerationGrid(extendedGrid, m, n ,var);    %check for happiness in this generation
    count_ha(i-1) = count_h;                                % number of happy people
    count_s(i-1) = m*n - empty - count_h;                   % number of sad people
    grids(:,:,i) = tempGrid(2:(m + 1),2:(n + 1));
    if ( grids(:,:,i) == currGrid)                          %break condition (no more relocation possible)
        break
    end  
end


%% storing the simulation

v = VideoWriter(['' num2str(empty_p),'-' num2str(h_threshold),'-' num2str(red),'-' num2str(r_prob)]);
M = moviein(i);

map = [1 1 1; 1 0 0; 0 0 1];                   
colormap(map);

v.FrameRate = 2;
open(v);


for k = 1:(i)
    g = grids(:, :, k);
    image(g + 1)
    colormap(map);

    axis([0 m 0 n]);
    axis equal;
    axis off;
    M(k) = getframe;
    
    pause(0.3);
    writeVideo(v,M(k));
 
end
close(v);

%%  Plot the happy/unhappy percentege of total population
figure(2);
plot(0:i-2,count_s*100/(m*n-empty),'m','LineWidth',2);
hold on;
plot(0:i-2,count_ha*100/(m*n-empty),'g','LineWidth',2);
set(gca,'FontSize',12);
legend('Unhappy Percentage','Happy Percentage');
xlabel('Time in Arbitrary units');
ylabel('Percentage population');
title(['Population dynamics for similarity proportion = ' num2str(h_threshold), ', Empty cells = '...
    num2str(empty_p),'%, Population 1 = ' num2str(red_p),' %, m = ' num2str(r_prob)]); 
%%