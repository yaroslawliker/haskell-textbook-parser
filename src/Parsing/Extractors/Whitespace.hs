module Parsing.Extractors.Whitespace where

import Data.Text as T
import Data.Char (isDigit)

import Parsing.Data
import Parsing.Extractors.SequenceGeneric (extractSequenceGeneric)
import Parsing.Extractors.SymbolGeneric (isInSetGeneric)
import qualified GHC.Generics as T

whitespaces = " \t"
isWhitespace = isInSetGeneric whitespaces

-- Extracter for whitespaces - sequences of spaces and tabs
-- Reduces the substring to " "
extractWhitespace :: ExtractToken
extractWhitespace text = 
    case result of
        Nothing -> Nothing
        Just (ExtractionResult (Token tokenType substring) restText) -> Just $ ExtractionResult (Token tokenType (T.singleton ' ')) restText
    where
        -- Extractor for whitespace (whole substring)
        extract = extractSequenceGeneric isWhitespace Whitespace
        result = extract text
