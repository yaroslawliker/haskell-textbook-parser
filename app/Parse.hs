module Main where

import Reader (readBook)
import Parsing.Parser (parseText)
import View (printTokens)

main :: IO ()
main = do
    let bookFile = "src/res/short_book.txt"
    book <- readBook bookFile
    let tokens = parseText book
    printTokens tokens
    
