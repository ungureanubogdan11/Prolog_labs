female(mary).
female(sandra).
female(juliet).
female(lisa).
male(peter).
male(paul).
male(dony).
male(bob).
male(harry).
parent(bob, lisa).
parent(bob, paul).
parent(bob, mary).
parent(juliet, lisa).
parent(juliet, paul).
parent(juliet, mary).
parent(peter, harry).
parent(lisa, harry).
parent(mary, dony).
parent(mary, sandra).


father_of(Father, Child) :- 
    parent(Father, Child), 
    male(Father).

mother_of(Mother, Child) :-
    parent(Mother, Child), 
    female(Mother).

grandfather_of(Grandfather, Child) :-
    parent(Grandfather, X),
    parent(X, Child),
    male(Grandfather).

grandmother_of(Grandmother, Child) :-
    parent(Grandmother, X),
    parent(X, Child),
    female(Grandmother).
    
sister_of(Sister, Person) :-
    female(Sister),
    parent(Parent, Sister),
    parent(Parent, Person),
    Sister \= Person.

brother_of(Brother, Person) :-
    male(Brother),
    parent(Parent, Brother),
    parent(Parent, Person),
    Brother \= Person.
    
aunt_of(Aunt, Person) :-
    female(Aunt),
    parent(Parent, Person),
    sister_of(Aunt, Parent).


uncle_of(Uncle, Person) :-
    male(Uncle),
    parent(Parent, Person),
    brother_of(Uncle, Parent).

person(X) :- male(X).
person(X) :- female(X).

not_parent(X,Y) :-
    person(X),
    person(Y), 
    X \= Y,
    \+ parent(X, Y).




    
    
    
    
    