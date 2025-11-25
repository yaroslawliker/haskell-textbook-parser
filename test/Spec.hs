module Main where

import Test.HUnit
import System.Exit (exitFailure, exitSuccess)
import TestReader (readerTests)
import Parsing.TestExtractToken (extractTokenTests)
import Parsing.Extractors.TestExtractWord (extractWordTests)
    
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