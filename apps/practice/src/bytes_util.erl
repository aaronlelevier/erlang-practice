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
  reverse_bytes/1,
  term_to_packet/1,
  packet_to_term/1
]).

%% @doc Reverse the order of bytes in a binary
-spec reverse_bytes(binary()) -> binary().
reverse_bytes(Bin) ->
  list_to_binary(lists:reverse(binary_to_list(Bin))).

-spec term_to_packet(any()) -> bitstring().
term_to_packet(Term) ->
  Bin = term_to_binary(Term),
  Size = size(Bin),
  <<Size:4, Bin/binary>>.

-spec packet_to_term(bitstring()) -> {byte(), any()}.
packet_to_term(Packet) ->
  <<Size:4, Bin/binary>> = Packet,
  Term = binary_to_term(Bin),
  {Size, Term}.
