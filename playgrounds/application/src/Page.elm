module Page exposing (view)

import Browser exposing (Document)
import Html exposing (Html)
import Html.Attributes exposing (class, href)


view : { title : String, content : Html msg } -> Document msg
view { title, content } =
    { title = title ++ " - elm-live"
    , body = content :: [ viewFooter ]
    }


viewFooter : Html msg
viewFooter =
    Html.footer []
        [ Html.div [ class "container" ]
            [ Html.p [ class "footer-text" ]
                [ Html.text "Checkout the package repo at "
                , Html.a [ class "footer-link", href "https://github.com/architectcodes/elm-live" ] [ Html.text "elm-live" ]
                ]
            ]
        ]
