from lex import Lex as Lex;
import os as os;
lex_un = Lex()

# Processes argument with extra carat char with no reason
def process_in(in_file):
    in_file_correct = in_file[1:]
    return in_file_correct

# Creates the file name of the output file
# Outputs are in Java
def gen_name(in_file):
    base = os.path.basename(in_file)
    ind = base.index(".blsp")
    name = base[0 : 1].capitalize() + base[1 : ind] + ".java"
    return name

# High complexity Interpreter, someone help
def parse_file(in_file):
    file_in = process_in(in_file)
    if (is_bsp(file_in) == False):
        return 1

    genned_name = gen_name(file_in)
    with open(file_in, 'r') as file:
        build_struct(in_file)
        out_file = open(genned_name, 'a')
        
        for line in in_file:
            line = file.readline()
            line_dist = line.rsplit()
            for el in line_dist:
                # if the hard coding isn't obvious already, this is generates semicolons
                if (el == ">>>"):
                    out_file.write(";")
                    continue
                
                # Creates "<>" values with keyword part of token
                if (el.startswith("type=")):
                    datatype = el[5:]
                    out_file.write("<" + find_wrapper(datatype) + ">")
                    continue

                # Writes the code
                if (lex_un.get(el) is not None):
                    # Checks for special function notations
                    if (el == "output" or el == "]" or el == "["):
                        out_file.write(lex_un.get(el))
                    else:
                        out_file.write(lex_un.get(el) + " ")
                else:
                    out_file.write(el)
    return 0

# Defines standard construction of Java file with proper class syntax
def build_struct(in_file):
    genned_name = gen_name(in_file)
    name_stop = genned_name.index(".java")
    name = genned_name[0 : name_stop]

    file = open(genned_name, 'w')
    file.write("public class " + name + " {\n")

# Checks validity of input file for .bsp extension
def is_bsp(in_file):
    base = os.path.basename(in_file)
    if (base.endswith(".blsp")):
        return True
    return False

# Converts primitives, assuming utility requires objects
def find_wrapper(datatype):
    types = {
        "num": "Integer",
        "dec": "Double",
        "tf": "Boolean"
    }
    return types.get(datatype)

                