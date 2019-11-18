odpowiedz(a).
odpowiedz(b).
odpowiedz(c).
odpowiedz(d).
odpowiedz(e).
odpowiedz(f).
odpowiedz(g).
odpowiedz(h).


:- dynamic(points/3).

final_profile :-
	check_answer_kl(1, K1),
	nl,
	check_answer_kl(2, K2),
	W is K1 + K2,
	write(' finalny wynik dla Kl: '),
	nl,
	write(W),
	nl.

check_answer_kl(X, K) :-
	points(X, A, J),
	nth1(X, [d, b, a, h, f, c, g], Elem),
	A = Elem,
	K is J.

belbin_test :- 
	write('Pierwsze pytanie: '),
	nl,
	write('Mysle, ze na moj wklad w prace zespolu sklada sie: '),
	nl,
	write('Wybierz odpowiedz a-h'),
	nl,
	read(Answer1),
	odpowiedz(Answer1),
	nl,
	write(' przydziel punkty od 0-10 '),
	nl,
	read(Punkty1),
	assertz(points(1, Answer1, Punkty1)),
	write('Drugie pytanie: '),
	nl,
	write('To co mi glownie przeszkadza w pracy w zespole to: '),
	nl,
	write('Wybierz odpowiedz a-h'),
	nl,
	read(Answer2),
	odpowiedz(Answer2),
	nl,
	write(' przydziel punkty od 0-10 '),
	nl,
	read(Punkty2),
	assertz(points(2, Answer2, Punkty2)),
	final_profile.
	
	
	
	
