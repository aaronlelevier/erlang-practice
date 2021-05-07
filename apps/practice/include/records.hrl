%%%-------------------------------------------------------------------
%%% @author Aaron Lelevier
%%% @doc
%%% @end
%%% Created : 06. May 2021 8:22 PM
%%%-------------------------------------------------------------------
-author("Aaron Lelevier").

-record(group, {
  name :: string()
}).

-record(user, {
  name :: string(),
  groups :: #group{}
}).
