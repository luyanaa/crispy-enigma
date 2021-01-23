# Problem Set 1

## Problem 1

1. Look at matrix X and determine the initial positon for all particles.

   ```matlab
   % Matrix to store positions
   X = zeros(numParticles, maxTime+1);
   ```

   Thus, the initial position for all particles is zero. 

2. What is the value of t for the last column of matrix X?

3. Plot the trajectory of particle 14 as a function of time.

   See the `main.m` for answer. 

4. In a single figure panel, plot the trajectory of all particles as a function of time. What do you see? Why each particle follows a different trajectory?

   See the `main.m` for pattern. Particle diffusion can be seen as a random walk. Thus, different trajectories can be observed. 

5. Plot the mean displacement of the particles as a function of time. Interpret this plot and discuss what is happening.

   See the `main.m` for pattern. Though time flows, the 1000 particles still locates near the O point. That's because in a random walk, 

6. Plot the mean square displacement of the particles as a function of time. Is there any trend in this plot? Explain.

   See the `main.m` for pattern. It's obvious that mean square displacement of a particle rises as time flows. 

7. Use the plot in question 6 to estimate the diffusion coefficient of these particles. Briefly explain the methodology implemented to estimate this quantity.

   Diffusion coefficent is estimated to be $0.498380$ . It is estimated that $D = \lim\limits_{t \to \infty} \frac{1}{2t} <|r(t)-r(0)|^2>$ , where $t=1$. 

## Problem 2

1. Draw the equivalent circuit model for this neuron, labeling intracellular space, extracellular space, membrane capacitance, and membrane resistance.

2. Calculate the total membrane conductance $G_{m}$  and the total membrane
   resistance $R_{m}$ for this modeled neuron.
   
3. Calculate the total membrane capacitance $C_{m}$ for this modeled neuron.

4. What is the analytical value of the time constant for this modeled neuron?

5. Complete the provided MATLAB code (file `RCpassive.m`, check for addtional instructions on code comments) to implement the exponential Euler scheme. Make sure that:
   - You set the cell’s capacitance, resistance, and resting potential (using the values calculated and defined above).
   - You set the initial condition $V_{0}$ (i.e. $V(t=0)$ ) to $V_{0} = V_{rest}$ and the current injected $I_e$ to $100 pA$ starting at $100ms$ and finishing at $200 ms$ .
   - Your code updates $V(t)$ at every time step using the exponential Euler method.

   See the `RCpassive.m` .

6. Simulate the cell for 1 second using a time-step of 0.1 ms. Plot the voltage as a function of time in one panel and the square current pulse in another.

   See the `RCpassive.m` .

7. From the previous plot estimate the time constant of the cell (Recall that as the voltage changes from $V_{0}$ to steady state, only $\frac{1}{e}$ of the total voltage change is left at time $t = \tau m$ ).

   See the `RCpassive.m`.

8. How does the value obtained in question 7 compares to the value obtained in question 4?

9. Show analytically (manipulate the equations, no MATLAB simulations) that equation 2.2 is indeed a solution to the RC differential equation 2.1.

   $\tau_m\frac{dV}{dt}=-(V_0-V_{rest}-R_mI_e)exp(-\frac{t-t_0}{\tau_m})$

10. Show analytically that equation 2.2 satisfies $V(t_{0})= V_{0}$  .

     $V(t_0)=V_{rest}+R_mI_e+(V_0-V_{rest}-R_mI_e)exp(-\frac{t-t_0}{\tau_m})=V_{rest}+R_mI_e+V_0-V_{rest}-R_mI_e=V_0$

11. Show analytically that for equation 2.2, as $t \to \infty$ , $V(t) → V_{rest} + R_m I_e = V_{\infty}$ also known as the steady state of the system.

    As $t \to \infty$, $\lim_\limits{t\to\infty}V(t)=V_{rest}+R_mI_e$, because $exp(-\frac{t-t_0}{\tau_m}) \to 0$.

12. Suppose the cell is at V_{rest} at at $t=0$, when a current step of $I_e = 500 pA$ is turned on. How long will it take for the cell to reach $-60 mV$ ? What is the steady state voltage for this value of $I_e$ ? Compute these answers analytically.

    - $V(t)=-60mV$ , solve the equation. 
    - $V_{\infty}=V_{rest}+R_mI_e=-60mV+0.5nA*1M\Omega=-59.5mV$

13. Let’s add an extra channel to our neuron. The extra channel has a resistance $R_{extra}$ and is added in parallel to the other components. Does this new channel make the membrane time constant slower or faster? Show calculations to support your conclusion.

    $R_m$ becomes smaller, thus $\tau_m=R_mC_m$ becomes faster. 

## Problem 3

1. Complete the starter code provided in function `NersntPotential.m` so that it calculates the Nernst potential in $mV$ , for ions of any arbitrary valence at a specified temperature in degrees Celsius.
2. Calculate the Nernst potentials of $K^+$ and of $Ca^{++}$ for this cell at 37C, using the function you wrote in question 1.

## Problem 4

1. Calculate the initial (before the channels open) number of potassium ions inside the cell.
2. What is the steady state membrane potential a long time after the channels open?
3. Calculate how much net charge must accumulate for the cell to reach steady state. Remember that the charge accumulated by a capacitor is $q=CV$ .
4. Calculate the net change in number of potassium ions. In which direction is this net flux?
5. How much does this flux of $K^+$ ions change the cell’s potassium concentration? Would this change affect the physiological properties of the neuron?