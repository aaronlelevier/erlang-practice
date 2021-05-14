%%%-------------------------------------------------------------------
%% @doc networking public API
%% @end
%%%-------------------------------------------------------------------

-module(networking_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    networking_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
