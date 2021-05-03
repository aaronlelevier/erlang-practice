%%%-------------------------------------------------------------------
%%% @author Aaron Lelevier
%%% @doc
%%% @end
%%% Created : 03. May 2021 8:40 AM
%%%-------------------------------------------------------------------
-module(geometry).
-author("Aaron Lelevier").
-vsn(1.0).
-export([
  area/1,
  perimeter/1
]).

area({rectangle, Width, Height}) -> Width * Height;
area({square, Side}) -> Side * Side;
area({circle, Radius}) -> 2 * Radius * math:pi();
area({right_sided_triangle, SideA, SideB}) -> SideA * SideB / 2.

perimeter({rectangle, Width, Height}) -> Width * 2 + Height * 2;
perimeter({square, Side}) -> Side * 4.
