module AppImproved exposing (..)

import Html exposing (Html, button, div, text, program)
import Html.Events exposing (onClick)


{-
1. Html.program calls our view function with the initial model and renders it.
2. When the user clicks on the Expand button, the view triggers the Expand message.
3. Html.program receives the Expand message which calls our update function with Expand and the current application state.
4. The update function responds to the message by returning the updated state and a command to run (or Cmd.none).
5. Html.program receives the updated state, stores it, and calls the view with the updated state.
-}

-- MODEL

type alias Model =
    Bool

init : ( Model, Cmd Msg )
init =
    ( False, Cmd.none )



-- MESSAGES
type Msg
    = Expand
    | Collapse


-- VIEW Adds a clickable button
view : Model -> Html Msg
view model =
    if model then
        div []
            [ button [onClick Collapse ] [text "Collapse"],
            text "Widget"
            ]
    else
        div []
            [ button [onClick Expand ] [text "Expand"]
            ]



-- UPDATE
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Expand ->
            ( True, Cmd.none )
        Collapse ->
            ( False, Cmd.none )

-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN
main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }