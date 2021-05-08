%%%-------------------------------------------------------------------
%%% @author Aaron Lelevier
%%% @doc
%%% @end
%%% Created : 08. May 2021 8:14 AM
%%%-------------------------------------------------------------------
-module(bytes_util).
-author("Aaron Lelevier").
-vsn(1.0).
-export([
  reverse_bytes/1
]).

%% @doc Reverse the order of bytes in a binary
-spec reverse_bytes(binary()) -> binary().
reverse_bytes(Bin) ->
  list_to_binary(lists:reverse(binary_to_list(Bin))).
