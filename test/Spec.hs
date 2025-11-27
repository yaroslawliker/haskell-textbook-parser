module Main where

import Test.HUnit
import System.Exit (exitFailure, exitSuccess)
import TestReader (readerTests)
import Parsing.TestExtractToken (extractTokenTests)
import Parsing.Extractors.TestExtractSequence (extractSequenceGenericTests)
import Parsing.Extractors.TestExtractWord (extractWordTests)
import Parsing.Extractors.TestExtractPunctuation (extractPunctuationTests)
import Parsing.Extractors.TestExtractWhitespace (extractWhitespaceTests)
    
allTests :: Test
allTests = TestList [
    readerTests,
    extractWordTests,
    extractTokenTests,
    extractPunctuationTests,
    extractSequenceGenericTests,
    extractWhitespaceTests
    ]

main :: IO ()
main = do
    counts <- runTestTT allTests
    if errors counts + failures counts == 0
        then exitSuccess
        else exitFailure