module Main where

import Test.HUnit
import System.Exit (exitFailure, exitSuccess)
import TestReader (readerTests)
import Parsing.TestExtractWord (extractWordTests)
import Parsing.TestExtractToken (extractTokenTests)
    
allTests :: Test
allTests = TestList [
    readerTests,
    extractWordTests,
    extractTokenTests
    ]

main :: IO ()
main = do
    counts <- runTestTT allTests
    if errors counts + failures counts == 0
        then exitSuccess
        else exitFailure