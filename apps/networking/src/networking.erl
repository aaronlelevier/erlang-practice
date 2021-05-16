%%%-------------------------------------------------------------------
%%% @author Aaron Lelevier
%%% @doc
%%% @end
%%% Created : 14. May 2021 9:24 AM
%%%-------------------------------------------------------------------
-module(networking).
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
  server(5678, [{persist, true}]).

server(Socket, Opts) ->
  {ok, LSock} = gen_tcp:listen(
    Socket,
    [binary, {packet, 0}, {active, false}]
  ),
  {ok, Sock} = gen_tcp:accept(LSock),
  {ok, Bin} = do_recv(Sock, [], Opts),
  ok = gen_tcp:close(Sock),
  ok = gen_tcp:close(LSock),
  Bin.

do_recv(Sock, Bs, Opts) ->
  case gen_tcp:recv(Sock, 0) of
    {ok, B} ->
      do_recv(Sock, [Bs, B], Opts);
    {error, closed} ->
      % decide to return or continue based on 'Opts'
      case proplists:get_value(persist, Opts) of
        true -> do_recv(Sock, [], Opts);
        _ ->
          io:format("echo: ~s~n", [Bs]),
          {ok, list_to_binary(Bs)}
      end
  end.

