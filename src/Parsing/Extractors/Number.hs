module Parsing.Extractors.Number where

import Data.Text as T
import Data.Char (isDigit)

import Parsing.Data
import Parsing.Extractors.SequenceGeneric (extractSequenceGeneric)

-- Extracter for numbers - sequences of digits
extractNumber :: ExtractToken
extractNumber = extractSequenceGeneric isDigit Number