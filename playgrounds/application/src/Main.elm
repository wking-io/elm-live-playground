module Main exposing (main)

import Browser exposing (Document)
import Browser.Navigation as Nav
import Html exposing (Html)
import Html.Attributes exposing (class)
import Page
import Page.Alt as Alt
import Page.Blank as Blank
import Page.Home as Home
import Page.NotFound as NotFound
import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), Parser, oneOf, s, string)



-- MODEL --


type alias Model =
    { key : Nav.Key
    , project : String
    , page : Page
    }


type Page
    = NotFound
    | Redirect
    | Home
    | Alt


init : String -> Url -> Nav.Key -> ( Model, Cmd Msg )
init flag url navKey =
    stepUrl url
        { key = navKey
        , project = flag
        , page = Redirect
        }



-- VIEW --


view : Model -> Document Msg
view model =
    let
        viewPage config =
            let
                { title, body } =
                    Page.view config
            in
            { title = title
            , body = body
            }
    in
    case model.page of
        Redirect ->
            viewPage Blank.view

        NotFound ->
            viewPage NotFound.view

        Home ->
            viewPage (Home.view model.project)

        Alt ->
            viewPage (Alt.view model.project)



-- UPDATE --


type Msg
    = ChangedUrl Url
    | ClickedLink Browser.UrlRequest


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ClickedLink urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model
                    , Nav.pushUrl model.key (Url.toString url)
                    )

                Browser.External href ->
                    ( model
                    , Nav.load href
                    )

        ChangedUrl url ->
            stepUrl url model



-- ROUTER --


stepPage : Model -> Page -> ( Model, Cmd Msg )
stepPage model newPage =
    ( { model | page = newPage }, Cmd.none )


stepUrl : Url.Url -> Model -> ( Model, Cmd Msg )
stepUrl url model =
    let
        parser =
            oneOf
                [ route Parser.top (stepPage model Home)
                , route (s "alt") (stepPage model Alt)
                ]
    in
    case Parser.parse parser url of
        Just answer ->
            answer

        Nothing ->
            ( { model | page = NotFound }
            , Cmd.none
            )


route : Parser a b -> a -> Parser (b -> c) c
route parser handler =
    Parser.map handler parser



-- SUBSCRIPTIONS --


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN --


main : Program String Model Msg
main =
    Browser.application
        { init = init
        , onUrlChange = ChangedUrl
        , onUrlRequest = ClickedLink
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
