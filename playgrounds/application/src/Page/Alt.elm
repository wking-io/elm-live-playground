module Page.Alt exposing (view)

import Href
import Html exposing (Html)
import Html.Attributes exposing (class)



-- VIEW


view : String -> { title : String, content : Html msg }
view project =
    { title = "Alt Page"
    , content =
        Html.div [ class "container main-container" ]
            [ Html.h1 [ class "message" ] [ Html.text ("Welcome to " ++ project ++ " playground. This is another page.") ]
            , Html.a [ class "page-link", Href.home ] [ Html.text "Change To Home Page" ]
            ]
    }
