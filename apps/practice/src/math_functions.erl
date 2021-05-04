%%%-------------------------------------------------------------------
%%% @author Aaron Lelevier
%%% @doc
%%% @end
%%% Created : 04. May 2021 4:29 AM
%%%-------------------------------------------------------------------
-module(math_functions).
-author("Aaron Lelevier").
-vsn(1.0).
-export([
  even/1,
  odd/1,
  filter/2,
  split/1,
  split2/1
]).

even(N) -> N rem 2 =:= 0.

odd(N) -> N rem 2 =/= 0.

filter(F, L) -> lists:filter(F, L).

split(L) ->
  Even = lists:filter(fun even/1, L),
  Odd = lists:filter(fun odd/1, L),
  {Even, Odd}.

split2(L) ->
  split2(L, {[], []}).

split2([], {Even, Odd}) -> {lists:reverse(Even), lists:reverse(Odd)};
split2([H|T], {Even, Odd}) ->
  case even(H) of
    true -> split2(T, {[H|Even], Odd});
    false -> split2(T, {Even, [H|Odd]})
  end.
