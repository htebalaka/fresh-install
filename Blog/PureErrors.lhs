
> module Errors where {

> import Control.Lens (preview)
> import Numeric.Lens (hex)

> trivial :: Int
> trivial = case [1..] of
>     Just x -> x
>     Nothing -> impossible "Errors.trivial"
>
> impossible :: String -> a
> impossible qualifiedName = error $ unlines
>     [ qualifiedName <> ": panic! (the 'impossible' happened)"
>     , "Please report this as a bug." ]


The basic idea here is that it's the callee's responsibility to ensure that
`error` is never reached, not the callee. If you think the usage is safe and
a caller encounters an error then you've made a mistake, and should be notified
of that fact.

For a more complex example, let's look at a parser for hexadecimal numbers.
First we'll show the "correct by construction" version, and then we'l show the
version I would probably write in most typical situations.

> data Hex = Zero | One | Two | Three | Four | Five | Six | Seven | Eight
>     | Nine | A | B | C | D | E | F
>
> properHexadecimal :: Parser Int
> properHexadecimal = fmap fromHex (some hexDigit)
>   where
>     fromHex :: NonEmpty -> Int
>     fromHex = foldl1' (\soFar next -> soFar * 16 + fromEnum next)
>     hexDigit :: Parser Hex
>     hexDigit = fmap (foldr (<|>) empty)
>         [ Zero <$ char '0'
>         , One <$ char '1'
>         , Two <$ char '2'
>         , Three <$ char '3'
>         , Four <$ char '4'
>         , Five <$ char '5'
>         , Six <$ char '6'
>         , Seven <$ char '7'
>         , Eight <$ char '8'
>         , Nine <$ char '9'
>         , A <$ char 'a'
>         , B <$ char 'b'
>         , C <$ char 'c'
>         , D <$ char 'd'
>         , E <$ char 'e'
>         , F <$ char 'f' ]
>    some :: forall a. Parser a -> Parser (NonEmpty a)
>    some a = (:|) <$> a <*> many a

You might ask why not use the default `Alternative.some`, and just use
`foldl1'`, since we know that `some` will return a non-empty list. However,
that does leave the possibility we've made a mistake in our code, and we
actually got an empty list as a result (for the longest time I thought it was
`many` that returned 1-or-more elements, not `some`). So the next option is to
use `foldl1' (...) 0`, which ensures we always get an answer, but it might hide
a bug in our implementation: we shouldn't ever get an empty list, so if we have
to give a default value for that case all we're doing is hiding that something
is wrong.

Then there's the fact that `hexDigit` is just really long and tedious, and with
that much boiler plate there's a higher chance that we made a typo that went
unnoticed (I actually did do that while writing this). Though we could use
`fromEnum` to map characters to ints, and then offset them and use `toEnum`,
though `toEnum` is also a partial function, and will throw an uninformative
error message if we mess up.

Here's the version I like:

> import Control.Lens (preview)
> import Numeric.Lens (hex)
>
> hexadecimal :: Parser Int
> hexadecimal = fmap fromHex (some hexDigit)
>   where
>     fromHex :: [Char] -> Int
>     fromHex a = case preview hex a where
>         Just a' -> a'
>         Nothing -> error $ unlines
>             [ "Errors.hexadecimal: panic! (the 'impossible' happened)"
>             , "  fails on input: " <> show a
>             , "Please report this as a bug" ]
>     hexDigit :: Parser Char
>     hexDigit = some (digitChar <|> oneOf "abcdef")

Here we don't bother defining our own version of `some`, nor do we bother with
using `(<$)` to handle the parsing from single character digits to hex digits.
`preview hex :: [Char] -> Maybe Int` returns `Nothing` when given the empty
list, and it does its own parsing of the characters. Now, it's possible that
we've somehow given it an empty list or incorrect characters, but we're
confident that we haven't. So here we throw an error for those cases. If we've
written our function right nobody should ever see those errors, and if we
haven't we'll be notified.

