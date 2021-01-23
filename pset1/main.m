
% This program is written under MATLAB R2019a

fprintf("Problem 1\n")
fprintf("Loading randomwalk.mat\n")
load randomwalk.mat

figure;
plot(0:1000,X(14,:))
title('A plot of trajectory of particle 14 as a function of time')
xlabel('Time(msec)')
ylabel('Position(microns)')

figure;
hold on
title('A plot of trajectory of particles as a function of time')
xlabel('Time(msec)')
ylabel('Position(microns)')
for n = 1:500
   plot(0:1000,X(n,:)) 
end
hold off

figure;
hold on
title('The mean displacement of particles as a function of time')
xlabel('Time(msec)')
ylabel('Mean Displacement(microns)')
plot(0:1000,mean(X,1))
hold off

figure;
hold on
title('The mean square displacement of the particles as a function of time')
xlabel('Time(msec)')
ylabel('Mean Displacement(microns)')
plot(0:1000,mean(X.^2,1))
hold off

x = 0:1000;
y = mean(X.^2,1);
Poly=polyfit(x, y,1);
fprintf("Diffusion Coefficent: %f\n", Poly(1)/2)
pause

fprintf("Problem 2\n")
RCpassive;
pause

fprintf("Problem 3\n")
fprintf("Nernst potential of K+ for a cell at 37C.: %f\n", NernstPotential(186,4.8,1,273+37))
fprintf("Nernst potential of Ca++ for a cell at 37C.: %f\n",NernstPotential(0.00005,1.5,2,273+37))
