# blasphemy_script_lang
Odd interpreted language that is transcribed into Java before execution.

**VERSION-UPDATES**
- Version 0.1.0: Initial Copy
- Version 0.1.1: Added function syntax

## What is this?
Blasphemy Script (BLSP) has a really basic looking syntax, but some of the functions for outputs make no sense at first. In fact, most files written in BLSP have no real programming language-esque structure aside from the necessity of standard strings ("..."). Although, with how many words are involved, it's obvious this is based on Java.

## What does it look like?
Well, for starters, there's the ```lex.py``` file if you're curious about what has been defined. Otherwise, below is a demo<br>
*filename: test.blsp*
```
open singular noret core
output [ 2 ] >>>
<>
stopcode
```
produces the following code (not spaced, but we all know Java isn't Python so it doesn't care)
```java
public class Test
    public static void main(String[] args) {
        System.out.println(2);
    }
}
```

## How do I run it
Feed a file with the extension ".blsp" into the method into the interpreter. Note that the interpreter isn't the best thing in the world and will default to outputting raw text if the BLSP syntax is incorrect.

I'll attach a script later that calls the function since this was not build with any sort of package manager.

The interpreter accepts either filenames or paths and will export the file to the same directory as the input unless otherwise specified to do so.

## Clarifications
1. ">>>" is a semicolon
2. The transcripted file doesn't care about Java style. All it cares about is functionality
3. If you declare "core" (Java equiv. "main") or any later updates for functions, you must add a "<>" at the end of wherever it ends. That character denotes the end of functions as well as documents which means you must add it at the bottom of every BLSP file.
# References
- Python 3.7
- Java SE 8
