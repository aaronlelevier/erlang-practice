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
  timedelta_days/2,
  incr_date/2,
  log_date_intervals/3,
  iso_8601_timestamp/1
]).

date() ->
  {Date, _Time} = calendar:local_time(),
  Date.

timedelta_days(Date1, Date2) ->
  erlang:abs(
    calendar:date_to_gregorian_days(Date1) -
      calendar:date_to_gregorian_days(Date2)).

%% @doc Increments a 'Date' by 'Days'
-spec incr_date(Date, Days) -> Date2 when
  Date :: calendar:date(),
  Days :: integer(),
  Date2 :: calendar:date().
incr_date(Date, Days) ->
  calendar:gregorian_days_to_date(calendar:date_to_gregorian_days(Date) + Days).

%% @doc Logs the From/To dates in interval 'Days' for the next upcoming 10 intervals
-spec log_date_intervals(From, To, Days) -> [ok] when
  From :: calendar:date(),
  To :: calendar:date(),
  Days :: integer().
log_date_intervals(From, To, Days) ->
  [
    io:format("~p - ~p~n", [incr_date(From, 0 + N * Days), incr_date(To, 0 + N * Days)])
    || N <- lists:seq(0, 9) % 10 intervals hardcoded here
  ].

%% @doc UTC iso 8601 timestamp
%% credit: https://stackoverflow.com/questions/58004415/how-to-convert-erlangtimestamp-to-normal-date-format
-spec iso_8601_timestamp(erlang:timestamp()) -> string().
iso_8601_timestamp(Timestamp) ->
  {{Year,Month,Day},{Hour,Minute,Second}} =
    calendar:now_to_universal_time(Timestamp),
  lists:flatten(io_lib:format("~4w-~2..0w-~2..0wT~w:~2..0w:~2..0wZ",
    [Year,Month,Day,Hour,Minute,Second])).
