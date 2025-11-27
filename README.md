# Intro
This is an app for parsing a textbook into tokens and arranging the data.
Made as lab #3 of the Functional Programming University course.

# Build
To build, you will need to have Haskel and Cabal.

First, build everything with
```cabal build```.
If there are some issues (like cabal didn't see changes and writes "Everything is up to date"), run ```cabal clean``` and try again. 

There 2 enry-points in the app:
1) 'parse' for running the parsing example of a small file `src/res/short_book.txt`.
2) 'words' for printing all words from a real textbook (`src/res/book.txt`, in Ukrainian) in alphabetical order, grouped by the first letter.
You may change the content of the files if you want.

## Running
Pretty simple, run
```cabal run parse```
or
```cabal run words```
