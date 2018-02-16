module MouseAndKeyboard exposing (..)

import Html exposing (Html, div, text, program)
import Mouse
import Keyboard


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
    = MouseMsg Mouse.Position
    | KeyMsg Keyboard.KeyCode


-- VIEW Increments based on whether it was a mouse click or a keyboard click
view : Model -> Html Msg
view model =
    div []
        [ text (toString model)]


-- UPDATE
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MouseMsg position ->
            ( model + 1, Cmd.none )
        KeyMsg code ->
            ( model + 2, Cmd.none )


-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
    [ Mouse.clicks MouseMsg,
      Keyboard.downs KeyMsg
    ]



-- MAIN
main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }