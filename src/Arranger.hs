module Arranger where

import Parsing.Data ( Token(tokenType), TokenType(Word) )

filterWords :: [Token] -> [Token]
filterWords = filter (\x -> tokenType x == Word)

