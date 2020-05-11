# blasphemy_script_lang
Odd interpreted language that is transcribed into Java before execution. It is read on a token by token basis and thus all files will appear with spaces between all forms of syntax.

There are resources that are either available now or in development for language use. To separate what is considered old, current, and planned, below is a key.
|font-format | details         |
|:-----------|:----------------|
|**bold**    | current version |
|*italics*   | planned release |
|plain       | previous version|

**VERSION-UPDATES**
- Version 0.1.0: Initial Copy
- Version 0.1.1: Added function syntax
- Version 0.1.2: Command line script for transcribing and compiling on JVM
- Version 0.1.2.1: Batch commands that can be attached to Path. Requires that the location of the ```blsp-{version}.py``` be attached to path as "BLSP_MAIN". Attaching the folder containing the ```blsp.bat``` allows for the use of ```blsp <file_arg>``` globally.
- Version 0.1.3: Array structures, improved file recognition, additional lexicon mappings.
- **Version 0.1.4: Common utilities mappings, rewrite entry point to fit functionality better. Remove need for keyword arguments to Python base.**
- *Release 1.0.0*: Complete basic lexicon, fixed batch entry compilation and output. 

**BLSP Resources**
- *VS Marketplace Extension*: syntax coloration, some error checking.
- *BLSP Guide*: website with tutorials as well as documentation

## What is this?
Blasphemy Script (BLSP) has a really basic looking syntax, but some of the functions for outputs make no sense at first. In fact, most files written in BLSP have no real programming language-esque structure aside from the necessity of standard strings ("..."). Although, with how many words are involved, it's obvious this is based on Java.

## What does it look like?
*filename: test.blsp*
```
open singular noret core start
output [ 2 ] >>>
end
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
### Windows OS
-> Batch for Windows is out. I'll figure out Bash later.

There are three operable keywords:
- ```debug```: Combines ```export``` with the compilation and execution of the exported file.
- ```export```: Generates only the Java file.
- ```run```: Same function as ```debug``` except Java source file is deleted. Effectively "compiles" the code (even though it did not).

### Unix-based/like OS
Calling ```python blsp-0.1.4.py <file>``` can work with any BLSP file, as long as execution originates in the directory containing the python file. The input file can be either in the same directory or, if not, an absolute path to the file.

The only function available is the equivalent of calling ```blsp <file_name> export``` on Windows.

<---**UPDATES**--->
### Windows
* "debug" feature (previously known as "testcompile" is now working
* Compilation shows proper file names
* Again, the generated Java source and class files will appear in the same directory as the BLSP source file.

## Clarifications
1. ">>>" is a semicolon, if you forget one of the ">", you will get an error in the generated file.
2. The transcripted file doesn't care about Java style. All it cares about is functionality.
3. It doesn't matter how your BLSP file is formatted, just as long as each component has a space in between as the interpreter breaks by singular whitespace characters.
4. You must end every file with "endfile". It calls the final brace for Java generation of classes.
# References
- Python 3.7
- Java SE 8
