module Markdown.Custom exposing (readWithExtensions, writeWithExtensions)

{-| Read and writeWithExtensions custom Markdown documents.

@docs readWithExtensions, writeWithExtensions

-}

import Document exposing (Block, Document, Inline)
import Parser exposing (Parser)


type alias CustomExtensions =
    { customBlocks : List (Parser Block)
    , customInlines : List (Parser Inline)
    }


{-| Read a Markdown document with custom extensions.
This starts with a plain Markdown implementation.

Extensions are defined using custom parsers from the
[`davidcavazos/parser`](https://package.elm-lang.org/packages/davidcavazos/parser/latest/)
library.

The extensions are tried in order.
If no extension maches, it is interpreted as a normal paragraph.

    import Document exposing (Block(..), Heading(..), Inline(..))
    import Parser exposing (Parser)

    customHeading : Parser Block
    customHeading =
        into "Custom heading" <|
            succeed

    customBold : Parser Inline
    customBold =
        Debug.todo "customBold"

    readWithExtensions
        { customBlocks =
            [ customHeading
            ]
        , customInlines =
            [ customBold
            ]
        }
        (String.join "\n"
            [ "-- 📄 Markdown with a custom heading"
            , "Markdown with custom <<bold>>"
            ]
        )
    --> ""

-}
readWithExtensions : CustomExtensions -> String -> String
readWithExtensions { customBlocks, customInlines } text =
    text


writeWithExtensions : Document -> String
writeWithExtensions doc =
    Debug.todo "writeWithExtensions"
