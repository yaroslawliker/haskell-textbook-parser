module Parsing.Extractors.TestExtractWord (extractWordTests) where

import qualified Data.Text as T
import Test.HUnit

import Parsing.Data
import Parsing.Extractors.Word

testExtractWord :: Test
testExtractWord = TestCase $
    assertEqual "Should extract word 'hello'" (extractWord text) expected
    where 
        text = T.pack "hello456"
        expected = Just $ ExtractionResult (Token Word (T.pack "hello")) (T.pack "456")

testExtractWordUkr :: Test
testExtractWordUkr = TestCase $
    assertEqual "Should extract word 'Привіт'" (extractWord text) expected
    where 
        text = T.pack "Привіт456"
        expected = Just $ ExtractionResult (Token Word (T.pack "Привіт")) (T.pack "456")

testExtractWordEnd :: Test
testExtractWordEnd = TestCase $
    assertEqual "Should extract word 'hello'" (extractWord text) expected
    where 
        text = T.pack "hello"
        expected = Just $ ExtractionResult (Token Word (T.pack "hello")) (T.pack "")

testExtractWordNotWord:: Test
testExtractWordNotWord = TestCase $
    assertEqual "Should extract nothing" (extractWord text) expected
    where 
        text = T.pack "1234hello"
        expected = Nothing

extractWordTests :: Test
extractWordTests = TestList [
    TestLabel "Parsing: testExtractWord" testExtractWord,
    TestLabel "Parsing: testExtractWordUkr" testExtractWordUkr,
    TestLabel "Parsing: testExtractWordEnd" testExtractWordEnd,
    TestLabel "Parsing: testExtractWordNotWord" testExtractWordNotWord
    ]