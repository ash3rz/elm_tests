module Routing exposing (..)

import Navigation exposing (Location)
import Models exposing (PlayerId, Route(..))
import UrlParser exposing (..)

{-
Here we define route matchers. These parsers are provided by the url-parser library.
We want three matchers:
One for the top route which will resolve to PlayersRoute
One for /players which will resolve to PlayersRoute as well
And one for /players/id which will resolve to PlayerRoute id
Note that the order is important as routes defined first will have priority over later definitions.
-}

matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map PlayersRoute top
        , map PlayerRoute (s "players" </> string)
        , map PlayersRoute (s "players")
        ]

{-
Each time the browser location changes, the Navigation library will trigger a message containing a Navigation.Location record. From our main update we will call parseLocation with this record.
parseLocation is a function that parses this Location record and returns the matched Route if possible. If all matchers fail we return NotFoundRoute.
In this case we UrlParser.parseHash as we will be routing using the hash. You could use UrlParser.parsePath to route with the path instead.
-}

parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route
        Nothing ->
            NotFoundRoute


playersPath : String
playersPath =
    "#players"

playerPath : PlayerId -> String
playerPath id =
    "#players/" ++ id