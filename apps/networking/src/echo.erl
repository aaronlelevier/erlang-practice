%%%-------------------------------------------------------------------
%%% @doc Credit: http://20bits.com/article/network-programming-in-erlang#:~:text=Erlang%2C%20being%20a%20functional%20programming,%3D%20fun(...)
%%% @end
%%% Created : 14. May 2021 8:52 AM
%%%-------------------------------------------------------------------
-module(echo).
-author('Jesse E.I. Farmer <jesse@20bits.com>').

-export([listen/1]).

-define(TCP_OPTIONS, [binary, {packet, 0}, {active, false}, {reuseaddr, true}]).

% Call echo:listen(Port) to start the service.
listen(Port) ->
  {ok, LSocket} = gen_tcp:listen(Port, ?TCP_OPTIONS),
  accept(LSocket).

% Wait for incoming connections and spawn the echo loop when we get one.
accept(LSocket) ->
  {ok, Socket} = gen_tcp:accept(LSocket),
  spawn(fun() -> loop(Socket) end),
  accept(LSocket).

% Echo back whatever data we receive on Socket.
loop(Socket) ->
  case gen_tcp:recv(Socket, 0) of
    {ok, Data} ->
      gen_tcp:send(Socket, Data),
      loop(Socket);
    {error, closed} ->
      ok
  end.