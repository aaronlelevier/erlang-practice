%%%-------------------------------------------------------------------
%%% @author Aaron Lelevier
%%% @doc
%%% @end
%%% Created : 07. May 2021 4:29 PM
%%%-------------------------------------------------------------------
-module(file_util).
-author("Aaron Lelevier").
-vsn(1.0).
-export([
  read_file/1,
  try_read_file/1
]).

read_file(File) ->
  case file:read_file(File) of
    {ok, Bin} -> Bin;
    {error, Reason} -> error(Reason)
  end.

try_read_file(File) ->
  try read_file(File)
  catch
    error:Reason -> Reason
  end.
