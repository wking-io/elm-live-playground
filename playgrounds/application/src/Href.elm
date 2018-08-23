module Href exposing (alt, home)

import Html exposing (Attribute)
import Html.Attributes as Attr
import Url.Builder as Url



-- HREFS


home : Attribute msg
home =
    Url.absolute [] []
        |> Attr.href


alt : Attribute msg
alt =
    Url.absolute [ "alt" ] []
        |> Attr.href
