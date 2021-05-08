%%%-------------------------------------------------------------------
%%% @author Aaron Lelevier
%%% @doc implementation of 'reduce' based off of the Python functools
%%% documentation:
%%%   https://docs.python.org/3.0/library/functools.html
%%%
%%% lists foldl and foldr can also be used:
%%%   https://erlang.org/doc/man/lists.html#foldl-3
%%% @end
%%% Created : 08. May 2021 8:45 AM
%%%-------------------------------------------------------------------
-module(func_util).
-author("Aaron Lelevier").
-vsn(1.0).
-export([
  reduce/2
]).

%% @doc reduce takes a function 'F' with 2 arguments, and reduces a list
%% 'L' using the 'F' to a single value
reduce(_F, L) when length(L) == 0 -> undefined;
reduce(_F, L) when length(L) == 1 -> [H|_]=L, H;
reduce(F, L) ->
  [A,B|T] = L,
  Val = F(A,B),
  reduce(F, T, Val).

reduce(_F, [], Val) -> Val;
reduce(F, [H|T], Val) ->
  Val2 = F(Val, H),
  reduce(F, T, Val2).

