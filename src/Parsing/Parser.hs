module Parsing.Parser where

import Data.Text as T
import Data.Char (isAlpha)

data TokenType =
    Word | -- Simple word, as "названа"
    Punctiation | -- Set of symbols: ,.:[]()
    NewLine | -- \n symbol
    ListMark | -- Header numeration, numeric list or pointed list
    Symbol | -- Other symbols like ::, ->, | ect
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

extractWord :: ExtractToken
extractWord input =
    case T.uncons input of
        Nothing -> Nothing
        Just (firstChar, _) ->
            if isAlpha firstChar
            then
                let (word, rest) = T.span isAlpha input
                in Just $ ExtractionResult (Token Word word) rest
            else
                Nothing

allTokenExtractors :: [ExtractToken]
allTokenExtractors = [extractWord]

extractToken :: [ExtractToken] -> Text -> ExtractionResult
extractToken extractors text
    | T.null text = ExtractionResult (Token EOF T.empty) T.empty
    | otherwise   = tryExtractors extractors
    where
        tryExtractors [] =
            case T.uncons text of
                Just (x, xs) -> ExtractionResult (Token Undifined (T.singleton x)) xs

        tryExtractors (f:fs) =
            let result = f text
            in case result of
                Just a  -> a
                Nothing -> tryExtractors fs


parseText :: T.Text -> [Token]
parseText text =
    if tokenType token == EOF
        then [token]
        else token : parseText restText
    where
        ExtractionResult token restText = extractToken allTokenExtractors text
