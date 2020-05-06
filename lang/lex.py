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
        # Keywords and functions
        self["open"] = "public"
        self["singular"] = "static"
        self["noret"] = "void"
        self["core"] = "main(String[] args)"
        self["startfun"] = "{ \n \t"
        self["<>"] = "\n}"
        self["output"] = "System.out.println"
        # Code Architecture
        self["#"] = ""
        self["["] = "("
        self["]"] = ")"

    # Method to add to the language during operation, if preferred
    def add_to_lang(self, k, v):
        self.update(k, v)