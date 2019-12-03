:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_client)).
:- http_handler('/', web_form, []).

server(Port) :-
        http_server(http_dispatch, [port(Port)]).


web_form(_Request) :-
	reply_html_page(
	    title('POST demo'),
	    [
	     form([action='/landing', method='POST'], [
		p([], [
		  label([for=pytanie1],'Pytanie 1:'),
		  input([name=pytanie1, type=textarea])
		      ]),
		p([], [
		  label([for=punkty1],'Ilosc punktow:'),
		  input([name=punkty1, type=number])
		      ]),
		p([], [
		  label([for=pytanie2],'Pytanie 2'),
		  input([name=pytanie2, type=textarea])
		      ]),
		p([], [
		  label([for=punkty2],'Ilosc punktow:'),
		  input([name=punkty2, type=number])
		      ]),
		p([], [
		  label([for=pytanie3],'Pytanie 3'),
		  input([name=pytanie3, type=textarea])
		      ]),
		p([], [
		  label([for=punkty3],'Ilosc punktow:'),
		  input([name=punkty3, type=number])
		      ]),
		p([], [
		  label([for=pytanie4],'Pytanie 4'),
		  input([name=pytanie4, type=textarea])
		      ]),
		p([], [
		  label([for=punkty4],'Ilosc punktow:'),
		  input([name=punkty4, type=number])
		      ]),
		p([], [
		  label([for=pytanie5],'Pytanie 5'),
		  input([name=pytanie5, type=textarea])
		      ]),
		p([], [
		  label([for=punkty5],'Ilosc punktow:'),
		  input([name=punkty5, type=number])
		      ]),
		p([], [
		  label([for=pytanie6],'Pytanie 6'),
		  input([name=pytanie6, type=textarea])
		      ]),
		p([], [
		  label([for=punkty6],'Ilosc punktow:'),
		  input([name=punkty6, type=number])
		      ]),
		p([], [
		  label([for=pytanie7],'Pytanie 7'),
		  input([name=pytanie7, type=textarea])
		      ]),
		p([], [
		  label([for=punkty7],'Ilosc punktow:'),
		  input([name=punkty7, type=number])
		      ]),
		p([], input([name=submit, type=submit, value='Submit'], []))
	      ])]).

:- http_handler('/landing', landing_pad, []).

landing_pad(Request) :-
        member(method(post), Request), !,
        http_read_data(Request, Data, []),
		addPoints(Data, 1, 1),
		addPoints(Data, 3, 2),
		addPoints(Data, 5, 3),
		addPoints(Data, 7, 4),
		addPoints(Data, 9, 5),
		addPoints(Data, 11, 6),
		addPoints(Data, 13, 7),
		final_profile(Final, Message),
        format('Content-type: text/html~n~n', []),
	format('<p>', []),
        portray_clause(Final),
        portray_clause(Message),
		(Message =:= 1 -> 
		portray_clause("Jestes Koordynujacym Liderem!") ; Message =:= 2 -> 
			portray_clause("Jestes Praktycznym Realizatorem!") ; Message =:= 3 -> 
				portray_clause("Jestes Ambitnym Komendantem!") ; Message =:= 4 -> 
					portray_clause("Jestes Kreatywnym Pomyslodawca!") ; Message =:= 5 ->
						portray_clause("Jestes Wszedobylskim Lacznikiem!") ; Message =:= 6 -> 
							portray_clause("Jestes Racjonalnym Analitykiem!") ; Message =:= 7 ->
								portray_clause("Jestes Dusza Zespolu!") ; Message =:= 8 ->
									portray_clause("Jestes Finiszujacym Perfekcjonista!")),
	format('</p>').

odpowiedz(a).
odpowiedz(b).
odpowiedz(c).
odpowiedz(d).
odpowiedz(e).
odpowiedz(f).
odpowiedz(g).
odpowiedz(h).


:- dynamic(points/3).

addPoints(Data, Num, Question) :-
	nth1(Num, Data, Elem),
	term_string(Elem, Str),
	sub_atom(Str, _, 1, 0, Pyt0),
	Num2 is Num + 1,
	nth1(Num2, Data, Elem1),
	term_string(Elem1, Str1),
	sub_atom(Str1, _, 1, 1, Point0),
	atom_number(Point0, NumPoint0),
	assertz(points(Question, Pyt0, NumPoint0)).



maxlist([X], X).
maxlist([X,Y|T], MAX) :-
	X>Y,
	maxlist([X|T], MAX).
maxlist([X, Y|T], MAX) :-
	X =< Y,
	maxlist([Y|T], MAX).

