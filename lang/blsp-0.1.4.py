import inter;
import sys;
from subprocess import Popen;
from subprocess import PIPE

def main(argv):
    # Internal call to the interpreter
    inter.parse_file(argv[1])
    return 0
    

if __name__ == "__main__":
    main(sys.argv)