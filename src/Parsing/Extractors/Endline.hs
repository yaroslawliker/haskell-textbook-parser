module Parsing.Extractors.Endline (extractEndline) where

import qualified Data.Text as T

import Parsing.Data
import Parsing.Extractors.SymbolGeneric


endLineTokens = "\n"
isEndLine = isInSetGeneric endLineTokens

-- Extracts Endline tokens
-- The are defined intokens are
extractEndline :: ExtractToken
extractEndline = extractSymbolGeneric isEndLine EndLine
