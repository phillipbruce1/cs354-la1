Phillip Bruce

CS 354

# LA 1 - Scheme(ing to Pass This Class)

## Function

The tsar (Tree Search And Replace) function searches through a provided Scheme list and replaces all values which match `srch` with `repl`. It works in a recursive manner, calling itself again for each entry. If it finds a value which matches `srch`, it returns `repl` in a pair with `cdr subj` where `subj` is the list to be searched. Each time `repl` is returned, the function `checkRandom` is called on `repl`. `checkRandom` checks for any value in `repl` which evaluates to `'RANDOM`. If one such value is found, `'RANDOM` is replaced with a random value between 0-100.

## Challenges

The biggest challenge was figuring out the syntax of Scheme. The parenthases are confusing, as they make it hard to figure out where a function and its parameters end. Interestingly enough though, I liked the format of calling a function or operation (i.e. `(or case case ...)`) where the operation is delcared first. Overall though, this assignment wasn't too bad. While I wouldn't want to use Scheme for anything bigger than this, it's still a fun little programming language.
