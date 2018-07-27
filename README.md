# Overloaded lemmas

This project contains Hoare Type Theory libraries from
[How to make ad hoc proof automation less ad hoc](https://software.imdea.org/~aleks/papers/lessadhoc/journal.pdf) paper.

The project presents a series of design patterns for *canonical structure* programming that
enable one to carefully and predictably coax Coq’s type inference engine into triggering
the execution of user-supplied algorithms during unification, and illustrates these patterns
through several realistic examples drawn from Hoare Type Theory.
The project also contains a typeclasses-based re-implementation for comparison.

## Initial authors

Georges Gonthier, Beta Ziliani, Aleksandar Nanevski, and Derek Dreyer.

## Current maintainer

Anton Trunov (@anton-trunov)

## License

[GNU General Public License v3](https://www.gnu.org/licenses/gpl.html)

# Dependencies

The following requirements should be met in order to compile the project:
- Coq v8.8
- Mathcomp v1.6.2 or greater (mathcomp/ssreflect package suffices)

# Building instructions

```shell
git clone https://github.com/coq-community/lemma-overloading
cd lemma-overloading
make   # or make -j <number-of-cores-on-your-machine>
```


# Files described in the paper

## `indom.v`

This file contains the indomR lemma from Section 3 "A simple overloaded lemma"

## `terms.v`, `xfind.v`, `cancel.v`, `cancelD.v`, `cancel2.v`

These files prove the `cancelR` lemma from Section 4 "Reflection: Turning
semantics into syntax". The first one contains the abstract syntax for heaps
along with the lemma `cancel_sound`. `xfind.v` has the xfind structure
to find an element in a list, return its index, and extend the list if the
element is not found. The file `cancel.v` has the main overloaded lemma `cancelR`.
Finally, `cancelD.v` contains the `simplify` lemma from section 4.3 and `cancel2.v`
contains an alternative version of the cancellation function without using
reflection.
 
## `stlogR.v`

File containing a whole bunch of overloaded lemmas to automate the verification
of imperative programs using Hoare Type Theory. The main technicalities in this
file are covered in Section 5 "Solving for functional instances".

## `noalias.v`

File containing all the automated lemmas described in Section 6 "Flexible
composition and application of overloaded lemmas".


# Bonus track

The files below didn't make it to the paper but deserve attention.

## `auto.v`

This file contains an adapted example from VeriML (Stampoulist and Shao),
to automatically prove propositions in a logic with binders.

## `llistR.v`

Verification of a linked list datatype using the "step" overloaded lemma described in Section 5.2.

## `noaliasBT.v`

There are several ways to attack a problem.
Some of them lead to interesting but yet not entirely satisfactory results.
Here are two versions of the `noalias` overloaded lemma with a different look.

## `indomCTC.v`, `xfindCTC.v`, `cancelCTC.v`, `noaliasCTC.v`, `stlogCTC.v` 

These files contains the same automated lemmas as in the files `indom`, `cancel`,
`noalias` and `stlogR`, but done with Coq Type Classes. 

## Note

The files not mentioned in this README file are part of the HTT library,
from [Structuring the Verification of Heap-Manipulating Programs](https://software.imdea.org/~aleks/papers/reflect/reflect.pdf)
by A. Nanevski et al, POPL'10.
