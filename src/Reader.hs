module Reader (readBook) where

import Data.Text
import Data.Text.IO as TIO
import System.IO (hSetEncoding, stdout, stdin, utf8)

readBook :: String -> IO Text
readBook filepath = do
    hSetEncoding stdout utf8
    hSetEncoding stdin utf8

    TIO.readFile filepath
