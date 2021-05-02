%%%-------------------------------------------------------------------
%%% @author Aaron Lelevier
%%% @doc Calculate the distance between points
%%%
%%% Ex:
%%% 1> distance:lat_lng({32.9917606,-117.0104516}, {33.0740355,-116.6221956}).
%%% 2> 37.331957752719774
%%%
%%% References:
%%% Lat Lng Coordinate converter: https://www.gpsvisualizer.com/calculators
%%% Great distance calculator: https://www.nhc.noaa.gov/gccalc.shtml
%%% Wikipedia Haversine Formula: https://en.wikipedia.org/wiki/Haversine_formula
%%% @end
%%% Created : 02. May 2021 7:22 AM
%%%-------------------------------------------------------------------
-module(distance).
-author("Aaron Lelevier").
-vsn(1.0).
-export([
  points/2,
  lat_lng/2
]).


%% @doc Returns the 2D distance between 2 points
points({X1, Y1}=_Point1, {X2, Y2}=_Point2) ->
  math:sqrt(math:pow(X2 - X1, 2) + math:pow(Y2 - Y1, 2)).


%% @doc Returns the distance between 2 Lat/Lng points in KM
%% credit: https://stackoverflow.com/a/21623206/1913888
lat_lng({Lat1, Lon1}=_Point1, {Lat2, Lon2}=_Point2) ->
  P = math:pi() / 180,
  R = 6371, % Radius of Earth in KM
  A = 0.5 - math:cos((Lat2 - Lat1) * P) / 2 +
    math:cos(Lat1 * P) * math:cos(Lat2 * P) * (1 - math:cos((Lon2 - Lon1) * P))/2,
  R * 2 * math:asin(math:sqrt(A)).