final_profile(Final, Message) :-
	check_answer_kl(1, KL1),
	check_answer_kl(2, KL2),
	check_answer_kl(3, KL3),
	check_answer_kl(4, KL4),
	check_answer_kl(5, KL5),
	check_answer_kl(6, KL6),
	check_answer_kl(7, KL7),
	check_answer_pr(1, PR1),
	check_answer_pr(2, PR2),
	check_answer_pr(3, PR3),
	check_answer_pr(4, PR4),
	check_answer_pr(5, PR5),
	check_answer_pr(6, PR6),
	check_answer_pr(7, PR7),
	check_answer_ak(1, AK1),
	check_answer_ak(2, AK2),
	check_answer_ak(3, AK3),
	check_answer_ak(4, AK4),
	check_answer_ak(5, AK5),
	check_answer_ak(6, AK6),
	check_answer_ak(7, AK7),
	check_answer_kp(1, KP1),
	check_answer_kp(2, KP2),
	check_answer_kp(3, KP3),
	check_answer_kp(4, KP4),
	check_answer_kp(5, KP5),
	check_answer_kp(6, KP6),
	check_answer_kp(7, KP7),
	check_answer_wl(1, WL1),
	check_answer_wl(2, WL2),
	check_answer_wl(3, WL3),
	check_answer_wl(4, WL4),
	check_answer_wl(5, WL5),
	check_answer_wl(6, WL6),
	check_answer_wl(7, WL7),
	check_answer_ra(1, RA1),
	check_answer_ra(2, RA2),
	check_answer_ra(3, RA3),
	check_answer_ra(4, RA4),
	check_answer_ra(5, RA5),
	check_answer_ra(6, RA6),
	check_answer_ra(7, RA7),
	check_answer_dz(1, DZ1),
	check_answer_dz(2, DZ2),
	check_answer_dz(3, DZ3),
	check_answer_dz(4, DZ4),
	check_answer_dz(5, DZ5),
	check_answer_dz(6, DZ6),
	check_answer_dz(7, DZ7),
	check_answer_fp(1, FP1),
	check_answer_fp(2, FP2),
	check_answer_fp(3, FP3),
	check_answer_fp(4, FP4),
	check_answer_fp(5, FP5),
	check_answer_fp(6, FP6),
	check_answer_fp(7, FP7),
	WynikKL is KL1 + KL2 + KL3 + KL4 + KL5 + KL6 + KL7,
	WynikPR is PR1 + PR2 + PR3 + PR4 + PR5 + PR6 + PR7,
	WynikAK is AK1 + AK2 + AK3 + AK4 + AK5 + AK6 + AK7,
	WynikKP is KP1 + KP2 + KP3 + KP4 + KP5 + KP6 + KP7,
	WynikWL is WL1 + WL2 + WL3 + WL4 + WL5 + WL6 + WL7,
	WynikRA is RA1 + RA2 + RA3 + RA4 + RA5 + RA6 + RA7,
	WynikDZ is DZ1 + DZ2 + DZ3 + DZ4 + DZ5 + DZ6 + DZ7,
	WynikFP is FP1 + FP2 + FP3 + FP4 + FP5 + FP6 + FP7,
	maxlist([WynikKL, WynikPR, WynikAK, WynikKP, WynikWL, WynikRA, WynikDZ, WynikFP], Max),
	(Max =:= WynikKL -> 
		Final is WynikKL, Message is 1 ; Max =:= WynikPR -> 
			Final is WynikPR, Message is 2 ; Max =:= WynikAK -> 
				Final is WynikAK, Message is 3 ; Max =:= WynikKP -> 
					Final is WynikKP, Message is 4 ; Max =:= WynikWL ->
						Final is WynikWL, Message is 5 ; Max =:= WynikRA -> 
							Final is WynikRA, Message is 6 ; Max =:= WynikDZ ->
								Final is WynikDZ, Message is 7 ; Max =:= WynikFP ->
									Final is WynikFP, Message is 8).

check_answer_kl(X, K) :-
	points(X, A, J),
	nth1(X, [d, b, a, h, f, c, g], Elem),
	A = Elem -> K is J ; K is 0.
	
check_answer_pr(X, K) :-
	points(X, A, J),
	nth1(X, [g, a, h, d, b, f, e], Elem),
	A = Elem -> K is J ; K is 0.
	
check_answer_ak(X, K) :-
	points(X, A, J),
	nth1(X, [f, e, c, b, d, g, a], Elem),
	A = Elem -> K is J ; K is 0.
	
check_answer_kp(X, K) :-
	points(X, A, J),
	nth1(X, [c, g, d, e, h, a, f], Elem),
	A = Elem -> K is J ; K is 0.
	
check_answer_wl(X, K) :-
	points(X, A, J),
	nth1(X, [a, c, f, g, e, h, d], Elem),
	A = Elem -> K is J ; K is 0.
	
check_answer_ra(X, K) :-
	points(X, A, J),
	nth1(X, [h, d, g, c, a, e, b], Elem),
	A = Elem -> K is J ; K is 0.
	
check_answer_dz(X, K) :-
	points(X, A, J),
	nth1(X, [b, f, e, a, c, b, h], Elem),
	A = Elem -> K is J ; K is 0.
	
check_answer_fp(X, K) :-
	points(X, A, J),
	nth1(X, [e, h, b, f, g, d, c], Elem),
	A = Elem -> K is J ; K is 0.

	
belbin_test(_Request) :- 
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
	assertz(points(3, Answer3, Punkty3)),
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
	assertz(points(4, Answer4, Punkty4)),
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
	assertz(points(5, Answer5, Punkty5)),
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
	assertz(points(6, Answer6, Punkty6)),
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
	assertz(points(7, Answer7, Punkty7)),
	final_profile.
	
	
	
	
