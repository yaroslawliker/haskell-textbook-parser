module Parsing.Extractors.Word where

import Data.Text as T
import Data.Char (isAlpha)

import Parsing.Data

-- Extracter for words - sequences of isAlpha chars
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