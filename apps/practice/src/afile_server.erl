%%%-------------------------------------------------------------------
%%% @author Aaron Lelevier
%%% @doc
%%% @end
%%% Created : 01. May 2021 8:18 AM
%%%-------------------------------------------------------------------
-module(afile_server).
-author("Aaron Lelevier").
-vsn(1.0).
-export([
  start/1,
  loop/1,
  ls/1,
  get_file/2,
  put_file/3
]).


start(Dir) ->
  spawn(?MODULE, loop, [Dir]).

loop(Dir) ->
  receive
    {Client, list_dir} ->
      Client ! {self(), file:list_dir(Dir)};
    {Client, {get_file, File}} ->
      Client ! {self(), file:read_file(File)};
    {Client, {put_file, Filename, Bytes}} ->
      Client ! {self(), file:write_file(Filename, Bytes)}
  end,
  loop(Dir).

ls(Server) ->
  Server ! {self(), list_dir},
  receive
    {Server, FileList} ->
      FileList
  end.

get_file(Server, File) ->
  Server ! {self(), {get_file, File}},
  receive
    {Server, FileContent} ->
      FileContent
  end.

put_file(Server, Filename, Bytes) ->
  Server ! {self(), {put_file, Filename, Bytes}},
  receive
    {Server, Reply} ->
      Reply
  end.
