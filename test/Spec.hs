module Main where

import Test.HUnit
import System.Exit (exitFailure, exitSuccess)
import TestReader (readerTests)
    
allTests :: Test
allTests = TestList [
    readerTests
    ]

main :: IO ()
main = do
    counts <- runTestTT allTests
    if (errors counts + failures counts == 0)
        then exitSuccess
        else exitFailure