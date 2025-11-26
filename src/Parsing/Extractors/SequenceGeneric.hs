module Parsing.Extractors.SequenceGeneric where

import Data.Text as T

import Parsing.Data

-- Constructs extractor, that extract sequence till
extractSequenceGeneric :: (Char -> Bool) -> TokenType ->  ExtractToken
extractSequenceGeneric isInSet tokenType input =
    case T.uncons input of
        Nothing -> Nothing
        Just (firstChar, _) ->
            if isInSet firstChar
            then
                let (word, rest) = T.span isInSet input
                in Just $ ExtractionResult (Token tokenType word) rest
            else
                Nothing