file(file_name, date_created, date_modified, owner).
file("text.c", "01-01-2019", "03-10-2019", tom).
file("assignment.c", "12-03-2019", "11-11-2019", jerry).

access(file_name, [person1, person2]).
access("text.c", [tom, core, jerry]).
access("assignment.c", [tom, core, jerry]).

file_shared_by(F, X, Y) :-
    access(F, L),
    member(X, L),
    !,
    member(Y, L).

number_of_files_owned(N, X) :-
    findall(Y, file(Y, _, _, X), Bag),
    length(Bag, N).

parse_question(Q, A) :-
    Q = [how, many, files, does, X, own],
    number_of_files_owned(N, X),
    A = [X, owns, N, files].

parse_question(Q, A) :-
    Q = [does, N1, share, F, with, N2],
    file_shared_by(F, N1, N2),
    A = yes.

parse_question(Q, A) :-
    Q = [when, did, N, change, the, file, F],
    file(F, _, X, N),
    A = [N, changed, F, on, X].
