module Parsing.Extractors.TestExtractPunctuation (extractPunctuationTests) where

import qualified Data.Text as T
import Test.HUnit

import Parsing.Data
import Parsing.Extractors.Punctuation

testExtractPunctiation :: Test
testExtractPunctiation = TestCase $
    assertEqual "Should extract word '.'" (extractPunctiation text) expected
    where 
        text = T.pack ". hello"
        expected = Just $ ExtractionResult (Token Punctiation (T.pack ".")) (T.pack " hello")


extractPunctuationTests :: Test
extractPunctuationTests = TestList [
    TestLabel "Parsing: testExtractPunctiation" testExtractPunctiation
    ]