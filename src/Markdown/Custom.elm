module Markdown.Custom exposing
    ( readWithExtensions, writeWithExtensions
    , parseInline
    )

{-| Read and writeWithExtensions custom Markdown documents.


# Basic usage

@docs readWithExtensions, writeWithExtensions


# Blocks


# Inlines

@docs parseInline

-}

import Document exposing (Block, Document, Inline)
import Parser exposing (Parser)



-- BASIC USAGE


type alias Extensions =
    { blocks : List (List (Parser Block) -> List (Parser Inline) -> Parser Block)
    , inlines : List (List (Parser Inline) -> Parser Inline)
    }


{-| Reads a Markdown document with custom extensions.
This starts with a plain Markdown implementation.

Extensions are defined using custom parsers from the
[`davidcavazos/parser`](https://package.elm-lang.org/packages/davidcavazos/parser/latest/)
library.

The extensions are tried in order.
If no extension maches, it is interpreted as a normal paragraph.

    import Document exposing (Block(..), Inline(..))
    import Parser exposing (Parser, andThen, anyChar, drop, into, line, succeed, take, text, textOf, until)

    -- A custom header starts with `--`
    customHeading : List (Parser Block) -> List (Parser Inline) -> Parser Block
    customHeading blocks inlines =
        into "Custom heading"
            ( succeed Heading1
                |> drop (text "--")
                |> take (line |> andThen (parseInline inlines))
            )

    -- A custom bold <<looks like this>>
    customBold : List (Parser Inline) -> Parser Inline
    customBold inlines =
        into "Custom bold"
            ( succeed Bold
                |> drop (text "<<")
                |> take
                    (textOf (anyChar |> until (text ">>"))
                        |> andThen (parseInline inlines)
                    )
                |> drop (text ">>")
            )

    readWithExtensions
        { blocks = [ customHeading ]
        , inlines = [ customBold ]
        }
        (String.join "\n"
            [ "-- 📄 Markdown with a custom heading"
            , "Markdown with custom <<bold>>"
            ]
        )
    --> ""

-}
readWithExtensions : Extensions -> String -> String
readWithExtensions { blocks, inlines } text =
    text


writeWithExtensions : Document -> String
writeWithExtensions doc =
    Debug.todo "writeWithExtensions"



-- BLOCKS
-- INLINES


parseInline : List (Parser Inline) -> String -> Parser (List Inline)
parseInline extensions text =
    Debug.todo "parseInline"
