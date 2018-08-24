module Page.NotFound exposing (view)

import Html exposing (Html)
import Html.Attributes exposing (alt, class, id, src, tabindex)



-- VIEW


view : { title : String, content : Html msg }
view =
    { title = "Page Not Found"
    , content =
        Html.main_ [ id "content", class "container main-container", tabindex -1 ]
            [ Html.h1 [] [ Html.text "This is how a 404 page works." ]
            ]
    }
