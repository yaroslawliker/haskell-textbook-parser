module Parsing.Extractors.TestExtractSequence (extractSequenceGenericTests) where

import qualified Data.Text as T
import Test.HUnit

import Parsing.Data
import Parsing.Extractors.SequenceGeneric
import Parsing.Extractors.SymbolGeneric

testExtractSequenceGeneric :: Test
testExtractSequenceGeneric = TestCase $
    assertEqual "Should extract word '112223'" (extract text) expected
    where 
        set = "123"
        predicate = isInSetGeneric set
        extract = extractSequenceGeneric predicate Undifined

        text = T.pack "1122234567"
        expected = Just $ ExtractionResult (Token Undifined (T.pack "112223")) (T.pack "4567")

testExtractSequenceGenericWrong :: Test
testExtractSequenceGenericWrong = TestCase $
    assertEqual "Should extract Nothing" (extract text) expected
    where 
        set = "456"
        predicate = isInSetGeneric set
        extract = extractSequenceGeneric predicate Undifined

        text = T.pack "1122234567"
        expected = Nothing


extractSequenceGenericTests :: Test
extractSequenceGenericTests = TestList [
    TestLabel "Parsing: testExtractWord" testExtractSequenceGeneric,
    testExtractSequenceGenericWrong
    ]