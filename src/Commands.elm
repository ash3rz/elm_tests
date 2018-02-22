module Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Msgs exposing (Msg)
import Models exposing (PlayerId, Player)
import RemoteData


{-
➊ Http.get takes a url and a decoder. This returns a Request type.
➋ We pass this request to RemoteData.sendRequest, this function will wrap the request in a WebData type and return a Cmd to send the request.
➌ We map the command from RemoteData to OnFetchPlayers. In that way we can handle the response in our update.
-}

fetchPlayers : Cmd Msg
fetchPlayers =
    Http.get fetchPlayersUrl playersDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.OnFetchPlayers

fetchPlayersUrl : String
fetchPlayersUrl =
    "http://localhost:4000/players"


playersDecoder : Decode.Decoder (List Player)
playersDecoder =
    Decode.list playerDecoder


{-
playerDecoder creates a JSON decoder that returns a Player record.
Here we use decode and required from the JSON Pipeline package.
This package allows to decode JSON in a more intuitive way than doing it without any packages.
-}
playerDecoder : Decode.Decoder Player
playerDecoder =
    decode Player
        |> required "id" Decode.string
        |> required "name" Decode.string
        |> required "level" Decode.int