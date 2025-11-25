module Main where

import qualified Data.Text.IO as TIO
import Reader (readBook)

main :: IO ()
main = do
    let bookFile = "src/res/book.txt"
    book <- readBook bookFile
    TIO.putStrLn book
