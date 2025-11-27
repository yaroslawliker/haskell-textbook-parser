module Parsing.Parser where

import Data.Text as T

import Parsing.Data

-- Extractors
import Parsing.Extractors.Word
import Parsing.Extractors.Number (extractNumber)
import Parsing.Extractors.Punctuation (extractPunctiation)
import Parsing.Extractors.Endline (extractEndline)
import Parsing.Extractors.Whitespace (extractWhitespace)

-- List of all extracters
allTokenExtractors :: [ExtractToken]
allTokenExtractors = [
    extractWord,
    extractNumber,
    extractWhitespace,
    extractPunctiation,
    extractEndline
    ]

-- Extractes token with given list of extracters and text
-- If no extracters match the symbol, extracts the symbol as Undefined
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

-- Parses the book (or other text) into tokens
parseText :: T.Text -> [Token]
parseText text =
    if tokenType token == EOF
        then [token]
        else token : parseText restText
    where
        ExtractionResult token restText = extractToken allTokenExtractors text
