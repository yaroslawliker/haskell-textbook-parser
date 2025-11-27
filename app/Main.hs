module Main where

import System.IO (hSetEncoding, stdout, utf8)
import qualified Data.Text as T
import qualified Data.Text.IO as TIO

import Reader (readBook)
import Parsing.Parser (parseText)
import Parsing.Data
import Arranger (arrangeWords)

import Text.Pretty.Simple (pPrint)

printTokens :: [Token] -> IO ()
printTokens [] = return ()
printTokens (t:ts) = do
    pPrint t
    printTokens ts

printWords :: [T.Text] -> IO ()
printWords [w] = TIO.putStr w
printWords (w:ws) = do
    TIO.putStr $ w <>  (T.pack ", ")
    printWords ws


main :: IO ()
main = do
    let bookFile = "src/res/book.txt"
    hSetEncoding stdout utf8
    book <- readBook bookFile
    let tokens = parseText book
    printWords $ arrangeWords tokens
    TIO.putStrLn $ T.pack ""
    -- printTokens tokens
