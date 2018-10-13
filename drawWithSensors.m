function drawWithSensors(net,sensors,bLabels,cmd,fileName)
%drawWithSensors  Draw a water network and place marks on
%   the nodes corresponding to the pressure sensors.
%--------------------------------------------------------
%   Sintax
%       drawWithSensors(net,sensors,bLabels,cmd,fileName)
%--------------------------------------------------------
%   Arguments
%            net : EPANET model of the network to draw
%        sensors : List of nodes with sensors
%        bLabels : Logical value that indicates if nodes
%                  with sensors should be labeled
%            cmd : Additional command to execute before
%                  to print the file
%       fileName : Name to save a PDF file (optional)
%--------------------------------------------------------
%   Examples
%       net = epanet('Hanoi.inp');
%       sensors = [12,21,27];
%       drawWithSensors(net,sensors,true,'legend hide')
%       drawWithSensors(net,sensors,0,'','Hanoi.pdf')
%--------------------------------------------------------
%   Ildeberto de los Santos Ruiz, 2018
%--------------------------------------------------------
net.plot;
p = net.getNodeCoordinates(sensors);
line(p(:,1),p(:,2),'LineStyle','none','Marker','pentagram',...
    'MarkerSize',16,'MarkerFaceColor',[1,1,0],...
    'MarkerEdgeColor','red')
l = legend;
l.String{end} = 'Sensors';
if nargin > 2
    if bLabels
        for k = 1:length(sensors)
            text(p(k,1),p(k,2),num2str(sensors(k)));
        end
    end
end
if nargin > 3
    if not(isempty(cmd))
        eval(cmd)
    end
end
if nargin > 4
    set(gcf,'Color','white','Units','normalized',...
        'OuterPosition',[0 0 1 1])
    export_fig(fileName)
end