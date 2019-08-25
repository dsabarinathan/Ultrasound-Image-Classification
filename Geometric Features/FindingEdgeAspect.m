function Aspect = FindingEdgeAspect(BW)

BW2 = edge(BW);
[r1,c1] = find(BW2);
X2 = max(r1);
X1 = min(r1);
X = X2 - X1;
Y2 = max(c1);
Y1 = min(c1);
Y = Y2 - Y1;

Aspect  = Y/X ;

end