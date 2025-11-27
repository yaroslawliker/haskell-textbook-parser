module Main where

import System.IO (hSetEncoding, stdout, utf8)
import qualified Data.Text as T
import qualified Data.Text.IO as TIO

import Reader (readBook)
import Parsing.Parser (parseText)
import Parsing.Data
import Arranger (arrangeWords, groupByFirstLetter)
import View (printWordLists, printTokens)

main :: IO ()
main = do
    let bookFile = "src/res/short_book.txt"
    hSetEncoding stdout utf8
    book <- readBook bookFile
    let tokens = parseText book
    printWordLists $ groupByFirstLetter $ arrangeWords tokens
    TIO.putStrLn $ T.pack ""
    
