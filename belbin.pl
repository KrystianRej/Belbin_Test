odpowiedz(a).
odpowiedz(b).
odpowiedz(c).
odpowiedz(d).
odpowiedz(e).
odpowiedz(f).
odpowiedz(g).
odpowiedz(h).

:- dynamic(points/2).

points(KL, 15).
final_profile :-
	write(Z),
	nl,
	write(' finalny wynik dla Kl: '),
	nl.


sumujKL1(Answer, Punkty1) :- 
	Answer = d,
	assertz(points(KL, Punkty1)).
	
sumujKL2(Answer, Punkty2) :- 
	Answer = b,
	assertz(points(KL, Punkty2)).

sumujKL3(Answer, Punkty3) :- 
	Answer = a,
	assertz(points(KL, Punkty3)).

sumujKL4(Answer, Punkty4) :- 
	Answer = h,
	assertz(points(KL, Punkty4)).

sumujKL5(Answer, Punkty5) :- 
	Answer = f,
	assertz(points(KL, Punkty5)).

sumujKL6(Answer, Punkty6) :- 
	Answer = c,
	assertz(points(KL, Punkty6)).
	
sumujKL7(Answer, Punkty7) :- 
	Answer = g,
	assertz(points(KL, Punkty7)).
	
	
	
	
nieSumujKL1(Answer) :- 
	write(Answer),
	\+ (Answer = d),
	Punkty1 = 0,
	assertz(points(KL, Punkty1)).
	
nieSumujKL2(Answer) :- 
	\+ (Answer = b),
	Punkty2 = 0,
	assertz(points(KL, Punkty2)).

nieSumujKL3(Answer) :- 
	\+ (Answer = a),
	Punkty13 = 0,
	assertz(points(KL, Punkty3)).

nieSumujKL4(Answer) :- 
	\+ (Answer = h),
	Punkty4 = 0,
	assertz(points(KL, Punkty4)).

nieSumujKL5(Answer) :- 
	\+ (Answer = f),
	Punkty5 = 0,
	assertz(points(KL, Punkty5)).

nieSumujKL6(Answer) :- 
	\+ (Answer = c),
	Punkty6 = 0,
	assertz(points(KL, Punkty6)).
	
nieSumujKL7(Answer) :- 
	\+ (Answer = g),
	Punkty7 = 0,
	assertz(points(KL, Punkty7)).


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
	sumujKL1(Answer1, Punkty1),
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
	sumujKL2(Answer2, Punkty2),
	write('Trzecie pytanie: '),
	nl,
	write('Kiedy jestem zaangażowany w projekt wspólnie z innymi: '),
	nl,
	write('Wybierz odpowiedz a-h'),
	nl,
	read(Answer3),
	odpowiedz(Answer3),
	nl,
	write(' przydziel punkty od 0-10 '),
	nl,
	read(Punkty3),
	sumujKL3(Answer3, Punkty3),
	write('Czwarte pytanie: '),
	nl,
	write('Moje charakterystyczne podejscie do pracy w zespole polega na tym, ze: '),
	nl,
	write('Wybierz odpowiedz a-h'),
	nl,
	read(Answer4),
	odpowiedz(Answer4),
	nl,
	write(' przydziel punkty od 0-10 '),
	nl,
	read(Punkty4),
	sumujKL4(Answer4, Punkty4),
	write('Piate pytanie: '),
	nl,
	write('W swoich dzialaniach szczegolnie lubie: '),
	nl,
	write('Wybierz odpowiedz a-h'),
	nl,
	read(Answer5),
	odpowiedz(Answer5),
	nl,
	write(' przydziel punkty od 0-10 '),
	nl,
	read(Punkty5),
	sumujKL5(Answer5, Punkty5),
	write('Szoste pytanie: '),
	nl,
	write('Kiedy nagle dostane trudne zadanie, malo czasu i nieprzychylnych ludzi: '),
	nl,
	write('Wybierz odpowiedz a-h'),
	nl,
	read(Answer6),
	odpowiedz(Answer6),
	nl,
	write(' przydziel punkty od 0-10 '),
	nl,
	read(Punkty6),
	sumujKL6(Answer6, Punkty6),
	write('Siodme pytanie: '),
	nl,
	write('Mam problemy w pracy w grupie w zwiazku z tym, ze: '),
	nl,
	write('Wybierz odpowiedz a-h'),
	nl,
	read(Answer7),
	odpowiedz(Answer7),
	nl,
	write(' przydziel punkty od 0-10 '),
	nl,
	read(Punkty7),
	sumujKL7(Answer7, Punkty7),
	final_profile.
	
	
	
	
