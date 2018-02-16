module Commands exposing (..)

import Html exposing (Html, div, button, text, program)
import Html.Events exposing (onClick)
import Random


{-
1. Html.program calls our view function with the initial model and renders it.
2. When the user clicks on the Expand button, the view triggers the Expand message.
3. Html.program receives the Expand message which calls our update function with Expand and the current application state.
4. The update function responds to the message by returning the updated state and a command to run (or Cmd.none).
5. Html.program receives the updated state, stores it, and calls the view with the updated state.
-}

-- MODEL

type alias Model =
    Int

init : ( Model, Cmd Msg )
init =
    ( 1, Cmd.none )



-- MESSAGES
type Msg
    = Roll
    | OnResult Int


-- VIEW Increments based on whether it was a mouse click or a keyboard click
view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Roll ] [ text "Roll" ],
        text (toString model)
        ]


-- UPDATE
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Roll ->
            ( model,  Random.generate OnResult (Random.int 1 100) )
        OnResult res ->
            ( res, Cmd.none )



-- MAIN
main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = (always Sub.none)
        }