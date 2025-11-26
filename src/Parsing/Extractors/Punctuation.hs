module Parsing.Extractors.Punctuation (extractPunctiation) where

import qualified Data.Text as T
-- Alternative way of defining tokens
-- import Data.Char (isPunctuation)

import Parsing.Data
import Parsing.Extractors.SymbolGeneric


puncTokens = ",.?!;:-()[]{}"
isPunct = isInSetGeneric puncTokens


-- Extracts punctuation tokens
-- The are defined intokens are
extractPunctiation :: ExtractToken
extractPunctiation = extractSymbolGeneric isPunct Punctiation
