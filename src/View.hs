module View where

import Data.Text (Text, pack)
import qualified Data.Text.IO as TIO
import Text.Pretty.Simple (pPrint)

import Parsing.Data (Token)

-- Prints tokens, separate line for every
printTokens :: [Token] -> IO ()
printTokens [] = return ()
printTokens (t:ts) = do
    pPrint t
    printTokens ts

-- Print words with commas
printWords :: [Text] -> IO ()
printWords [w] = TIO.putStr w
printWords (w:ws) = do
    TIO.putStr $ w <> pack ", "
    printWords ws

-- Print words with commas and newline for each list
printWordLists :: [[Text]] -> IO ()
printWordLists [] = return ()
printWordLists (l:ls) = do
    printWords l
    TIO.putStr $ pack "\n\n"
    printWordLists ls

