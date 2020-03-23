
/*
Majors: Accounting, Computer Science, Engineering, History, English
Cars: Ford, Chevy, Nissan, Toyota, Tesla
Sports teams: Royals, Chiefs, Yankees, Broncos, Cubs
Music: Classical, Country, Jazz, Rock, Techno
Drinks: Coke, Coffee, Tea, Milk, Water
*/

register_renderer/2

:- use_rendering(table,
         [header(dorm('Major', 'Car', 'Team', 'Music', 'Drink'))]).

csMusic(Music) :-
  dorms(Dorms),
  member(dorm(computerscience,_,_,Music,_),Dorms).

engDrink(Drink) :-
  dorms(Dorms),
  member(dorm(english,_,_,_,Drink),Dorms).

dorms(Dorms) :-
      length(Dorms, 5),

% 1.  The computer science student lives in the middle of the corridor.
      Dorms = [_,_,(dorm(computerscience,_,_,_,_)),_,_],
% 2.  The history major is a jazz fan.
      member(dorm(history,_,_,jazz,_),Dorms),
% 3.  The Yankees fan drives a Toyota.
      member(dorm(_,toyota,yankees,_,_),Dorms),
% 4.  The accounting major drinks Coke.
      member(dorm(accounting,_,_,_,coke),Dorms),
% 5.  The engineering major drinks coffee.
      member(dorm(engineering,_,_,_,coffee),Dorms),
% 6.  The computer science student and history student are neighbors.
      adjacent((dorm(computerscience,_,_,_,_)),(dorm(history,_,_,_,_)),Dorms),
% 7.  The student at the far end of the hall likes classical music.
      Dorms = [_,_,_,_,(dorm(_,_,_,classical,_))],
% 8.  The tea drinker drives a Tesla.
      member(dorm(_,tesla,_,_,tea),Dorms),
% 9.  The classical music fan lives next to the jazz listener.
      adjacent((dorm(_,_,_,classical,_)),(dorm(_,_,_,jazz,_)),Dorms),
% 10. The English major does not live in either of the first two rooms. (Must also declare that an English major lives somewhere).
      member(dorm(english,_,_,_,_),Dorms),
      not(Dorms = [dorm(english,_,_,_,_),_,_,_,_]),
      not(Dorms = [_,dorm(english,_,_,_,_),_,_,_]),
% 11. The Royals fan drives a Tesla.
      member(dorm(_,tesla,royals,_,_),Dorms),
% 12. The Cubs fan listens to jazz.
      member(dorm(_,_,cubs,jazz,_),Dorms),
% 13. The engineering major follows the Chiefs
      member(dorm(engineering,_,chiefs,_,_),Dorms),
% 14. The first room is the home of the Broncos fan
      Dorms = [dorm(_,_,broncos,_,_),_,_,_,_],
% 15. The Coke drinker drives a Nissan.
      member(dorm(_,nissan,_,_,coke),Dorms),
% 16. The country music fan and the techno fan are neighbors.
      adjacent((dorm(_,_,_,country,_)),(dorm(_,_,_,techno,_)),Dorms),
% 17. The accounting major lives in the first room.
      Dorms = [dorm(accounting,_,_,_,_),_,_,_,_],
% 18. The fans of the 2 Kansas City teams (Chiefs and Royals) are neighbors
      adjacent((dorm(_,_,chiefs,_,_)),(dorm(_,_,royals,_,_)),Dorms),
% 19. The accounting major listens to rock music
      member(dorm(accounting,_,_,rock,_),Dorms),
% 20. The Yankees fan drinks milk.
      member(dorm(_,_,yankees,_,milk),Dorms),
% 21. The Chevy driver listens to country music.
      member(dorm(_,chevy,_,country,_),Dorms),
% 22. The jazz fan drives a Ford.
      member(dorm(_,ford,_,jazz,_),Dorms),
% 23. Water isnt used (water drinker is never mentioned, but there must be one).
      member(dorm(_,_,_,_,water),Dorms).

% Functions to test adjacency
next(A, B, List) :- append(_, [A,B|_], List).
next(A, B, List) :- append(_, [B,A|_], List).
adjacent(A,B,List) :- next(A,B,List); next(B,A,List).


/*
Queries:
dorms(Dorms). - Get the output of all attributes in each dorm rooms.
csMusic(Music). - Find the type of music the cs major listens to.
engDrink(Drink). - Find the type of drink the english major drinks.
*/