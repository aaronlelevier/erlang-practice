%%%-------------------------------------------------------------------
%%% @author Aaron Lelevier
%%% @doc
%%% @end
%%% Created : 14. May 2021 9:24 AM
%%%-------------------------------------------------------------------
-module(gen_tcp_example).
-author("Aaron Lelevier").
-vsn(1.0).
-export([
  client/0,
  server/0
]).

client() ->
  SomeHostInNet = "localhost", % to make it runnable on one machine
  {ok, Sock} = gen_tcp:connect(SomeHostInNet, 5678,
    [binary, {packet, 0}]),
  ok = gen_tcp:send(Sock, "Some Data"),
  ok = gen_tcp:close(Sock).

server() ->
  {ok, LSock} = gen_tcp:listen(5678, [binary, {packet, 0},
    {active, false}]),
  {ok, Sock} = gen_tcp:accept(LSock),
  {ok, Bin} = do_recv(Sock, []),
  ok = gen_tcp:close(Sock),
  ok = gen_tcp:close(LSock),
  Bin.

do_recv(Sock, Bs) ->
  case gen_tcp:recv(Sock, 0) of
    {ok, B} ->
      do_recv(Sock, [Bs, B]);
    {error, closed} ->
      {ok, list_to_binary(Bs)}
  end.
