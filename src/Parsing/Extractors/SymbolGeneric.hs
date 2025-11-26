module Parsing.Extractors.SymbolGeneric (isInSetGeneric, extractSymbolGeneric) where

import qualified Data.Text as T
import Parsing.Data

-- Makes predicates based on the list
isInSetGeneric :: [Char] -> (Char -> Bool)
isInSetGeneric symbols symbol = symbol `elem` symbols

-- Makes extractors which extract only one symbol 
extractSymbolGeneric :: (Char -> Bool) -> TokenType ->  ExtractToken
extractSymbolGeneric isInSet tokenType text =
    case T.uncons text of
        Nothing -> Nothing
        Just (symbol, restText) ->
            if isInSet symbol
            then Just $ ExtractionResult (Token tokenType (T.singleton symbol)) restText
            else Nothing
