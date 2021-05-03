%%%-------------------------------------------------------------------
%%% @author Aaron Lelevier
%%% @doc
%%% @end
%%% Created : 03. May 2021 8:47 AM
%%%-------------------------------------------------------------------
-module(my_funcs).
-author("Aaron Lelevier").
-vsn(1.0).
-export([
  my_tuple_to_list/1,
  my_time_func/1
]).

my_tuple_to_list(T) ->
  [element(N, T) || N <- lists:seq(1, size(T))].

%% TODO: need a longer running 'F' to verify this is working
my_time_func(F) ->
  {_MegaSecs1, Secs1, _MicroSecs1} = erlang:timestamp(),
  Ret = F(),
  {_MegaSecs2, Secs2, _MicroSecs2} = erlang:timestamp(),
  {Ret, Secs2-Secs1}.