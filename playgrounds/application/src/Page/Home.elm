module Page.Home exposing (view)

import Href
import Html exposing (Html)
import Html.Attributes exposing (class)



-- VIEW


view : String -> { title : String, content : Html msg }
view project =
    { title = "Home Page"
    , content =
        Html.div [ class "container main-container" ]
            [ Html.h1 [ class "message" ] [ Html.text ("Welcome to " ++ project ++ " playground.") ]
            , Html.a [ class "page-link", Href.alt ] [ Html.text "Change To Other Page" ]
            ]
    }
