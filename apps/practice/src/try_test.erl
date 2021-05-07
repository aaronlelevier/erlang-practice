%%%-------------------------------------------------------------------
%%% @author Aaron Lelevier
%%% @doc
%%% @end
%%% Created : 07. May 2021 4:34 PM
%%%-------------------------------------------------------------------
-module(try_test).
-author("Aaron Lelevier").
-vsn(1.0).
-export([
  demo1/0,
  demo2/0
]).

demo1() ->
  [catcher(I) || I <- [1,2,3,4,5]].

catcher(N) ->
  try generate_exception(N) of
    Val -> {N, normal, Val}
  catch
    throw:X -> {N, caught, throw, X};
    exit:X -> {N, caught, exited, X};
    error:X -> {N, caught, error, X}
  end.


%% polite catcher

demo2() ->
  [polite_catcher(I) || I <- [1,2,3,4,5]].

-spec polite_catcher(integer()) -> {atom(), tuple()}.
polite_catcher(N) ->
  Ret = try generate_exception(N) of
    Val -> {N, normal, Val}
  catch
    throw:X -> {N, caught, throw, X};
    exit:X -> {N, caught, exited, X};
    error:X -> {N, caught, error, X}
  end,
  case Ret of
    {_, normal, _} ->
      % success
      {ok, Ret};
    Error ->
      {N, caught, _ErrorType, Reason} = Error,
      % {user error, dev error}
      {{error, Reason}, Error}
  end.

%% Private

generate_exception(1) -> a;
generate_exception(2) -> throw(a);
generate_exception(3) -> exit(a);
generate_exception(4) -> {'EXIT', a};
generate_exception(5) -> error(a).