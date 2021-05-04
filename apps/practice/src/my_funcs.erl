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
  {MegaSecs1, Secs1, MicroSecs1} = erlang:timestamp(),
  Time1 = erlang:system_time(),
  Ret = F(),
  {MegaSecs2, Secs2, MicroSecs2} = erlang:timestamp(),
  Time2 = erlang:system_time(),
  {
    {value, Ret},
    {secs, MegaSecs2-MegaSecs1},
    {secs, Secs2-Secs1},
    {secs, MicroSecs2-MicroSecs1},
    {time, (Time2-Time1)/1000000} % converts to milliseconds
  }.