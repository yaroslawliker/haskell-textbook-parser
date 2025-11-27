module Parsing.Data where

import Data.Text as T

-- Enumeration of token types
data TokenType =
    Word | -- Simple word, as "названа"
    Punctiation | -- Set of symbols: ,.:[]()
    Number | -- Any sequence of digits
    Whitespace | -- Any sequence of whitespaces
    EndLine | -- \n symbol
    EOF |
    Undifined
    deriving (Show, Eq)

-- Data for the token
data Token = Token
    { tokenType :: TokenType
    , substring :: T.Text -- The substring, forming this token
    } deriving (Show, Eq)

data ExtractionResult = ExtractionResult
    { token :: Token
    , restText :: T.Text -- The rest of the text after extracting the token
    } deriving (Show, Eq)

-- Common interface for extracting the tokens
-- Nothing represent's that token hadn`t been extracted
type ExtractToken = Text -> Maybe ExtractionResult