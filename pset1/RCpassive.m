%Cell Parameters

C = 10;        	   		% Capacitance in nF
R = 1;         	   		% Resistance in MegaOhm
Vrest = -70;      	   		% Leakage current reversal potential in mV


% Integration parameters

dt = 0.1;          		% integration time-step in ms
Tdur = 1000;       		% simulation total time in ms
V0 = Vrest;             		% initial condition in mV
k = ceil(Tdur/dt); 		% total number of iterations
V = zeros(1,k+1);  		% Voltage vector in mV
V(1)=V0;             		% assign to the first element of array V, the initial condition V0

% time vector

t = dt.*(0:k);     		% time vector in ms


% Current pulse parameters    

Tstart = 100;         		% curent pulse start time in ms
Tstop = 200;          		% curent pulse stop time in ms
Iamplitude = 0.1;     		% current pulse amplitude in nA


I = zeros(1,k+1);  		% current vector in nA
I(t>=Tstart & t<Tstop) = Iamplitude; % Assign amplitude when current is on 

% Integration with Exponential Euler loop
    for j = 1 : k
        Vinf = Vrest+R*I(j);  		% Update V infinity value at j iteration    
        V(j+1) = Vinf+(V(j)-Vinf)*exp((t(j)-t(j+1))/(R*C)); 		% Compute V at iteration j+1 with Exponential Euler rule  
    end
figure;
hold on
plot(t,V)
hold off
figure;
hold on
plot(t,I)
hold off