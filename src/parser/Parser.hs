module Parser.Parser where

data TokenType = 
    Word | -- Simple word, as "названа"
    Punctiation | -- Set of symbols: ,.:[]()
    NewLine | -- \n symbol
    ListMark | -- Header numeration, numeric list or pointed list
    Symbol | -- Other symbols like ::, ->, | ect

data Token { type :: TokenType
           , symbols :: String 
           } deriving (Show)




    