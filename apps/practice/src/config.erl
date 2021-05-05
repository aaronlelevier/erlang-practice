%%%-------------------------------------------------------------------
%%% @author Aaron Lelevier
%%% @doc
%%% @end
%%% Created : 05. May 2021 8:48 AM
%%%-------------------------------------------------------------------
-module(config).
-author("Aaron Lelevier").
-vsn(1.0).
-export([]).
-compile(export_all).


%% @doc Returns a map of the app's config
-spec load() -> map().
load() ->
  {ok, Bin} = file:read_file(filename:join(code:priv_dir(practice), "config.json")),
  jsx:decode(Bin).

map_search_pred(Map, Pred) when is_map(Map) ->
  map_search_pred(maps:to_list(Map), Pred);
map_search_pred([H|T], Pred) ->
  case Pred(H) of
    true -> H;
    false -> map_search_pred(T, Pred)
  end;
map_search_pred([], _Pred) -> no_match.
