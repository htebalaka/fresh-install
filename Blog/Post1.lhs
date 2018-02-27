
Though Haskell is an indentation sensitive language, it has a separate braces-
and-semicolon syntax like C++. Not many Haskellers use it, but to make things
more familiar (and to avoid anyone having to chase down indentation related
parse failures), I'm going to use it. However, I'm going to indent my code so
that replacing all the braces/semicolons with spaces will still be valid code.

> {-# LANGUAGE NoImplicitPrelude #-}
>
> module Foo where {

> import Prelude ();

Suppose C++ didn't have boolean values, it wouldn't be terribly hard 

+> enum bool { false, true };

+> bool not(bool x) {
+>     switch(x)
+>     {
+>         case true: return false;
+>         default: return true;
+>     }
+> }

> data Bool = False | True;

> not :: Bool -> Bool;
> not x = case x of {
>     True -> False;
>     _ -> True;
>     };

This is a pretty straightforward translation of the C++ code, with the `data`
keyword taking the place of the `enum` keyword. Both type constructors
(e.g. `Bool`) and data constructors (e.g. `False` and `True`) are capitalized
in Haskell, while values and functions (e.g. `not`) start with lower case.

Probably the biggest difference so far is that the type is declared separately
from the variable names. However, our definition of `not` isn't very idiomatic,
and more typically we would write

< not :: Bool -> Bool;
< not True = False;
< not _ = True;

Here we've defined our function over multiple lines, and they get tried in
order Function application doesn't use parentheses like in other languages, so
we call our function with simple juxtaposition.

< not True
< >>> False

Now let's define the if function. In C++ this would look like:

< template <class A>
< A ifThenElse(bool b, A t, A f) {
<     switch(b) {
<         case true: return t;
<         case default: return f;
< }}

And the Haskell version

> ifThenElse :: Bool -> a -> a -> a;
> ifThenElse True t _ = t;
> ifThenElse False _ f = f;

You'll notice Haskell is quite a bit more terse. But another thing you might
notice that's different is the type. The C++ type would probably best be
described by `(bool, A, A) -> A`, but the Haskell version looks different. So
what's going on?

One way to understand what's going on is to realize of the function type (->)
has being an infix operator with right associativity. So the type signature
can be better understood as:

< ifThenElse :: Bool -> (a -> (a -> a));

So it's a function that takes one argument, a `Bool`, which then returns a
function that takes the next argument (of type `a`), which returns a function
that takes the next argument, also the same type, which returns a value of
the same type again.

Now let's go back to prefix-style function application. For multiple arguments
it looks like

< ifThenElse someCondition trueBranch falseBranch

If we think of the whitespace as also being a metaphorical infix operator with
left associativity then this becomes:

< ((ifThenElse someCondition) trueBranch) falseBranch

So we apply the ifThenElse function to its first argument, which gets us the
next function which we apply to the next argument, which gets us the last
function, which we apply to the last argument.

This is called currying, and it's not really any different fundamentally from
the tupling our arguments: we can even convert functions between the curried/
uncurried versions with little difficulty. However, as it turns out later the
curried versions are a little nicer to use, so we use them by default.

We could even accomplish this in C++, though we would have to call our function
like

< ifThenElse(someCondition)(trueBranch)(falseBranch)

There would be a performance cost, but because currying is so common in Haskell
GHC compiles both curried and non-curried versions of functions, and if you
fully apply them (or they become fully applied in the case of optimizing them)
then GHC calls the non-curried versions.

Anyway, we won't use our ifThenElse function, as Haskell has special syntax
for it:

< if someCondition then trueBranch else falseBranch

One requirement in Haskell is that we always return something, so we can't
leave out the else branch in general. But we will discover types for which
that is sensible later on.

Haskell also let's us define our own infix operators, including specifying if the
are left associative (infixl), right associative (infixr), or don't associate
(infix), and specifying how tightly they bind (0-9).

> (&&) :: Bool -> Bool -> Bool;
> (&&) False _ = False;
> (&&) True True = True;
> infixr 3 &&;

We can then use these prefix-style (e.g. `(&&) a b`) or infix-style
(e.g. `a && b`). It's generally a good idea to *not* define your own infix
operators, as they can be quite difficult for other people to read. It's
usually good style is to use parentheses nearly always when mixing different
infix operators, so readers don't need to know the binding precedence of each
operator. There are a few idioms that are universally understood that stand out
as exceptionsm, which will be discussed later.

But enough about booleans. Let's talk more data types. Haskell has primitive
integer and character types, but we could pretend they're defined like:

< data Int = 0 | 1 | (-1) | 2 | (-2) | ...
< data Char = 'a' | 'b' | 'c' | ...
< data Double = 0.0 | 0.1 | 0.11 | ...

Notice that the negative numbers have to be parenthesized. That is because if
we wrote `someFunction -2` it gets interpreted as `(-) someFunction 2`, and
then we'll probably get some type error about trying to subtract a number from
a function.

We can also define pairs. In C++ we would have

< template <class A, class B>
< struct Pair {
    A fst,
    B snd };

and the Haskell equivalent, and a few functions on pairs.

> data Pair a b = MkPair a b;
>
> fst :: Pair a b -> a;
> fst (MkPair a b) = a;
>
> snd :: Pair a b -> b;
> snd (MkPair a b) = b;

This creates the function `MkPair`, with the type `a -> b -> Pair a b`. One
notable difference between this and the Bool type is that Pair isn't a type.
`Pair Int Bool` is a type, as is `Pair Char (Pair Int Int)`, but `Pair` is
actually more like a function, with the type `Type -> Type -> Type`. This isn't
a super important distinction right now, so just file it in the back of your
brain. It'll become useful later on.

It's generally clear from context whether we're expecting a value or a type, so
a lot of types use the same name for the type constructor and value
contructor; we could have just as easily wrote `data Pair a b = Pair a b;`

Anyway, we're only defining this data type as a matter of instruction. Haskell
supports special syntax for tuples up to size FIXME, so we can pretend it's
defined as:

>> -- data (a, b) = (a, b);
>> -- data (a, b, c) = (a, b, c);
>> -- data (a, b, c, d) = ...;

Remember I mentioned we can convert between curried and uncurried functions.
We won't need to do this often (because uncurried functions just aren't useful
that often), but again as matter of instruction:

> curry :: ((a, b) -> c) -> a -> b -> c
> curry f a b = f (a, b)
>
> uncurry :: (a -> b -> c) -> (a, b) -> c
> uncurry f (a, b) = f a b

These functions don't just iteratively return functions as we supply each
argument, one of their arguments is a function itself. We'll use this a lot
later, as it's really useful. It's called functional programming for a reason.

We could also define a 0-tuple like `data Unit = Unit`, but Haskell includes
support for that out of the box, and we could pretend it's defined like:

> -- data () = ();

This is used like `void` in C++. When we were talking about if syntax I
mentioned that we always need to return something, and the 0-tuple is what we
use to make that happen. File that away in your brain for later.

Let's define something more complex than a struct or an enum. Haskell has
special support for lists, and we could pretend it's defined like

< data [a] = a : [a] | [];

But as a matter of instruction we'll define them ourselves.

> data List a = Cons a (List a) | Nil;
> infixr 5 `Cons`
>
> badSum :: List Int -> Int;
> badSum Nil = 0;
> badSum (Cons a b) = a + sum b;
>
> goodSum :: List Int -> Int;
> goodSum x = goodSumHelper 0 x;
>
> goodSumHelper :: Int -> List Int -> Int;
> goodSumHelper !n (Cons a b) = goodSumHelper (n + a) b;
> goodSumHelper n Nil = n;

We've introduced quite a few new concepts here. First, the data declaration
isn't quite a struct or an enum. It's more like an enum of structs. Our data
declaration creates two data constructors:

< Nil :: List a
< Cons :: a -> List a -> List a

Nil is the empty list, and Cons sticks an element onto the front of an existing
list. Because of the infix declaration we can construct finite lists like

< smallPrimes :: List Int;
< smallPrimes = 2 `Cons` 3 `Cons` 5 `Cons` 7 `Cons` Nil

This isn't especially pretty, but the built in syntax lets us do [2, 3, 5, 7]
instead.

# functors

So let's try to define a few functions on lists.

(!!) :: [a] -> Int -> Maybe a

last :: [a] -> Maybe a

foldl :: (r -> a -> r) -> r -> [a] -> r
foldr :: (a -> r -> r) -> r -> [a] -> r

mapList :: (a -> b) -> [a] -> [b]
mapList f (x : xs) = f x : mapList f xs
mapList _ [] = []

mapMaybe :: (a -> b) -> Maybe a -> Maybe b
mapMaybe f (Just x) = Just (f x)
mapMaybe _ Nothing = Nothing

class Functor f where {
    fmap :: (a -> b) -> (f a -> f b);
}

instance Functor [] where {
    fmap = mapList;
}
instance Functor Maybe where {
    fmap = mapMaybe
}


