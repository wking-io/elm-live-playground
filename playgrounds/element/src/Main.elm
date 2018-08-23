module Main exposing (main)

import Browser
import Html exposing (Html)
import Html.Attributes exposing (class)



-- MODEL --


type alias Model =
    { project : String }


init : String -> ( Model, Cmd Msg )
init flag =
    ( Model flag, Cmd.none )



-- VIEW --


view : Model -> Html Msg
view model =
    Html.div [ class "container" ]
        [ Html.h1 [ class "message" ] [ Html.text ("Welcome to " ++ model.project ++ " playground.") ]
        ]



-- UPDATE --


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        _ ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS --


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN --


main : Program String Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
