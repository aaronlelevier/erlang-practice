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
  most_exports/0
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
