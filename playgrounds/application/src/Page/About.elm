module Page.About exposing (view)

import Href
import Html exposing (Html)
import Html.Attributes exposing (class)



-- VIEW


view : String -> Html msg
view about =
    let
        _ =
            Debug.log "Why: " about
    in
    Html.div [ class "container main-container" ]
        [ Html.h1 [ class "message" ] [ Html.text ("Welcome to our " ++ about ++ " page.") ]
        ]
