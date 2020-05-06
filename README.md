# blasphemy_script_lang
Odd interpreted language that is transcribed into Java before execution.

## What is this?
Blasphemy Script (BSP) has a really basic looking syntax, but some of the functions for outputs make no sense at first. In fact, most files written in BSP have no real programming language-esque structure aside from the necessity of standard strings ("..."). Although, with how many words are involved, it's obvious this is based on Java.

## What does it look like?
Well, for starters, there's the lex.py file if you're curious about what has been defined. Otherwise, below is a demo<br>
*filename: test.bsp*
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
# References
- Python 3.7
- Java SE 8
