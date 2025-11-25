{-# LANGUAGE OverloadedStrings #-}
module TestReader (readerTests) where

import Data.Text (Text) -- Імпортуємо тип Text
import Test.HUnit
import Reader (readBook)

example_filepath :: String
example_filepath = "test/res/ukr_example.txt" 

expected_text :: Text
expected_text = "Мова програмування Haskell названа на честь американського математика Гаскелла Каррі."

testReader :: Test
testReader = TestCase $ do
    actual_text <- readBook example_filepath
    assertEqual "Should read book content correctly" expected_text actual_text

readerTests :: Test
readerTests = TestList [
    TestLabel "Reader: readBook" testReader
    ]