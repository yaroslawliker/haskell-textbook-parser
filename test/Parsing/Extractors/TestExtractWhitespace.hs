module Parsing.Extractors.TestExtractWhitespace (extractWhitespaceTests) where

import qualified Data.Text as T
import Test.HUnit

import Parsing.Data
import Parsing.Extractors.Whitespace

testExtractSpace :: Test
testExtractSpace = TestCase $
    assertEqual "Should extract Whitespace 'hello'" (extractWhitespace text) expected
    where 
        text = T.pack " hello"
        expected = Just $ ExtractionResult (Token Whitespace (T.pack " ")) (T.pack "hello")
        
testExtractTab :: Test
testExtractTab = TestCase $
    assertEqual "Should extract Whitespace '\thello'" (extractWhitespace text) expected
    where 
        text = T.pack " hello"
        expected = Just $ ExtractionResult (Token Whitespace (T.pack " ")) (T.pack "hello")

testExtractWhitespaces:: Test
testExtractWhitespaces = TestCase $
    assertEqual "Should extract tab" (extractWhitespace text) expected
    where 
        text = T.pack "  \t hello"
        expected = Just $ ExtractionResult (Token Whitespace (T.pack " ")) (T.pack "hello")

extractWhitespaceTests :: Test
extractWhitespaceTests = TestList [
    testExtractSpace,
    testExtractTab,
    testExtractWhitespaces
    ]