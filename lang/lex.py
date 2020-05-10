class Lex(dict):
    def __init__(self):
        #Basic Operands
        self["plus"] = "+"
        self["subt"] = "-"
        self["mult"] = "*"
        self["divi"] = "/"
        self["imod"] = "%"
        # Datatypes
        self["num"] = "int"
        self["word"] = "String"
        self["dec"] = "double"
        # Keywords and functions
        self["open"] = "public"
        self["singular"] = "static"
        self["noret"] = "void"
        self["core"] = "main(String[] args)"
        self["start"] = "{ \n \t"
        self["end"] = "\n}"
        self["output"] = "System.out.println"
        # Code Architecture
        self["#"] = ""
        self["["] = "("
        self["]"] = ")"
        # Version .3 Architecture
        self["array_build"] = "[]"
        self["->"] = "."

    # Method to add to the language during operation, if preferred
    def add_to_lang(self, k, v):
        self.update(k, v)