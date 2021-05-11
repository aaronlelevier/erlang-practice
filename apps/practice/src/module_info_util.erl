%%%-------------------------------------------------------------------
%%% @author Aaron Lelevier
%%% @doc
%%% @end
%%% Created : 11. May 2021 6:35 AM
%%%-------------------------------------------------------------------
-module(module_info_util).
-author("Aaron Lelevier").
-vsn(1.0).
-export([
  most_exports/0,
  most_common_function/0,
  most_ambiguous_functions/0
]).

most_exports() ->
  Mods = [X || {X, _} <- code:all_loaded()],
  lists:foldl(
    fun(Mod, {MaxMod, Max}) ->
      Count = length(Mod:module_info(exports)),
      case Count > Max of
        true ->
          {Mod, Count};
        false ->
          {MaxMod, Max}
      end
    end,
    {undefined, 0},
    Mods).

most_common_function() ->
  Map = function_name_counts(),
  L = maps:to_list(Map),
  Sorted = lists:sort(fun({_, A}, {_, B}) -> A > B end, L),
  lists:nth(1, Sorted).

most_ambiguous_functions() ->
  Map = function_name_counts(),
  L = maps:to_list(Map),
  Filtered = lists:filter(fun({_Name, Count}) -> Count == 1 end, L),
  [Name || {Name, _Count} <- Filtered].

%% Private

function_name_counts() ->
  Mods = [X || {X, _} <- code:all_loaded()],
  lists:foldl(
    fun(Mod, Map) ->
      Names = [X || {X, _} <- Mod:module_info(exports)],
      inc_map(Map, Names)
    end,
    #{},
    Mods).

inc_map(Map, []) -> Map;
inc_map(Map, [H | T]) ->
  Count = maps:get(H, Map, 0),
  inc_map(Map#{H => Count + 1}, T).
