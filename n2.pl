:- dynamic sistema/3.

sistema :- 

    load('sistema.bd'),
    format('~n*** Sistema COVID ***~n~n'),
    repeat,
    paciente(nome),
    temperatura(nome),
    frequenciaCardiaca(nome),
    frequenciaRespiratoria(nome),
    paSistolica(nome),
    saO2(nome),
    dispneia(nome),
    idade(nome),
    comorbidades(nome),
    Resposta = n,
    !,
    salva(paciente, 'sistema.bd').

carrega(Arquivo) :-

    exists_file(Arquivo),
    consult(Arquivo);
    true.

paciente(nome) :-

    format('Informe o nome do paciente: '),
    gets(nome).

temperatura(nome) :-

    format('Informe a temperatura corporal do paciente: '),
    gets(Temperatura),
    asserta(criterios(nome, temperatura, Temperatura)).

frequenciaCardiaca(nome) :-

    format('Digite a Frequência Cardiaca do paciente: '),
    gets(FrequenciaCardiaca),
    asserta(criterios(x, frequenciaCardiaca, FrequenciaCardiaca)).

frequenciaRespiratoria(nome) :-

    format('Digite a Frequência Respiratória do paciente: '),
    gets(FrequenciaRespiratoria),
    asserta(criterios(nome, frequenciaRespiratoria, FrequenciaRespiratoria)).

paSistolica(nome) :-

    format('Digite qual a Pressão Arterial Sistólica do paciente: '),
    gets(PAsistolica),
    asserta(criterios(nome, paSistolica, PAsistolica)).

saO2(nome) :-

    format('Digite a Saturação de Oxigênio do paciente: '),
    gets(SaO2),
    asserta(criterios(x, saO2, SaO2)).

dispneia(nome) :-

    format('Digite se o paciente está com dispneia ou não: '),
    gets(Dispneia),
    asserta(criterios(nome, dispneia, Dispneia)).

idade(nome) :-

    format('Digite a idade do paciente: '),
    gets(Idade),
    asserta(criterios(nome, idade, Idade)).

comorbidades(nome) :-

    format('Digite o quanto de comorbidades o paciente apresenta: '),
    gets(Comorbidades),
    asserta(criterios(nome, comorbidades, Comorbidades)).

gets(String) :-

    read_line_to_codes(user_input,Char),
    name(String,Char).

gravidadeVermelha(Paciente, situacaoVermelha) :-

    criterios(Paciente, frequenciaRespiratoria, Input), Input > 30;
    criterios(Paciente, paSistolica, Input), Input < 90;
    criterios(Paciente, saO2, Input), Input < 95;
    criterios(Paciente, dispneia, Input), Input = "sim".

gravidadeAmarela(Paciente, situacaoAmarela) :-

    criterios(Paciente, temperatura, Input), Input > 39;
    criterios(Paciente, paSistolica, Input), Input >= 90, Input =< 100;
    criterios(Paciente, idade, Input), Input > 80;
    criterios(Paciente, comorbidades, Input), Input > 2.


gravidadeVerde(Paciente, situacaoVerde) :-

    criterios(Paciente, temperatura, Input),(Input < 35;(Input >= 37, Input =< 39));
    criterios(Paciente, frequenciaCardiaca, Input), Input > 100;
    criterios(Paciente, frequenciaRespiratoria, Input), Input > 19, Input < 30;
    criterios(Paciente, idade, Input),Input > 60, Input < 79;
    criterios(Paciente, comorbidades, Input), Input = 1.

gravidadeAzul(Paciente, situacaoAzul) :-

    criterios(Paciente, temperatura, Input), Input > 35 ,Input =< 37;
    criterios(Paciente, frequenciaCardiaca, Input), Input < 100;
    criterios(Paciente, frequenciaRespiratoria, Input), Input < 18;
    criterios(Paciente, paSistolica, Input), Input > 100;
    criterios(Paciente, saO2, Input), Input >= 95;
    criterios(Paciente, dispneia, Input), Input = "não";
    criterios(Paciente, idade, Input), Input < 60;
    criterios(Paciente, comorbidades, Input), Input = 0.


