billionaire(bread).
billionaire(dinero).
billionaire(loote).
billionaire(moohla).
billionaire(wampum).

brand(apricot).
brand(epoq).
brand(mega).
brand(portal).
brand(vale).

material(diamond).
material(gold).
material(leather).
material(pearl).
material(sable).

program(cashflow).
program(invest).
program(ledger).
program(moneywerx).
program(tycoon).

game(backgammon).
game(hearts).
game(mahjong).
game(minesweeper).
game(solitare).

solve :-
    brand(BreadBrand), brand(DineroBrand), brand(LooteBrand), brand(MoohlaBrand), brand(WampumBrand),
    all_different([BreadBrand, DineroBrand, LooteBrand, MoohlaBrand, WampumBrand]),

    material(BreadMaterial), material(DineroMaterial), material(LooteMaterial), 
    material(MoohlaMaterial), material(WampumMaterial),
    all_different([BreadMaterial, DineroMaterial, LooteMaterial, MoohlaMaterial, WampumMaterial]),

    program(BreadProgram), program(DineroProgram), program(LooteProgram), 
    program(MoohlaProgram), program(WampumProgram),
    all_different([BreadProgram, DineroProgram, LooteProgram, MoohlaProgram, WampumProgram]),

    game(BreadGame), game(DineroGame), game(LooteGame), game(MoohlaGame), game(WampumGame),
    all_different([BreadGame, DineroGame, LooteGame, MoohlaGame, WampumGame]),

    Quintuples = [  [bread, BreadBrand, BreadMaterial, BreadProgram, BreadGame],
                    [dinero, DineroBrand, DineroMaterial, DineroProgram, DineroGame],
                    [loote, LooteBrand, LooteMaterial, LooteProgram, LooteGame],
                    [moohla, MoohlaBrand, MoohlaMaterial, MoohlaProgram, MoohlaGame],
                    [wampum, WampumBrand, WampumMaterial, WampumProgram, WampumGame] ],

    % Example
    % \+ member([billionaire, brand, material, program, game], Quintuples),

    % Wampum owns the laptop with a pearl-inlaid case
    member([wampum, _, pearl, _, _], Quintuples),

    % Wampums laptop came with the Ledger program
    member([wampum, _, _, ledger, _], Quintuples),

    % The Mega laptop is used to play Backgammon
    member([_, mega, _, _, backgammon], Quintuples),

    % The Portal laptop came with the Invest program
    member([_, portal, _, invest, _], Quintuples),

    % The Portal laptop is used to play hearts
    member([_, portal, _, _, hearts], Quintuples),

    % Bread has the Apricot laptop
    member([bread, apricot, _, _, _], Quintuples),

    % Breads laptop didn't come with Moneywerx
    \+ member([bread, _, _, moneywerx, _], Quintuples),

    % The Epoq laptop came with Moneywerx
    member([_, epoq, _, moneywerx, _], Quintuples),

    % The Cashflow program doesn't play Solitaire
    \+ member([_, _, _, cashflow, solitare], Quintuples),

    % Loote has sable inlays
    member([loote, _, sable, _, _], Quintuples),

    % Loote plays mahjong
    member([loote, _, _, _, mahjong], Quintuples),

    % Dinero has leather inlays
    member([dinero, _, leather, _, _], Quintuples),

    % The diamon inlaid case doesn't play minesweeper
    \+ member([_, _, diamond, _, minesweeper], Quintuples),

    % The Vale laptop has a gold-inlaid case
    member([_, vale, gold, _, _], Quintuples),

    tell(bread, BreadBrand, BreadMaterial, BreadProgram, BreadGame),
    tell(dinero, DineroBrand, DineroMaterial, DineroProgram, DineroGame),
    tell(loote, LooteBrand, LooteMaterial, LooteProgram, LooteGame),
    tell(moohla, MoohlaBrand, MoohlaMaterial, MoohlaProgram, MoohlaGame),
    tell(wampum, WampumBrand, WampumMaterial, WampumProgram, WampumGame).

all_different([H | T]) :- member(H, T), !, fail.
all_different([_ | T]) :- all_different(T).
all_different([_]).

tell(V, W, X, Y, Z) :-
    write('Billionaire '), write(V), write(' bought the '), write(W),
    write(' laptop, containing the material '), write(X), write(', and the program '), write(Y),
    write('. They play '), write(Z), write('.'), nl.