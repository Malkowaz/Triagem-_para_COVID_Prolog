:- dynamic capital/2.

geoguesser :- carrega('capitais.bd'),
    format('~n*** Capitais ***~n~n'),
    repeat,
    pergunta(Estado),
    responde(Estado),
    continua(Resposta),
    Resposta = n,
    !,
    salva(capital,'capitais.bd').

carrega(Arquivo) :-
    exists_file(Arquivo),
    consult(Arquivo);
    true.

pergunta(Estado) :-
    format('~nQual o estado cuja capital você quer saber? '),
    gets(Estado).

responde(Estado) :-
    capital(Capital,Estado),
    !,
    format('A capital de ~w é ~w.~n', [Estado,Capital]).

responde(Estado) :-
    format('Não sei. Qual é a capital de ~w? ', [Estado]),
    gets(Capital),
    asserta(capital(Capital,Estado)).

continua(Resposta) :-
    format('~nContinua? [s/n] '),
    get_char(Resposta),
    get_char('\n').

gets(String) :-
    read_line_to_codes(user_input,Char),
    name(String,Char).

