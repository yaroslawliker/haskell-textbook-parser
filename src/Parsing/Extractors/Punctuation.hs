module Parsing.Extractors.Punctuation (extractPunctiation) where

import qualified Data.Text as T
-- import Data.Char (isPunctuation)

import Parsing.Data


-- Alternative way of defining tokens
puncTokens = ",.?!;:-()[]{}"

-- Extracts punctuation tokens
-- The are defined intokens are
extractPunctiation :: ExtractToken
extractPunctiation text =
    case T.uncons text of
        Nothing -> Nothing
        Just (symbol, restText) ->
            if symbol `elem` puncTokens --isPunctuation symbol
            then Just $ ExtractionResult (Token Punctiation (T.singleton symbol)) restText
            else Nothing
