module Document exposing
    ( Block(..)
    , Document(..)
    , Image(..)
    , Inline(..)
    )

{-| A general-purpose representation of a document.
-}


type Document
    = Document String (List Block)


type Block
    = Paragraph (List Inline)
    | Heading1 (List Inline)
    | Heading2 (List Inline)
    | Heading3 (List Inline)
    | Heading4 (List Inline)
    | Heading5 (List Inline)
    | Heading6 (List Inline)
    | CodeBlock String
    | BlockQuote (List Block)
    | NumberedList (List (List Block))
    | BulletList (List (List Block))
    | TaskList (List ( Bool, List Block ))
    | HorizontalLine
    | Table (List (List (List Block)))
    | Collapsible String (List Block)


type Inline
    = Normal String
    | Bold (List Inline)
    | Italic (List Inline)
    | Underline (List Inline)
    | Strikethrough (List Inline)
    | Superscript (List Inline)
    | Subscript (List Inline)
    | CodeSpan (List Inline)
    | Link String String
    | Image Image


type Image
    = ImageUrl String String
