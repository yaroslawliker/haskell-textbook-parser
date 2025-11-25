{-# LANGUAGE OverloadedStrings #-}
module TestReader (readerTests) where

import qualified Data.Text as T
import Test.HUnit
import Reader (readBook)

example_filepath :: String
example_filepath = "test/res/ukr_example.txt" 

expected_text :: T.Text
expected_text = "Мова програмування Haskell названа на честь американського математика Гаскелла Каррі."

testReader :: Test
testReader = TestCase $ do
    actual_text <- readBook example_filepath
    assertEqual "Should read book content correctly" expected_text actual_text

testReaderTextLength :: Test
testReaderTextLength = TestCase $ do
    actual_text <- readBook example_filepath
    assertEqual "Should return book length correctly" (T.length actual_text) 85

readerTests :: Test
readerTests = TestList [
    TestLabel "Reader: readBook" testReader,
    TestLabel "Reader: readBookLength" testReaderTextLength
    ]