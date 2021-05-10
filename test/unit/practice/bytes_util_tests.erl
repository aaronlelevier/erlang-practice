%%%-------------------------------------------------------------------
%%% @author Aaron Lelevier
%%% @doc
%%% @end
%%% Created : 10. May 2021 8:19 AM
%%%-------------------------------------------------------------------
-module(bytes_util_tests).
-author("Aaron Lelevier").
-include_lib("eunit/include/eunit.hrl").

convert_term_to_packet_test() ->
  Packet = bytes_util:term_to_packet("aaron"),
  ?assert(is_bitstring(Packet)),

  {Size, Term} = bytes_util:packet_to_term(Packet),
  ?assert(is_integer(Size)),
  ?assertEqual("aaron", Term).
