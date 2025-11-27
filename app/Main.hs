module Main where

import System.IO (hSetEncoding, stdout, utf8)
import Reader (readBook)
import Parsing.Parser (parseText)
import Parsing.Data
import Arranger

import Text.Pretty.Simple (pPrint)

printTokens :: [Token] -> IO ()
printTokens [] = return ()
printTokens (t:ts) = do
    pPrint t
    printTokens ts


main :: IO ()
main = do
    let bookFile = "src/res/short_book.txt"
    hSetEncoding stdout utf8
    book <- readBook bookFile
    let tokens = filterWords $ parseText book
    printTokens tokens
