module Main exposing (main)

import Browser
import Html exposing (Html)
import Html.Attributes exposing (class)



-- MODEL --


type alias Model =
    { project : String }


init : Model
init =
    Model "elm-live"



-- VIEW --


view : Model -> Html Msg
view model =
    Html.div [ class "container" ]
        [ Html.h1 [ class "message" ] [ Html.text ("Welcome to " ++ model.project ++ " playground.") ]
        ]



-- UPDATE --


type Msg
    = NoOp


update : Msg -> Model -> Model
update msg model =
    case msg of
        _ ->
            model



-- MAIN --


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }
