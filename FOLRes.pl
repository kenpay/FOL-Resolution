appendRestOfList([],[]).
appendRestOfList([H|T], R) :- appendRestOfList(T, R1), append([H], R1, R).

resolvent3(XP, X, H, Res) :- X = n(P) -> delete(XP, X, L1), delete(H, P, L2), append(L1, L2, L3), list_to_set(L3, Res);  delete(XP, X, L1), delete(H, n(X), L2), append(L1, L2, L3), list_to_set(L3, Res).
resolvent2(XP, X, [H|T], Res, T1) :- member(n(X), H) -> resolvent3(XP, X, H, Res), T1 = T; X = n(P), member(P, H) -> resolvent3(XP, X, H, Res), T1 = T; resolvent2(XP, X, T, Res, T2), append(T2, [H], T1).
resolvent1(XP, [H1| T1], T, Acc) :- resolvent2(XP, H1, T, Res, T2) -> appendRestOfList(T2, Acc1), append([Res], Acc1, Acc); resolvent1(XP, T1, T, Acc). 
              
res(KB) :- member([], KB).
res([H|T]) :- resolvent1(H, H, T, NewKB), res(NewKB), !.