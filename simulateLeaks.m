function [P,Y] = simulateLeaks(net,nodes,leaks)
%simulateLeaks  Compute all node pressures for different
%   leak scenarios in water networks.
%-------------------------------------------------------
%   Sintax
%       [P,Y] = simulateLeaks(net,nodes,leaks)
%-------------------------------------------------------
%   Arguments
%         net : EPANET model of the network to simulate
%       nodes : List of nodes with leaks
%       leaks : List of leakage flow rates
%           P : Pressure on each node
%           Y : Leaky-node number (for training)
%-------------------------------------------------------
%   Examples
%       net = epanet('Hanoi.inp');
%       node = 15; leak = 40;
%       [P,Y] = simulateLeaks(net,node,leak)
%       nodes = 1:31; leaks = 10:10:80;
%       [P,Y] = simulateLeaks(net,nodes,leak)
%-------------------------------------------------------
%   Ildeberto de los Santos Ruiz, 2018
%-------------------------------------------------------
net.solveCompleteHydraulics;
P = [];
Y = [];
for leak = leaks
    for node = nodes
        demand = net.getNodeBaseDemands{1}(node);
        net.setNodeBaseDemands(node,demand+leak);
        net.solveCompleteHydraulics;
        P = [P;net.getNodePressure];
        Y = [Y;node];
        net.setNodeBaseDemands(node,demand);
    end
end