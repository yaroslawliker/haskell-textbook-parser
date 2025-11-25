module Main where

import System.IO (hSetEncoding, stdout, utf8)
import Reader (readBook)
import Parsing.Parser (parseText)
import Text.Pretty.Simple (pPrint)


main :: IO ()
main = do
    let bookFile = "src/res/short_book.txt"
    hSetEncoding stdout utf8
    book <- readBook bookFile
    let tokens = parseText book
    pPrint tokens
