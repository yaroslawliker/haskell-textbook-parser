module Main where

import qualified Data.Text as T
import qualified Data.Text.IO as TIO

import Reader (readBook)
import Parsing.Parser (parseText)
import Arranger (arrangeWords, groupByFirstLetter)
import View (printWordLists)

main :: IO ()
main = do
    let bookFile = "src/res/book.txt"
    book <- readBook bookFile

    let tokens = parseText book
    
    printWordLists $ groupByFirstLetter $ arrangeWords tokens
    TIO.putStrLn $ T.pack ""
    
