module Parsing.Parser where

import Data.Text as T
import Data.Char (isAlpha)

import Parsing.Data

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
