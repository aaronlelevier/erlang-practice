%%%-------------------------------------------------------------------
%%% @author Aaron Lelevier
%%% @doc Uses geometric objects to calculate spaces
%%% @end
%%% Created : 16. May 2021 11:25 AM
%%%-------------------------------------------------------------------
-module(spaces).
-author("Aaron Lelevier").
-vsn(1.0).
-export([
  space/1
]).

-spec space({side, number()}) -> number().
space({side, Side}) -> Side * Side.
