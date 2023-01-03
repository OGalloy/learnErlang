-module(hero).                      
-autor("Dmitriy Shiryaev").
-export([inventory/1]).


inventory(ItemList) ->
    receive
        %Добавляем новый предмет
        {add, NewItem} ->
            io:format("New item: ~p~n", [NewItem]), 
            inventory([NewItem|ItemList]);
        %Смотрим все предметы в инвентаре
        {read_all} -> 
            io:format("All items ~p~n", [ItemList]),
            inventory(ItemList);
        %Удаляем предмет по индексу
        {delete, Item} ->
           NewList = lists:delete(Item, ItemList),
            inventory(NewList)
    end.