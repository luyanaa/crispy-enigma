
% This program is written under MATLAB R2019a

fprintf("Problem 1\n")
fprintf("Loading randomwalk.mat\n")
load randomwalk.mat

figure;
plot(0:1000,X(14,:))
title('A plot of trajectory of particle 14 as a function of time')
xlabel('Time(msec)')
ylabel('Position(microns)')

fprintf("Problem 2\n")

fprintf("Problem 3\n")
fprintf("This is the nernst potential of K+ for a cell at 37C.")
NernstPotential(186,4.8,1,273+37)
fprintf("This is the nernst potential of Ca++ for a cell at 37C.")
NernstPotential(0.00005,1.5,2,273+37)