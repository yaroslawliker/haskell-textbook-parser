module Parsing.TestExtractToken (extractTokenTests) where

import qualified Data.Text as T
import Test.HUnit

import Parsing.Data
import Parsing.Parser
import Parsing.Extractors.Word

testExtractTokenSingle :: Test
testExtractTokenSingle = TestCase $
    assertEqual "Should extract single word using extractToken" expected (extractToken [extractWord] text)
    where 
        text = T.pack "hello"
        expected = ExtractionResult (Token Word (T.pack "hello")) (T.pack "")

testExtractTokenTwoWords :: Test
testExtractTokenTwoWords = TestCase $
    assertEqual "Should extract only the first word" expected (extractToken [extractWord] text)
    where 
        text = T.pack "hello world"
        expected = ExtractionResult (Token Word (T.pack "hello")) (T.pack " world")

testExtractTokenEmpty :: Test
testExtractTokenEmpty = TestCase $
    assertEqual "Should return EOF for empty text" expected (extractToken [extractWord] text)
    where 
        text = T.empty
        expected = ExtractionResult (Token EOF T.empty) T.empty

testExtractTokenUndefined :: Test
testExtractTokenUndefined = TestCase $
    assertEqual "Should return Undefined for unhandled symbol" expected (extractToken [extractWord] text)
    where 
        text = T.pack "123"
        expected = ExtractionResult (Token Undifined (T.pack "1")) (T.pack "23")

extractTokenTests :: Test
extractTokenTests = TestList [
    TestLabel "Parsing: testExtractTokenSingle" testExtractTokenSingle,
    TestLabel "Parsing: testExtractTokenTwoWords" testExtractTokenTwoWords,
    TestLabel "Parsing: testExtractTokenEmpty" testExtractTokenEmpty,
    TestLabel "Parsing: testExtractTokenUndefined" testExtractTokenUndefined
    ]