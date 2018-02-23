module Msgs exposing (..)

import Models exposing (Player)
import RemoteData exposing (WebData)
import Navigation exposing (Location)

type Msg
    = OnFetchPlayers (WebData (List Player))
    | OnLocationChange Location

