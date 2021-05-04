%%%-------------------------------------------------------------------
%%% @author Aaron Lelevier
%%% @doc Practice [lists](https://erlang.org/doc/man/lists.html)
%%% @end
%%% Created : 28. Apr 2021 6:41 AM
%%%-------------------------------------------------------------------
-module(plists).
-author("Aaron Lelevier").
-vsn(1.0).
-export([
  any/1,
  all/1,
  dropwhile/1,
  droplast/1,
  join/2
]).

any(L) ->
  lists:any(fun(X) -> X =:= true end, L).

all(L) ->
  lists:all(fun(X) -> X =:= true end, L).

droplast([]) -> [];
droplast(L) ->
  [_|T] = lists:reverse(L),
  lists:reverse(T).

%% Returns a reusable 'dropwhile' for a Predicate that needs to be
%% applied to multiple lists
dropwhile(Pred) ->
  fun(L) -> lists:dropwhile(Pred, L) end.

%% Returns a string of 'L' items joined by 'Sep'
join(Sep, L) ->
  lists:concat(lists:join(Sep, L)).
