# Blasphemy Script (BLSP)
An interpreted language developed using Python 3.7.2 that maps to Java source code up to (as far as I know) JDK 11.

Though effectively, it can be the latest version since any object that has methods, when called in BLSP, uses the same name as Java.

## Updates and Plans
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
- **BLSP Guide:** [Wiki](https://github.com/Drakodin/blasphemy_script_lang/wiki)

## What is this?
In more detail, this is an interpreted programming language. What is that? An interpreted language refers to one where the syntax is readily executed, or one that does not compile into instructions. Technically, this language is "compiled" into Java, but it doesn't compile into VM Bytecode or Assembly (though one command can effectively compile it into JVM Bytecode, just not directly).

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

## Additional Notes
* See the Wiki for documentation and more detailed information.

# References
- Python 3.7
- Java SE 8
