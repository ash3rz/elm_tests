module Hello exposing (..)

import Html exposing (text)

addOne : Int -> Int
addOne x =
    x + 1

multiply : Int -> Int -> Int
multiply x y =
    x * y

multiplyPlusOne : Int -> Int -> Int
multiplyPlusOne x y =
    addOne (multiply x y)

--Sample Functions:
--indexOf : String -> List String -> Int
--switch: (String, String) -> (String, String)
--Generic Versions:
--indexOf : a -> List a -> Int
--switch: (a, b) -> (b, a)

--Answer is a type (Union Type) and Yes and No are constructors.  why?  You create an instance of that type by using those terms
type Answer = Yes | No

-- There is no boolean in Elm, it's a union type
type Bool = True | False

myAnswer = Yes

respond : Answer -> String
respond answer =
    case answer of
        Yes ->
            "Yes"
        No ->
            "No"


--label : { id : Int, name : String } -> String
--label 1 "Test" =
--    "Success!"

type alias Message a = {
    code : String,
    body : a }

readMessage : Message (List Int) -> String
readMessage message =
    "Message received!"


main =
    text "The dark arts better be worried, oh boy!"