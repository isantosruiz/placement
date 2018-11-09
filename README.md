# Placement of Pressure Sensors
Data files and MATLAB code for optimal placement of pressure sensors in water networks.

## Installation
Download the files and place them in a path accessible to MATLAB. Try the following code:
 ``` [MATLAB]
 >> Hanoi = epanet('Hanoi.inp');
 >> P = simulateLeaks(Hanoi,1:31,10:10:80);
 >> % Compute the best 5 locations to place pressure sensors
 >> sensors = placement(P,5)
 ```
