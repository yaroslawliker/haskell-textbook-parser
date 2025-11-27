module Arranger where

import qualified Data.Text as T
import Data.List (sort)
import Parsing.Data ( Token(tokenType), Token(substring), TokenType(Word) )

-- filterWords :: [Token] -> [Token]
-- filterWords = filter (\x -> tokenType x == Word)

-- extractWords :: [Token] -> [T.Text]
-- extractWords = map substring

-- sortWords :: [T.Text] -> [T.Text]
-- sortWords = sort

arrangeWords :: [Token] -> [T.Text]
arrangeWords = sort . map substring . filter (\x -> tokenType x == Word)