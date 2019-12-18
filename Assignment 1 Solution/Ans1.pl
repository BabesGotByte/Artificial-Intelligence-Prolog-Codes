evenlength([]).
evenlength([_|A]) :- oddlength(A).

oddlength([_]).
oddlength([_|A]) :- evenlength(A).
