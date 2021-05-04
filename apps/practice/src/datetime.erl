%%%-------------------------------------------------------------------
%%% @author Aaron Lelevier
%%% @doc PE p.72 - impl some Python datetime library functions in Erlang
%%% @end
%%% Created : 04. May 2021 4:08 AM
%%%-------------------------------------------------------------------
-module(datetime).
-author("Aaron Lelevier").
-vsn(1.0).
-export([
  date/0,
  timedelta_days/2
]).

date() ->
  {Date, _Time} = calendar:local_time(),
  Date.

timedelta_days(Date1, Date2) ->
  erlang:abs(
    calendar:date_to_gregorian_days(Date1) -
      calendar:date_to_gregorian_days(Date2)).
