apaga(X,[X|Y],Y).
apaga(A,[B|C],[B|D]) :- apaga(A,C,D).

crialista(0,[]).
crialista(N,[N|L]):-N > 0, N1 is N-1, crialista(N1,L).

criasup(0,[]).
criasup(N,DS) :- N2 is N - 1, N1 is -1 * (N-1), findall(X,between(N1,N2,X),DS).

criainf(0,[]).
criainf(N,DI) :- N3 is 2*N, findall(X,between(2,N3,X),DI).

solucao(N,S) :- 
     crialista(N,L),
     criasup(N,DS),
     criainf(N,DI),
     resolve(S,L,L,DS,DI),
     imprime(N,S).

resolve([],[],_,_,_).
resolve([C|LC],[L|LL],CO,DS,DI):-
    apaga(C,CO,CO1),
    NS is L - C,
    NI is L + C,
    apaga(NS,DS,DS1),
    apaga(NI,DI,DI1),
    resolve(LC,LL,CO1,DS1,DI1).

compare(X,Y) :- (X == Y, write('R ')) ; ( X =\= Y , write('. ')).

imprime(_,[]) :- write(' ').
imprime(N,[A|B]) :- forall(between(1,N,X),compare(X,A)), nl, imprime(N,B).
