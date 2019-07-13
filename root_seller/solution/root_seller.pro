affliction(abyss_fever).
affliction(patchfoot).
affliction(sandspots).
affliction(white_chills).

herb(bruiseleaf).
herb(silverweed).
herb(thornbloom).
herb(wildroot).

location(emerald_meadow).
location(haghaven_swamp).
location(kings_woods).
location(northern_cliffs).

patient(katricia).
patient(morien).
patient(saradin).
patient(uther).

solve :-
    affliction(KatriciaAffliction), affliction(MorienAffliction), affliction(SaradinAffliction), affliction(UtherAffliction),
    all_different([KatriciaAffliction, MorienAffliction, SaradinAffliction, UtherAffliction]),

    herb(KatriciaHerb), herb(MorienHerb), herb(SaradinHerb), herb(UtherHerb),
    all_different([KatriciaHerb, MorienHerb, SaradinHerb, UtherHerb]),

    location(KatriciaLocation), location(MorienLocation), location(SaradinLocation), location(UtherLocation),
    all_different([KatriciaLocation, MorienLocation, SaradinLocation, UtherLocation]),

    Quadruples = [ [katricia, KatriciaAffliction, KatriciaHerb, KatriciaLocation], 
                   [morien, MorienAffliction, MorienHerb, MorienLocation],
                   [saradin, SaradinAffliction, SaradinHerb, SaradinLocation],
                   [uther, UtherAffliction, UtherHerb, UtherLocation] ],

    % The herb used to treat Katricia isn't bruiseleaf
    \+ member([katricia, _, bruiseleaf, _], Quadruples),

    % The location of the herb to treat Katricia can be found only in Emeral Meadow
    member([katricia, _, _, emerald_meadow], Quadruples),

    % The herb used to cure Saradin's affliction isn't the one found in King's Woods
    \+ member([saradin, _, _, kings_woods], Quadruples),

    % Morien's illness was easily treated with some silverweed
    member([morien, _, silverweed, _], Quadruples),

    % Uther was diagnosed with patchfoot
    member([uther, patchfoot, _, _], Quadruples),

    % Uther was cured with wildroot
    member([uther, _, wildroot, _], Quadruples),

    % The herb used to treat sandspots isn't bruiseleaf
    \+ member([_, sandspots, bruiseleaf, _], Quadruples),

    % The herb found in Haghaven Swamp isn't bruiseleaf
    \+ member([_, _, bruiseleaf, haghaven_swamp], Quadruples),

    % The herb used to cure white chills isn't bruiseleaf
    \+ member([_, white_chills, bruiseleaf, _], Quadruples),

    tell(katricia, KatriciaAffliction, KatriciaHerb, KatriciaLocation),
    tell(morien, MorienAffliction, MorienHerb, MorienLocation),
    tell(saradin, SaradinAffliction, SaradinHerb, SaradinLocation),
    tell(uther, UtherAffliction, UtherHerb, UtherLocation).

all_different([H | T]) :- member(H, T), !, fail.
all_different([_ | T]) :- all_different(T).
all_different([_]).

tell(W, X, Y, Z) :-
    write('Patient. '), write(W), write(' cured ailment '), write(X),
    write(' with '), write(Y), write(' found in '), write(Z), write('.'), nl.
