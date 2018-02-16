module AppImprovedAgain exposing (..)

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
    Int

init : ( Model, Cmd Msg )
init =
    ( 0, Cmd.none )



-- MESSAGES
type Msg
    = Increment Int
    | Decrement Int


-- VIEW Adds a clickable button
view : Model -> Html Msg
view model =
    div []
        [ button [onClick (Increment 2) ] [text "+"],
          div [] [ text (toString model) ],
          button [onClick (Decrement 2) ] [text "-"]
        ]


-- UPDATE
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment howMuch ->
            ( model + howMuch, Cmd.none )
        Decrement howMuch ->
            ( model - howMuch, Cmd.none )


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