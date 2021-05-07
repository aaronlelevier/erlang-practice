%%%-------------------------------------------------------------------
%%% @author Aaron Lelevier
%%% @doc
%%% @end
%%% Created : 06. May 2021 8:19 PM
%%%-------------------------------------------------------------------
-module(record_util).
-author("Aaron Lelevier").
-vsn(1.0).
-include("records.hrl").
-export([
  record_to_proplist/1,
  proplist_to_record/2
]).

%% @doc Converts a record to a proplist
%% Ref: https://stackoverflow.com/a/3762102/1913888
record_to_proplist(#user{} = Rec) ->
  lists:zip(record_info(fields, user), tl(tuple_to_list(Rec)));
record_to_proplist(#group{} = Rec) ->
  lists:zip(record_info(fields, group), tl(tuple_to_list(Rec))).

%% @doc Converts a proplist to a record
%% Ref: https://stackoverflow.com/a/873666/1913888
proplist_to_record(Proplist, user) ->
  list_to_tuple(
    [user | [proplists:get_value(X, Proplist) ||
      X <- record_info(fields, user)]]);
proplist_to_record(Proplist, group) ->
  list_to_tuple(
    [group | [proplists:get_value(X, Proplist) ||
      X <- record_info(fields, group)]]).

