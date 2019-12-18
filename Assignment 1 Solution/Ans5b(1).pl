plit( [ ], [ ], [ ] ).

split( [HP | TL], [HP | TP], N) :- 
HP >= 0,
split( TL, TP, N ).

split( [HN | TL], P, [HN | TN]) :- 
HN <0,
split( TL, P, TN ).


