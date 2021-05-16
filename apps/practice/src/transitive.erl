%%%-------------------------------------------------------------------
%%% @author Aaron Lelevier
%%% @doc Module of example [transitive](https://en.wikipedia.org/wiki/Transitive_relation) functions
%%% @end
%%% Created : 14. May 2021 9:53 AM
%%%-------------------------------------------------------------------
-module(transitive).
-author("Aaron Lelevier").
-vsn(1.0).
-export([
  sum/2
]).

-spec sum(integer(), integer()) -> integer().
sum(X, Y) -> X + Y.
