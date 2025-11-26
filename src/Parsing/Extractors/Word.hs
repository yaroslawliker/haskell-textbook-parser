module Parsing.Extractors.Word where

import Data.Text as T
import Data.Char (isAlpha)

import Parsing.Data
import Parsing.Extractors.SequenceGeneric (extractSequenceGeneric)

-- Extracter for words - sequences of isAlpha chars
extractWord :: ExtractToken
extractWord = extractSequenceGeneric isAlpha Word 