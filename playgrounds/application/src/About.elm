module About exposing (main)

import Browser exposing (Document)
import Browser.Navigation as Nav
import Html exposing (Html)
import Html.Attributes exposing (class)
import Page
import Page.About as About
import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), Parser, oneOf, s, string)



-- MODEL --


type alias Model =
    { about : String
    }


init : String -> ( Model, Cmd Msg )
init flag =
    ( { about = flag }, Cmd.none )



-- VIEW --


view : Model -> Html Msg
view model =
    About.view model.about



-- UPDATE --


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
          (model, Cmd.none)


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
